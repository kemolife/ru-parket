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
                                    <span data-profile="setData"><?= $model->name ?></span>
                                    <?= Html::error($model, 'name', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($model, 'name', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $user->email ?></span>
                                    <?= Html::error($user, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($user, 'email', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $model->phone ?></span>
                                    <?= Html::error($model, 'phone', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($model, 'phone', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
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
                                    <span data-profile="setData"><?= \common\models\Region::findOne(['id' => $address->province])->name ?></span>
                                    <?= Html::error($address, 'province', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
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
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= \common\models\Region::findOne(['id' => $address->city])->name ?></span>
                                    <?= Html::error($address, 'city', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeDropDownList($address, 'city',
                                            $address->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $address->province])->all(), 'id', 'name')
                                                : ['' => 'Населенный пункт'],
                                            [
                                                'class' => 'custom-select',
                                            ]);
                                        ?>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button"><i class="material-icons align-self-center">done</i></button>
                                        </div>
                                    </div>
                                </div><!-- .form -->
                            </div><!-- .account__data--item -->
                            <div class="account__data--item border-bottom mb-3">
                                <div class="checkout__confirm--value" data-profile="edit">
                                    <span data-profile="setData"><?= $address->address ?></span>
                                    <?= Html::error($address, 'address', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                    <div class="d-inline-block">
                                        <button class="btn btn-link" type="button">
                                            <span></span>
                                            <i class="material-icons">create</i>
                                        </button>
                                    </div>
                                </div><!-- [data-profile] -->
                                <div class="collapse form">
                                    <div class="input-group mb-3">
                                        <?= Html::activeTextInput($address, 'address', ['class' => 'form-control', 'aria-describedby' => 'basic-addon2']) ?>
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
                                    <?= Html::error($modelChangePass, 'oldpassword', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                </div>
                                <div class="form-group">
                                    <label for="accountClientNewPass">Новый пароль</label>
                                    <?= Html::activePasswordInput($modelChangePass, 'password', ['class' => 'form-control']) ?>
                                    <?= Html::error($modelChangePass, 'password', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                </div>
                                <div class="form-group">
                                    <label for="accountClientNewPassRepeat">Подтвердите пароль</label>
                                    <?= Html::activePasswordInput($modelChangePass, 'repassword', ['class' => 'form-control']) ?>
                                    <?= Html::error($modelChangePass, 'repassword', ['tag' => 'small', 'class' => 'text-danger']); ?>
                                </div>
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
