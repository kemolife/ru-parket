<?php

use frontend\models\SignupForm;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $modelSignUp SignupForm */
?>

<div class="col-md-6 pl-xl-5">
    <?php $form = ActiveForm::begin(['id' => 'registration-form', 'options' => ['class' => 'form-registration']]); ?>
    <div class="form-checkbox" data-login="form">
        <span class="d-inline-block checkbox"></span>
        <div class="d-inline-block h2">Новый покупатель</div>
    </div>
    <fieldset disabled>
        <div class="form-group">
            <label for="checkoutClientNewName">Ваше имя *</label>
            <?= Html::activeTextInput($modelSignUp, 'username', ['class' => 'form-control', 'required' => 'required']) ?>
        </div>
        <div class="form-group">
            <label for="checkoutClientNewEmail">Электронный адрес</label>
            <?= Html::activeTextInput($modelSignUp, 'email', ['class' => 'form-control', 'required' => 'required']) ?>
        </div>
        <div class="form-group">
            <label for="checkoutClientNewTel">Телефон</label>
            <?= Html::activeTextInput($modelSignUp, 'tel', ['class' => 'form-control', 'required' => 'required']) ?>
        </div>
        <div class="form-group">
            <label for="checkoutClientNewPass">Пароль</label>
            <?= Html::activePasswordInput($modelSignUp, 'password', ['class' => 'form-control', 'required' => 'required']) ?>
        </div>
        <?= Html::error($modelSignUp, 'username'); ?><?= Html::error($modelSignUp, 'email'); ?><?= Html::error($modelSignUp, 'tel'); ?><?= Html::error($modelSignUp, 'password'); ?>
        <div class="d-block my-3">
            <button class="btn btn-info btn-icon" type="submit">
                <span>Зарегистрироваться</span>
                <i class="material-icons">arrow_forward</i>
            </button>
        </div>
    </fieldset><!-- new client form -->
    <?php ActiveForm::end(); ?>
</div><!-- .col -->