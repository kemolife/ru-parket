<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use common\models\Profile;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->registerCssFile('@web/css/user.css', ['depends' => \frontend\assets\AppAsset::className()]);

$this->title = 'Личные данные';
$this->params['breadcrumbs'][] = ['label' => 'Личный кабинет', 'url' => ['/user/profile']];
$this->params['breadcrumbs'][] = $this->title;

?>



<!-- main -->
<main class="main" role="main">

    <section class="account">
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
            <div class="row">
                <?= $this->render('block/left_sidebar_menu', ['first' => 'active', 'second' => '']) ?>
                <div class="col-lg-10">
                    <div class="h2">Ваши данные:</div>
                    <?php $form = ActiveForm::begin(['id' => 'profile-update']); ?>
                    <?= Html::activeHiddenInput($model, 'user_id', ['value' => Yii::$app->user->id]) ?>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= Yii::$app->user->identity->username ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control"  name="username" value="<?= Yii::$app->user->identity->username ?>" aria-label="Имя" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= Yii::$app->user->identity->email ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="email" class="form-control" name="email" value="<?= Yii::$app->user->identity->email ?>" aria-label="email">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $address->phone ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="tel" class="form-control" name="phone" value="<?= $address->phone ?>" aria-label="Phone">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                        </div><!-- .col -->
                        <div class="col-md-6">
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $address->province0->name ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="province" value="<?= $address->province0->name ?>" aria-label="Регион">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $address->city0->name ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="city" value="<?= $address->city0->name ?>" aria-label="Населенный пункт">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $address->address ?></span>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="address" value="<?= $address->address ?>" aria-label="Адресс">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                        </div><!-- .col -->
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <div class="h2">Сменить пароль</div>
                                <div class="form-group">
                                    <label for="checkoutClientOldPass">Старый пароль</label>
                                    <?= Html::activePasswordInput($modelChangePass, 'oldpassword', ['class' => 'form-control']) ?>
                                </div>
                                <div class="form-group">
                                    <label for="accountClientNewPass">Новый пароль</label>
                                    <?= Html::activePasswordInput($modelChangePass, 'password', ['class' => 'form-control']) ?>
                                </div>
                                <div class="form-group">
                                    <label for="accountClientNewPassRepeat">Подтвердите пароль</label>
                                    <?= Html::activePasswordInput($modelChangePass, 'repassword', ['class' => 'form-control']) ?>
                                </div>
                                <?= Yii::$app->getSession()->getFlash('success') ?><?= Html::error($modelChangePass, 'oldpassword'); ?><?= Html::error($modelChangePass, 'password'); ?><?= Html::error($modelChangePass, 'repassword'); ?>
                                <div class="d-block my-3">
                                    <button class="btn btn-info btn-icon" type="submit">
                                        <span>Сохранить</span>
                                        <i class="material-icons">arrow_forward</i>
                                    </button>
                                </div>
                        </div><!-- .col -->
                    </div>
                    <?php ActiveForm::end(); ?>
                </div><!-- .col -->
            </div><!-- .row -->
        </div>
    </section>

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-account');
</script>
