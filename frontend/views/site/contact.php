<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

$this->title = 'Contact';
$this->params['breadcrumbs'][] = $this->title;
$lat = explode(',', $setting->lat_log)[0];
$log = explode(',', $setting->lat_log)[1];
?>
<!-- main -->
<main class="main" role="main">

    <div class="container contacts">
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
            <div class="h1 border-bottom">Контакты</div>
        </header>
        <div class="row">
            <?= $this->render('block/left_sidebar_menu') ?>
            <div class="col-lg-10">
                <div class="row contacts__body">
                    <div class="col-12 contacts__top">
                        <div class="row">
                            <div class="col-sm-6 contacts__item">
                                <div class="d-flex align-items-center">
                                    <div class="contacts__item--icon">
                                        <i class="material-icons" aria-hidden="true">phone</i>
                                    </div>
                                    <div class="contacts__item--content">
                                        <p><?= $setting->phone ?></p>
                                        <a href="tel:<?= $setting->phone ?>" class="border-bottom border-dark" title="tel">Заказать обратный звонок</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 contacts__item">
                                <div class="d-flex align-items-center">
                                    <div class="contacts__item--icon">
                                        <i class="material-icons" aria-hidden="true">mail</i>
                                    </div>
                                    <div class="contacts__item--content">
                                        <a href="mail:info@ru-parket.ru" class="" title="email"><?= $setting->email ?></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 contacts__item">
                                <div class="d-flex align-items-center">
                                    <div class="contacts__item--icon">
                                        <i class="material-icons" aria-hidden="true">location_on</i>
                                    </div>
                                    <div class="contacts__item--content">
                                        <p><?= $setting->address ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 contacts__item">
                                <div class="d-flex align-items-center">
                                    <div class="contacts__item--icon">
                                        <i class="material-icons" aria-hidden="true">watch_later</i>
                                    </div>
                                    <div class="contacts__item--content">
                                        <table>
                                            <?= $setting->work_hours ?>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- .contacts-top -->
                    <?= $setting->contact_info ?>
                </div>
            </div>
        </div><!-- .row -->
    </div>
</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-contacts');
</script>
<script>
    // Initialize and add the map
    function initMap() {
        // The location of Uluru 55.6691355,37.6261486
        var uluru = {lat: <?= $lat ?>, lng: <?= $log ?>};
        // The map, centered at Uluru
        var map = new google.maps.Map(
            document.getElementById('map'), {zoom: 17, center: uluru});
        // The marker, positioned at Uluru
        var marker = new google.maps.Marker({position: uluru, map: map});
    }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDih2NysdnAlvkT3EmJz9_m3WjM4XdVrhg&callback=initMap"></script>

<!--<div class="site-contact">-->
<!--    <h1>--><?php //echo Html::encode($this->title) ?><!--</h1>-->
<!---->
<!--    <p>-->
<!--        If you have business inquiries or other questions, please fill out the following form to contact us. Thank you.-->
<!--    </p>-->
<!---->
<!--    <div class="row">-->
<!--        <div class="col-lg-5">-->
<!--            --><?php //$form = ActiveForm::begin(['id' => 'contact-form']); ?>
<!--                --><?php //echo $form->field($model, 'name') ?>
<!--                --><?php //echo $form->field($model, 'email') ?>
<!--                --><?php //echo $form->field($model, 'subject') ?>
<!--                --><?php //echo $form->field($model, 'body')->textArea(['rows' => 6]) ?>
<!--                --><?php //echo $form->field($model, 'verifyCode')->widget(Captcha::className(), [
//                    'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
//                ]) ?>
<!--                <div class="form-group">-->
<!--                    --><?php //echo Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
<!--                </div>-->
<!--            --><?php //ActiveForm::end(); ?>
<!--        </div>-->
<!--    </div>-->
<!--    -->
<!--</div>-->
