<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ResetPasswordForm */

$this->title = Yii::t('app', 'Reset password');
$this->params['breadcrumbs'][] = $this->title;
?>

<!-- main -->
<main class="main" role="main">

    <section class="reset-password">
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
                <div class="h1 border-bottom"></div>
            </header>
            <div class="row login__forms">
                <div class="col-md-12 pr-xl-12">
                    <?php $form = ActiveForm::begin(['id' => 'login-nala-form']); ?>
                        <div class="form-checkbox" data-login="form">
                            <span class="d-inline-block checkbox checked"></span>
                            <div class="d-inline-block h2">Смена пароля</div>
                        </div>
                        <?= Html::activePasswordInput($model, 'password', ['class' => 'form-control']) ?>
                        <button class="btn btn-info btn-icon" type="submit">
                            <span>Сохранить</span>
                            <i class="material-icons">arrow_forward</i>
                        </button>
                    <?php ActiveForm::end(); ?>
                </div><!-- .col -->
            </div><!-- .row -->
        </div>
    </section>

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('reset-password');
</script>