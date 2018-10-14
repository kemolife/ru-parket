<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $modelLogin \common\models\LoginForm */

$this->title = 'Личный кабинет';
$this->params['breadcrumbs'][] = $this->title;
?>

<!-- main -->
<main class="main" role="main">

    <section class="login">
        <div class="container">
            <nav aria-label="hidden__down--md breadcrumb">
                <?= \yii\widgets\Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    'options' => ['class' => 'breadcrumb'],
                    'tag' => 'div',
                    'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
                    'activeItemTemplate' => '<li class="breadcrumb-item active" aria-current="page">{link}</li>',
                ]) ?>
            </nav>
            <header class="page-title text-center">
                <div class="h1 border-bottom"><?= $this->title ?></div>
            </header>
            <div class="row login__forms">
                <div class="col-md-6 pr-xl-5">
                    <?php $form = ActiveForm::begin(['id' => 'login-form', 'options' => ['class' =>'form-login']]); ?>
                        <div class="form-checkbox" data-login="form">
                            <span class="d-inline-block checkbox checked"></span>
                            <div class="d-inline-block h2">Постоянный клиент</div>
                        </div>
                        <fieldset>
                            <div class="form-group">
                                <label for="checkoutClientOldEmail">Электронный адрес</label>
                                <?= Html::activeTextInput($modelLogin, 'email', ['class' => 'form-control', 'required' => 'required']) ?>
                                <?= Html::error($modelLogin, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
                            </div>
                            <div class="form-group">
                                <label for="checkoutClientOldPass">Пароль</label>
                                <?= Html::activePasswordInput($modelLogin, 'password', ['class' => 'form-control', 'required' => 'required']) ?>
                                <?= Html::error($modelLogin, 'password', ['tag' => 'small', 'class' => 'text-danger']); ?>
                            </div>
                            <div class="d-block">
                                <button type="button" class="btn btn btn-link" data-toggle="modal" data-target="#passRemindModal">
                                    <span>Забыли пароль?</span>
                                    <i class="material-icons">navigate_next</i>
                                </button>
                            </div>
                            <div class="d-block my-3">
                                <button class="btn btn-info btn-icon" type="submit">
                                    <span>Войти</span>
                                    <i class="material-icons">arrow_forward</i>
                                </button>
                            </div>
                        </fieldset><!-- old client form -->
<!--                        <div class="social-block d-flex align-items-center">-->
<!--                            <span class="social-block-title">Или авторизируйтесь с помощью:</span>-->
<!--                            <div class="nav" role="list">-->
<!--                                <a href="social-link.html" title="social 1" role="listitem"><img src="/assets/img/svg/facebook.svg" alt="social 1"></a>-->
<!--                                <a href="social-link.html" title="social 2" role="listitem"><img src="/assets/img/svg/google-plus.svg" alt="social 2"></a>-->
<!--                                <a href="social-link.html" title="social 3" role="listitem"><img src="/assets/img/svg/odnoklassniki-logo.svg" alt="social 3"></a>-->
<!--                                <a href="social-link.html" title="social 4" role="listitem"><img src="/assets/img/svg/vk.svg" alt="social 4"></a>-->
<!--                            </div>-->
<!--                        </div>-->
                    <?php ActiveForm::end(); ?>
                </div><!-- .col -->
                <?= $this->render('signup', ['modelSignUp' => $modelSignUp]) ?>
            </div><!-- .row -->
        </div>
    </section>

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-login');
</script>
