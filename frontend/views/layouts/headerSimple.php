<?php

use common\models\Cart;

$settings = \common\models\Settings::find()->one();
$products = Cart::find()->where(['or', 'session_id = "' . Yii::$app->session->id . '"', 'user_id = ' . (Yii::$app->user->id ? Yii::$app->user->id : -1)])->all();
$count = 0;

foreach ($products as $product){
    $count += $product->number;
}

?>

<div class="container">
    <div class="row">
        <div class="col-7 col-lg-3 header__left">
            <div class="row">
                <div class="col-8 col-lg-12 order-lg-0 header__logo">
                    <!-- Backend - make logo not a link for home page -->
                    <a href="<?= Yii::$app->homeUrl ?>" class="navbar-brand" title="Home page">
                        <img src="/<?= $settings->logo ?>" alt="logotype">
                    </a>
                </div><!-- .header__logo -->
            </div>
        </div>
        <div class="col-5 col-lg-9 header__right">
            <div class="row justify-content-lg-end h-100">
                <div class="col-lg-3 hidden__down--md header__call">
                    <div class="d-flex">
                        <div class="coloumn">
                            <div class="header__call--number">
                                <span class="telephone"><?= $settings->phone ?></span>
                            </div>
                            <div class="header__call--btn">
                                <a href="tel:<?= $settings->phone ?>" class="border-bottom text-dark" role="button" title="Call us" data-toggle="modal" data-target="#callbackModal">
                                    <span>Заказать обратный звонок</span>
                                </a>
                            </div>
                        </div>
                        <div class="coloumn">
                            <i class="material-icons">phone</i>
                        </div>
                    </div>
                </div><!-- .header__call -->
                <div class="col-4 text-right hidden__up--lg">
                    <button class="btn btn-modal" data-toggle="modal" data-target="#searchModal">
                        <span class="btn-text">Поиск</span>
                        <i class="material-icons">search</i>
                    </button>
                </div>
                <div class="col-4 col-lg-3 text-right header__account">
                    <a href="login.html" class="btn btn-modal" role="button" title="Личный кабинет">
                        <span>Личный кабинет</span>
                        <i class="material-icons">person</i>
                    </a>
                </div>
                <div class="col-4 text-right hidden__up--lg header__cart">
                    <button class="btn btn-modal" data-toggle="modal" data-target="#testModal">
                        <span class="btn-text">Корзина</span>
                        <i class="material-icons">shopping_cart</i>
                    </button>
                    <span class="header__cart--counter"><?= $count ?></span>
                </div>
            </div><!-- .top -->
        </div>
    </div><!-- .row -->
</div><!-- .container -->