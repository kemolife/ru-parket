<?php

namespace frontend\controllers;

use common\models\Address;
use common\models\Cart;
use common\models\Category;
use common\models\Coupon;
use common\models\LoginForm;
use common\models\Order;
use common\models\OrderLog;
use common\models\OrderProduct;
use common\models\PointLog;
use common\models\Product;
use common\models\Profile;
use common\models\Settings;
use common\models\User;
use frontend\helpers\CustomHelper;
use frontend\models\SignupForm;
use Yii;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class CartController extends \frontend\components\Controller
{
    public $layout = 'mainSimple';

//    public function behaviors()
//    {
//        return [
//            'access' => [
//                'class' => AccessControl::className(),
//                'only' => ['checkout', 'address', 'pay', 'cod', 'json-coupon'],
//                'rules' => [
//                    [
//                        'actions' => ['checkout', 'address', 'pay', 'cod', 'json-coupon'],
//                        'allow' => true,
//                        'roles' => ['@']
//                    ]
//                ]
//            ],
//        ];
//    }

    public function actionIndex()
    {
        Yii::$app->session['step'] = 1;

        if (Yii::$app->request->get('type') && Yii::$app->request->get('product_id')) {
            $type = Yii::$app->request->get('type');
            $productId = Yii::$app->request->get('product_id');
            $product = Product::findOne($productId);
            $cartProduct = Cart::find()->where(['session_id' => Yii::$app->session->id, 'product_id' => $productId])->one();

            if ($type == 'minus' && $cartProduct->number > 1) {
                Cart::updateAllCounters(['number' => -1], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            } elseif ($type == 'add' && $cartProduct->number < $product->stock) {
                Cart::updateAllCounters(['number' => 1], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            } elseif ($type == 'change' && Yii::$app->request->get('value')) {
                $productId = Yii::$app->request->get('change');
                $value = Yii::$app->request->get('value');
                Cart::updateAll(['number' => $value], ['session_id' => Yii::$app->session->id, 'product_id' => $productId]);
            }
            Cart::deleteAll('number <= 0');
            return;
        }

        $products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();
        $sameCategories = Category::getSameCatForProducts($products);
        $setting = Settings::find()->one();
        if (count($products)) {
            return $this->render('index', [
                'products' => $products,
                'sameCategories' => $sameCategories,
                'setting' => $setting,
            ]);
        } else {
            return $this->render('cart-no-product', [
                'products' => $products,
            ]);
        }
    }

    public function actionCheckout()
    {
        $products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();

        if (!count($products)) {
            return $this->redirect('/cart');
        }

        Yii::$app->session['step'] = 3;

        $userId = Yii::$app->user->id;

        $model = new Order();

        if ($model->load(Yii::$app->request->post())) {
            if (!Yii::$app->request->post('address_id')) {
                return $this->goBack();
            }

            $feeCouponUser = $feeCouponCode = $feePoint = 0.00;
            $couponId = Yii::$app->request->post('coupon');
            if ($couponId && Yii::$app->request->post('checkbox-coupon')) {
                $couponUser = Coupon::findOne($couponId);
                if (!$couponUser || $couponUser->used_at > 0 || $couponUser->ended_at < time() || $couponUser->user_id != Yii::$app->user->id) {
                    return $this->goBack();
                }
                $feeCouponUser = $couponUser->money;
            }

            $sn = Yii::$app->request->post('sn');
            if ($sn) {
                $couponCode = Coupon::find()->where(['sn' => $sn])->one();
                if (!$couponCode || $couponCode->used_at > 0 || $couponCode->ended_at < time()) {
                    return $this->goBack();
                }
                $feeCouponCode = $couponCode->money;
            }

            $point = Yii::$app->request->post('point');
            if ($point && Yii::$app->request->post('checkbox-point')) {
                if ($point > Yii::$app->user->identity->point) {
                    return $this->goBack();
                }
                $feePoint = intval($point) / 100;
            }

            $address = Address::find()->where(['id' => Yii::$app->request->post('address_id'), 'user_id' => $userId])->one();
            $model->user_id = $userId;
            $model->sn = date('YmdHis') . rand(1000, 9999);
            $model->consignee = $address->consignee;
            $model->country = $address->country;
            $model->province = $address->province;
            $model->city = $address->city;
            $model->district = $address->district;
            $model->address = $address->address;
            $model->zipcode = $address->zipcode;
            $model->phone = $address->phone;
            $model->mobile = $address->mobile;
            $model->email = $address->email ? $address->email : Yii::$app->user->identity->email;
            if ($model->payment_method == Order::PAYMENT_METHOD_COD) {
                $model->payment_status = Order::PAYMENT_STATUS_COD;
            } else {
                $model->payment_status = Order::PAYMENT_STATUS_UNPAID;
            }
            $model->status = $model->payment_status;

            $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
            if (count($products)) {
                foreach ($products as $product) {
                    $model->amount += $product->number * $product->price;
                }
            } else {
                $this->redirect('/cart');
            }
            $model->amount += floatval($model->shipment_fee) - $feeCouponUser - $feeCouponCode - $feePoint;

            if ($model->save()) {
                // insert order_product and clear cart
                foreach ($products as $product) {
                    $orderProduct = new OrderProduct();
                    $orderProduct->order_id = $model->id;
                    $orderProduct->product_id = $product->product_id;
                    $orderProduct->sku = $product->sku;
                    $orderProduct->name = $product->name;
                    $orderProduct->number = $product->number;
                    $orderProduct->market_price = $product->market_price;
                    $orderProduct->price = $product->price;
                    $orderProduct->thumb = $product->thumb;
                    $orderProduct->type = $product->type;

                    $orderProduct->save();

                    Product::updateAllCounters(['stock' => -$product->number], ['id' => $product->product_id]);
                }

                Cart::deleteAll(['session_id' => Yii::$app->session->id]);
                if (isset($couponUser) && Yii::$app->request->post('checkbox-coupon')) {
                    $couponUser->used_at = time();
                    $couponUser->order_id = $model->id;
                    $couponUser->save();
                }
                if (isset($couponCode) && Yii::$app->request->post('checkbox-coupon')) {
                    $couponCode->user_id = Yii::$app->user->id;
                    $couponCode->used_at = time();
                    $couponCode->order_id = $model->id;
                    $couponCode->save();
                }
                if (isset($point) && Yii::$app->request->post('checkbox-point')) {
                    $balance = Yii::$app->user->identity->point - $point;
                    User::updateAllCounters(['point' => -$point], ['id' => Yii::$app->user->id]);
                    $pointLog = new PointLog([
                        'user_id' => Yii::$app->user->id,
                        'type' => PointLog::POINT_TYPE_BUYING,
                        'point' => -$point,
                        'balance' => $balance,
                    ]);
                    $pointLog->save();
                }

                $orderLog = new OrderLog([
                    'order_id' => $model->id,
                    'status' => $model->status,
                ]);
                $orderLog->save();

                if ($model->payment_method == Order::PAYMENT_METHOD_COD) {
                    return $this->redirect(['cart/cod',
                        'id' => $model->id,
                    ]);
                } else {
                    return $this->redirect(['cart/pay',
                        'sn' => $model->sn,
                    ]);

                }
            }

        }

        if(Yii::$app->user->identity instanceof User){
            return $this->redirect('pay-and-address');
        }else{
            return $this->redirect('personal-data-checkout');
        }
    }

    public function actionPayAndAddress()
    {
        $user = Yii::$app->user->identity;
        if(false === $user instanceof User) {
            return $this->redirect('personal-data-checkout');
        }
        $profile = Profile::findOne($user->getId());
        $products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();
        $model = new Order();

        $address = Address::find()->where(['user_id' => $user->getId()])->one();
        if(null === $address){
            $address = new Address();
        };

        if($address->load(Yii::$app->request->post()) && $address->validate()){
            try {
                $address->consignee = 'admin';
                $address->user_id = $user->getId();
                $address->save(false);
                $model->user_id = $user->id;
                $model->full_name = $profile->name . ' ' . $profile->surname;
                $model->sn = date('YmdHis') . rand(1000, 9999);
                $model->consignee = $address->consignee;
                $model->country = 1;
                $model->province = $address->province;
                $model->city = $address->city;
                $model->district = $address->district;
                $model->address = $address->address;
                $model->zipcode = $address->zipcode;
                $model->phone = $profile->phone;
                $model->mobile = $profile->phone;
                $model->email = $user->email;
                if ($pay = Yii::$app->request->post()['Pay']) {
                    $model->payment_method = $pay['type'];
                    $model->payment_status = Order::PAYMENT_STATUS_UNPAID;
                }
                if($delivery = Yii::$app->request->post()['deliveryMethod']){
                    $model->shipment_id = $delivery;
                }
                $model->status = Order::PAYMENT_STATUS_NOT_CONFIRM;

                $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
                if (count($products)) {
                    foreach ($products as $product) {
                        $model->amount += $product->number * $product->price;
                    }
                } else {
                    $this->redirect('/cart');
                }
                $model->amount += floatval($model->shipment_fee);

                if ($model->save()) {

                    // insert order_product and clear cart
                    foreach ($products as $product) {
                        $orderProduct = new OrderProduct();
                        $orderProduct->order_id = $model->id;
                        $orderProduct->user_id = $user->getId();
                        $orderProduct->product_id = $product->product_id;
                        $orderProduct->sku = $product->sku;
                        $orderProduct->name = $product->name;
                        $orderProduct->number = $product->number;
                        $orderProduct->market_price = $product->market_price;
                        $orderProduct->price = $product->price;
                        $orderProduct->thumb = $product->thumb;
                        $orderProduct->type = $product->type;

                        $orderProduct->save();

                        Product::updateAllCounters(['stock' => -$product->number], ['id' => $product->product_id]);
                    }

                    Cart::deleteAll(['session_id' => Yii::$app->session->id]);

                    $orderLog = new OrderLog([
                        'order_id' => $model->id,
                        'status' => $model->status,
                    ]);
                    $orderLog->save();

                    return $this->redirect('confirmation');
                }
            }catch (\Exception $e){
                var_dump($e->getMessage());
            }
        }

        return $this->render('pay-and-address', [
            'model' => $model,
            'products' => $products,
            'address' => $address
        ]);
    }

    public function actionConfirmation()
    {
        $user = Yii::$app->user->identity;
        if(false === ($user instanceof User)) {
            return $this->redirect('personal-data-checkout');
        }
        $order = Order::find()->where(['user_id' => $user->getId()])->orderBy('created_at DESC')->one();
        if(null === $order){
            return $this->redirect('personal-data-checkout');
        }
        if($order->status === Order::PAYMENT_STATUS_UNPAID){
            return $this->redirect('/order');
        }

        $orderProducts = OrderProduct::find()->where(['order_id' => $order->id])->all();
        if($order->load(Yii::$app->request->post()) && $order->validate()){
            $order->status = Order::PAYMENT_STATUS_UNPAID;
            if($order->save(false)){

                return $this->render('final-order', [
                    'order' => $order
                ]);
            }
        }

        return $this->render('confirmation', [
            'products' => $orderProducts,
            'order' => $order,
        ]);
    }

    public function actionPersonalDataCheckout()
    {
        $products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();
        $model = new Order();

        $modelSignUp = new SignupForm();
        if ($modelSignUp->load(Yii::$app->request->post())) {
            $products = Cart::find()->where(['session_id' => Yii::$app->session->id])->all();
            $modelSignUp->password = CustomHelper::getrandomPassword();
            if ($user = $modelSignUp->signup()) {
                if (count($products)) {
                    foreach ($products as $product){
                        $product->user_id = $user->id;
                        $product->session_id = Yii::$app->session->regenerateID();
                        $product->save(false);
                    }
                }
                if (Yii::$app->getUser()->login($user)) {
                    return $this->redirect('checkout');
                }
            }
        }


        $modelLogin = new LoginForm();
        if ($modelLogin->load(Yii::$app->request->post()) && $modelLogin->login()) {
            return $this->redirect('checkout');
        }

        return $this->render('personal-data', [
            'model' => $model,
            'products' => $products,
            'modelSignUp' => $modelSignUp,
            'modelLogin' => $modelLogin,
        ]);
    }

    public function actionAddress($id = null)
    {
        $setting = Settings::find()->one();
        if ($id) {
            $model = Address::findOne($id);
            if ($model === null)
                throw new NotFoundHttpException('model does not exist.');
        } else {
            $model = new Address();
        }

        if ($model->load(Yii::$app->request->post())) {
            $model->user_id = Yii::$app->user->id;
            if ($model->save())
                return $this->redirect(['cart/checkout']);
        }

        return $this->render('address', [
            'model' => $model,
            'setting' => $setting
        ]);
    }

    public function actionPay($sn)
    {
        Yii::$app->session['step'] = 2;

        $model = Order::find()->where(['sn' => $sn])->one();
        if ($model === null)
            throw new NotFoundHttpException('model does not exist.');

        return $this->render('pay', [
            'model' => $model,
        ]);
    }

    public function actionCod($id)
    {
        Yii::$app->session['step'] = 3;

        $model = Order::find()->where(['id' => $id])->one();
        if ($model === null)
            throw new NotFoundHttpException('model does not exist.');

        return $this->render('cod', [
            'model' => $model,
        ]);
    }

    public function actionAddToCart($id)
    {
        Yii::$app->session['step'] = 1;

//        if (!$id)
        $this->redirect(['/cart']);

//        return $this->render('add-to-cart', [
//            'id' => $id,
//        ]);
    }

    public function actionDelete($id)
    {
        Cart::deleteAll(['session_id' => Yii::$app->session->id, 'product_id' => $id]);
        $this->redirect(['/cart']);
    }

    public function actionDestroy()
    {
        Cart::deleteAll(['session_id' => Yii::$app->session->id]);
        $this->goHome();
    }

    public function actionJsonList()
    {
        $totalNumber = 0;
        $totalPrice = 0;
        $products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->asArray()->all();
        foreach ($products as $product) {
            $totalNumber += $product['number'];
            $totalPrice += $product['number'] * $product['price'];
        }

        Yii::$app->response->format = Response::FORMAT_JSON;
        return [
            'status' => 1,
            'totalNumber' => $totalNumber,
            'totalPrice' => $totalPrice,
            'data' => $products,
        ];
    }

    public function actionJsonCoupon()
    {
        $products = Cart::find()->where(['user_id' => Yii::$app->user->id])->all();
        $totalProduct = $totalPrice = 0;
        foreach ($products as $product) {
            $totalProduct += $product->number;
            $totalPrice += $product->number * $product->price;
        }

        $coupons = Coupon::find()->where(['and', 'user_id = ' . Yii::$app->user->id, 'min_amount < ' . $totalPrice, 'used_at = 0'])->asArray()->all();
        foreach ($coupons as $k => $item) {
            $coupons[$k]['ended_time'] = date('Y-m-d', $item['ended_at']);
        }

        Yii::$app->response->format = Response::FORMAT_JSON;
        return [
            'status' => 1,
            'count' => count($coupons),
            'data' => $coupons,
        ];
    }

    public function actionAjaxCouponCode($sn)
    {
        $sn = trim($sn);
        Yii::$app->response->format = Response::FORMAT_JSON;

        if (!$sn) {
            return ['status' => -1];
        }

        $coupon = Coupon::find()->where(['sn' => $sn])->one();
        if (!$coupon) {
            return ['status' => -1];
        }

        if ($coupon->used_at > 0) {
            return ['status' => -2];
        } elseif ($coupon->ended_at < time()) {
            return ['status' => -3];
        }

        return [
            'status' => 1,
            'sn' => $coupon->sn,
            'money' => $coupon->money,
        ];
    }

    public function actionAjaxAdd()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $productId = Yii::$app->request->post('productId');
        $number = Yii::$app->request->post('number');
        if ($productId && $number) {
            if ($cart = Cart::find()->where(['and', 'product_id=' . $productId, ['or', 'session_id="' . Yii::$app->session->id . '"', 'user_id=' . Yii::$app->user->isGuest ? 0 : Yii::$app->user->id]])->one()) {
                $product = Product::findOne($productId);
                if ($cart->number + $number <= $product->stock) {
                    $cart->updateAllCounters(['number' => $number], ['and', 'product_id=' . $productId, ['or', 'session_id="' . Yii::$app->session->id . '"', 'user_id=' . Yii::$app->user->isGuest ? 0 : Yii::$app->user->id]]);
                    return [
                        'status' => 1,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                } else {
                    return [
                        'status' => -2,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                }
            } elseif ($model = Product::findOne($productId)) {
                if ($model->stock >= $number) {
                    $cart = new Cart();
                    $cart->session_id = Yii::$app->session->id;
                    $cart->user_id = Yii::$app->user->isGuest ? 0 : Yii::$app->user->id;
                    $cart->product_id = $productId;
                    $cart->number = $number;
                    $cart->sku = $model->sku;
                    $cart->name = $model->name;
                    $cart->market_price = $model->market_price;
                    $cart->price = $model->price;
                    $cart->thumb = $model->thumb;
                    $cart->type = $model->type;

                    $cart->save();

                    return [
                        'status' => 1,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                } else {
                    return [
                        'status' => -2,
                        'productId' => $productId,
                        'number' => $number,
                    ];
                }
            }
        }

        return [
            'status' => -1,
            'productId' => $productId,
            'number' => $number,
        ];

    }

}
