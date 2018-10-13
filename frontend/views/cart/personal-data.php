<?php

use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;

?>
<!-- main -->
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'active',
                'stepTree' => '',
                'stepFour' => '',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <div class="checkout__client">
                        <div class="row align-items-sm-center">
                            <div class="col-sm-4">
                                <div class="h2">Получатель</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="tab-client-new" data-toggle="tab"
                                       href="#navClientNew" role="tab" aria-controls="navClientNew"
                                       aria-selected="true">Новый покупатель</a>
                                    <a class="nav-item nav-link" id="tab-client-old" data-toggle="tab"
                                       href="#navClientOld" role="tab" aria-controls="navClientOld"
                                       aria-selected="false">Постоянный клиент</a>
                                </div>
                            </div>
                        </div><!-- .row | client forms top -->
                        <div class="tab-content" id="checkoutClientTabs">
                            <div class="tab-pane fade show active" id="navClientNew" role="tabpanel"
                                 aria-labelledby="tab-client-new">
                                <?php $form = ActiveForm::begin(['action' => 'personal-data-checkout','id' => 'register-checkout-form', 'options' => ['class' => 'form-register-checkout']]); ?>
                                <fieldset>
                                    <input name="type" value="0" type="hidden">
                                    <div class="form-group">
                                        <label for="checkoutClientNewName">Ваше имя *</label>
                                        <?= Html::activeTextInput($modelSignUp, 'username', ['class' => 'form-control', 'required' => 'required']) ?>
                                        <?= Html::error($modelSignUp, 'username', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewEmail">Электронный адрес</label>
                                        <?= Html::activeTextInput($modelSignUp, 'email', ['class' => 'form-control', 'required' => 'required']) ?>
                                        <?= Html::error($modelSignUp, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewTel">Телефон</label>
                                        <?= Html::activeTextInput($modelSignUp, 'tel', ['class' => 'form-control', 'required' => 'required']) ?>
                                        <?= Html::error($modelSignUp, 'tel', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    </div>
                                </fieldset><!-- new client form -->
                                <div class="cart-buttons row justify-content-md-end order-md-2">
                                    <div class="col-md-6 order-md-0 text-right">
                                        <button type="submit" class="btn btn-info btn-icon" role="button"
                                           title="Продолжить">
                                            <span>Продолжить</span>
                                            <i class="material-icons">arrow_forward</i>
                                        </button>
                                    </div>
                                </div><!-- .cart-buttons -->
                                <?php ActiveForm::end(); ?>
                            </div><!-- #navClientsNew -->
                            <div class="tab-pane fade" id="navClientOld" role="tabpanel"
                                 aria-labelledby="tab-client-old">
                                <?php $form = ActiveForm::begin(['action' => 'personal-data-checkout', 'id' => 'login-checkout-form', 'options' => ['class' => 'login-checkout-form']]); ?>
                                    <fieldset>
                                        <input name="type" value="0" type="hidden">
                                        <div class="form-group">
                                            <label for="checkoutClientOldEmail">Электронный адрес</label>
                                            <?= Html::activeTextInput($modelLogin, 'email', ['class' => 'form-control', 'required' => 'required']) ?>
                                        </div>
                                        <div class="form-group">
                                            <label for="checkoutClientOldPass">Пароль</label>
                                            <?= Html::activePasswordInput($modelLogin, 'password', ['class' => 'form-control', 'required' => 'required']) ?>
                                        </div>
                                    </fieldset><!-- old client form -->
                                    <div class="d-block">
                                        <button class="btn btn btn-link" data-toggle="modal" data-target="#passSendModal">
                                            <span>Напомнить пароль</span>
                                            <i class="material-icons">navigate_next</i>
                                        </button>
                                    </div>
                                    <div class="social-block d-flex justify-content-between align-items-center">
                                        <span>Или авторизируйтесь с помощью:</span>
                                        <div class="nav" role="list">
                                            <a href="social-link.html" title="social 1" role="listitem"><img
                                                        src="/assets/img/svg/facebook.svg" alt="social 1"></a>
                                            <a href="social-link.html" title="social 2" role="listitem"><img
                                                        src="/assets/img/svg/google-plus.svg" alt="social 2"></a>
                                            <a href="social-link.html" title="social 3" role="listitem"><img
                                                        src="/assets/img/svg/odnoklassniki-logo.svg" alt="social 3"></a>
                                            <a href="social-link.html" title="social 4" role="listitem"><img
                                                        src="/assets/img/svg/vk.svg" alt="social 4"></a>
                                        </div>
                                    </div>
                                    <div class="cart-buttons row justify-content-md-end order-md-2">
                                        <div class="col-md-6 order-md-0 text-right">
                                            <button type="submit" class="btn btn-info btn-icon" role="button"
                                               title="Продолжить">
                                                <span>Продолжить</span>
                                                <i class="material-icons">arrow_forward</i>
                                            </button>
                                        </div>
                                    </div><!-- .cart-buttons -->
                                <?php ActiveForm::end(); ?>
                            </div><!-- #navClientsOld -->
                        </div><!-- .tab-content -->
                    </div><!-- .checkout__client -->
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <div class="checkout__secondary order-md-1">
                        <div class="h2">Стоимость доставки:</div>
                        <div class="text-warning">
                            <p>Внимание, самовыаоз возможен только по предварительной договоренности с менеджером!</p>
                            <br>
                        </div>
                        <?= $setting->cost_delivery ?>
                    </div><!-- .checkout__secondary -->
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