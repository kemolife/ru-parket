<?php
namespace common\widgets;

use common\models\BlogPost;
use common\models\Cart;
use common\models\StatusBlog;
use Yii;
use yii\base\Widget;
use yii\helpers\Html;

class BasketModal extends Widget
{
    public $products;
    public $title;

    public function init()
    {
        parent::init();

        if ($this->title === null) {
            $this->title = 'Корзина';
        }
        $this->products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();
    }

    private function totalNumber()
    {
        $totalPrice = 0;
        if($this->products) {
            foreach ($this->products as $product) {
                $totalPrice += $product->number * $product->price;
            }
        }
        return $totalPrice;
    }

    public function run()
    {
        return $this->render('basket-modal', [
            'title' => $this->title,
            'products' => $this->products,
            'totalPrice' => $this->totalNumber(),
            'urlCheckout' => Yii::$app->urlManager->createUrl(['cart/checkout']),
            'catalog' => Yii::$app->urlManager->createUrl(['category/catalog'])
        ]);
    }
}
