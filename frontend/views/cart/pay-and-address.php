<?php

use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
$this->registerCssFile('', ['depends' => \frontend\assets\AppAsset::className()]);
?>
<!-- main -->
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'completed',
                'stepTree' => 'active',
                'stepFour' => '',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <div class="h2">Выберите способ оплаты:</div>
                    <?php $form = ActiveForm::begin(['id' => 'pay-address-form', 'method' => 'POST', 'options' => ['class' => 'form-pay-address']]); ?>
                    <fieldset>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod1" name="Pay[type]" value="1" class="checkbox"
                                   checked>
                            <label class="" for="checkPaymentMethod1"><span class="icon d-inline-block"><img
                                            src="/img/svg/opt/wallet.svg" class="img-fluid" alt=""></span><span>Наличные при получении товара</span></label>
                        </div>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod2" name="Pay[type]" value="2" class="checkbox">
                            <label class="" for="checkPaymentMethod2"><span class="icon d-inline-block"><img
                                            src="/img/svg/opt/document.svg" class="img-fluid" alt=""></span><span>Оплата по счету (счет отдельно выставляется менеджером)</span></label>
                        </div>
                        <div class="form-checkbox custom-control my-2">
                            <input type="radio" id="checkPaymentMethod3" name="Pay[type]" value="3" class="checkbox">
                            <label class="" for="checkPaymentMethod3"><span class="icon d-inline-block"><img
                                            src="/img/svg/opt/wallet1.svg" class="img-fluid" alt=""></span><span>Безналичный расчет</span></label>
                        </div>
                    </fieldset>
                    <div class="h2">Способ доставки</div>
                    <fieldset>
                        <div class="form-group">
                            <?= Html::activeDropDownList($address, 'province',
                                ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => 1])->all(), 'id', 'name'),
                                [
                                    'prompt' => 'Ваш регион',
                                    'class' => 'custom-select',
                                    'onchange' => '
                                    $.post( "' . Yii::$app->urlManager->createUrl('region/ajax-list-child?id=') . '"+$(this).val(), function( data ) {
                                      $( "select#address-city" ).html( data );
                                    });'
                                ]); ?>
                        </div>
                        <div class="form-group">
                            <?= Html::activeDropDownList($address, 'city',
                                $address->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $address->province])->all(), 'id', 'name')
                                    : ['' => 'Населенный пункт'],
                                [
                                    'class' => 'custom-select',
                                ]);
                            ?>
                        </div>
                        <div class="form-group">
                            <label for="checkoutDeliveryAddress">Адрес *</label>
                            <?= Html::activeTextInput($address, 'address', ['class' => 'form-control']) ?>
                            <?= Html::error($address, 'address', ['tag' => 'small', 'class' => 'text-danger']); ?>
                        </div>
                        <div class="form-group">
                            <select class="custom-select" id="deliveryMethod" name="deliveryMethod" required>
                                <option selected>Способ доставки</option>
                                <?php foreach (\common\models\Order::$shipmentMethods as $key => $method) { ?>
                                    <option value="<?= $key ?>"><?= $method ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </fieldset>
                    <div class="cart-buttons row justify-content-md-end order-md-2">
                        <div class="col-md-6 order-md-0">
                            <button type="submit" class="btn btn-info btn-icon" role="button" title="Продолжить">
                                <span>Продолжить</span>
                                <i class="material-icons">arrow_forward</i>
                            </button>
                        </div>
                    </div><!-- .cart-buttons -->
                    <?php ActiveForm::end(); ?>
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <?= $this->render('part/your-order', ['products' => $products]) ?>
                </div>
            </div><!-- .checkout__body -->
        </div>
    </section><!-- .cart -->

</main>
<!-- Backend - this will replaced with backend function to add class -->

<script>
    document.querySelector('.page').classList.add('page-checkout');
</script>
