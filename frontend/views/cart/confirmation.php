<?php

use common\models\Order;
use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
$this->registerCssFile('', ['depends' => \frontend\assets\AppAsset::className()]);
?>
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'completed',
                'stepTree' => 'completed',
                'stepFour' => 'active',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <?php $form = ActiveForm::begin(['id' => 'edit-order-form', 'method' => 'POST', 'options' => ['class' => 'form-edit-order']]); ?>
                    <div class="h2">Проверьте внесенные данные:</div>
                    <div class="checkout__confirm">
                        <ul class="checkout__confirm--data">
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $order->full_name ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" value="Имя Фамилия Отчество"
                                               aria-label="Имя" aria-describedby="basic-addon2">
                                        <?= Html::activeTextInput($order, 'full_name', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <?= Html::error($order, 'full_name', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $order->email ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($order, 'email', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <?= Html::error($order, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $order->mobile ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($order, 'mobile', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <?= Html::error($order, 'mobile', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= \common\models\Region::findOne(['id' => $order->province])->name ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeDropDownList($order, 'province',
                                            ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => 1])->all(), 'id', 'name'),
                                            [
                                                'prompt' => 'Ваш регион',
                                                'class' => 'custom-select',
                                                'onchange' => '
                                    $.post( "' . Yii::$app->urlManager->createUrl('region/ajax-list-child?id=') . '"+$(this).val(), function( data ) {
                                      $( "select#order-city" ).html( data );
                                    });'
                                            ]); ?>
                                        <?= Html::error($order, 'province', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= \common\models\Region::findOne(['id' => $order->city])->name ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeDropDownList($order, 'city',
                                            $order->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $order->province])->all(), 'id', 'name')
                                                : ['' => 'Населенный пункт'],
                                            [
                                                'class' => 'custom-select',
                                            ]);
                                        ?>
                                        <?= Html::error($order, 'city', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $order->address ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($order, 'address', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <?= Html::error($order, 'address', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="checkout__confirm--item">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= Order::$shipmentMethods[$order->shipment_id] ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div>
                                <div action="" class="collapse form">
                                    <div class="input-group mb-3">
                                        <select class="custom-select" id="Order[shipment_id]" required>
                                            <?php foreach (\common\models\Order::$shipmentMethods as $key => $method) { ?>
                                                <option value="<?= $key ?>"><?= $method ?></option>
                                            <?php } ?>
                                        </select>
                                        <?= Html::error($order, 'shipment_id', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i
                                                        class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div><!-- .checkout__confirm -->
                    <div class="cart-buttons row justify-content-md-end order-md-2">
                        <div class="col-md-6 order-md-0 text-xl-right">
                            <button type="submit" class="btn btn-info btn-icon">
                                <span>Заказ подтверждаю</span>
                                <i class="material-icons">done</i>
                            </button>
                        </div>
                    </div><!-- .cart-buttons -->
                    <?php ActiveForm::end(); ?>
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <?= $this->render('part/your-order', ['products' => $products]) ?>
                </div><!-- .checkout__body -->
            </div>
    </section><!-- .cart -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-checkout');
</script>