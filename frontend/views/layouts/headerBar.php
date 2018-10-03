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
                <div class="col-4 col-lg-12 order-lg-1 header__button">
                    <button class="navbar-toggler" data-toggle="collapse" data-target="#mainMenu">
							<span class="navbar-toggler-lines">
								<span class="navbar-toggler-line"></span>
								<span class="navbar-toggler-line"></span>
								<span class="navbar-toggler-line"></span>
							</span>
                        <span class="hidden__down--md navbar-toggler-title">Каталог товаров</span>
                    </button>
                </div><!-- .header__button -->
                <div class="col-8 col-lg-12 order-lg-0 header__logo">
                    <!-- Backend - make logo not a link for home page -->
                    <a href="<?= Yii::$app->homeUrl ?>" class="navbar-brand" title="Home page">
                        <img src="/<?= $settings->logo ?>" alt="logotype">
                    </a>
                </div><!-- .header__logo -->
            </div>
        </div>
        <div class="col-5 col-lg-9 header__right">
            <div class="row header__top">
                <div class="col-lg-9 hidden__down--md header__nav">
                    <nav class="nav align-items-center">
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/about']) ?>"
                           class="nav-link @@class" title="О компании">О компании</a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['/blog']) ?>"
                           class="nav-link @@class" title="Блог">Блог</a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/payment-delivery']) ?>"
                           class="nav-link @@class" title="Оплата и доставка">Оплата и доставка</a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/warranty']) ?>"
                           class="nav-link @@class" title="Гарантия">Гарантия</a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/service']) ?>"
                           class="nav-link @@class" title="Сервис">Сервис</a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/contact']) ?>"
                           class="nav-link @@class" title="Контакты">Контакты</a>
                    </nav>
                </div><!-- .header__nav -->
                <div class="col-4 text-right hidden__up--lg">
                    <button class="btn btn-modal" data-toggle="modal" data-target="#testModal">
                        <span class="btn-text">Поиск</span>
                        <i class="material-icons">search</i>
                    </button>
                </div>
                <div class="col-4 col-lg-3 text-right header__account">
                    <?php if (Yii::$app->user->isGuest) { ?>
                        <a href="<?= Yii::$app->urlManager->createUrl(['/site/login/']) ?>" class="btn btn-modal" role="button" title="Личный кабинет">
                            <span>Личный кабинет</span>
                            <i class="material-icons">person</i>
                        </a>
                    <?php } else { ?>
                        <a class=""
                           href="<?= Yii::$app->urlManager->createUrl(['/user/profile/']) ?>"><?= Yii::$app->user->identity->username ?></a>&nbsp;[
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/logout']) ?>">Выйти</a>]
                    <?php } ?>
                </div>
                <div class="col-4 text-right hidden__up--lg header__cart">
                    <button class="btn btn-modal" data-toggle="modal" data-target="#cartModal">
                        <span class="btn-text">Корзина</span>
                        <i class="material-icons">shopping_cart</i>
                    </button>
                    <span class="header__cart--counter"><?= Yii::$app->session['step'] ? Yii::$app->session['step'] : 1 ?></span>
                </div>
            </div>
            <div class="row hidden__down--md header__bottom">
                <div class="col-lg-7 header__search">
                    <form action="<?= Yii::$app->urlManager->createUrl(['product/search']) ?>"
                          class="form-inline border">
                        <label class="sr-only" for="headerSearch2">Поиск</label>
                        <input class="form-control" id="headerSearch2" placeholder="Что вы хотите купить?" type="text"
                               name="keyword" value="<?= Yii::$app->request->get('keyword', '') ?>"/>
                        <button type="submit" class="btn btn-search">
                            <i class="material-icons">search</i>
                            <span class="sr-only">Поиск</span>
                        </button>
                    </form>
                </div>
                <div class="col-lg-3 header__call">
                    <div class="d-flex">
                        <div class="coloumn">
                            <div class="header__call--number">
                                <span class="telephone"><?= $settings->phone ?></span>
                            </div>
                            <div class="header__call--btn">
                                <a href="tel:<?= $settings->phone ?>" class="border-bottom text-dark" role="button"
                                   title="Call us"
                                   data-toggle="modal" data-target="#callbackModal">
                                    <span>Заказать обратный звонок</span>
                                </a>
                            </div>
                        </div>
                        <div class="coloumn">
                            <i class="material-icons">phone</i>
                        </div>
                    </div>
                </div>
                <!-- backend - fi not empty add class .not-empty -->
                <div class="col-lg-2 header__cart not-empty">
                    <button class="btn btn-modal" data-toggle="modal" data-target="#cartModal">
                        <span class="btn-text">Корзина</span>
                        <i class="material-icons">shopping_cart</i>
                    </button>
                    <span class="header__cart--counter"><?= $count ?></span>
                </div>
            </div>
        </div>
    </div>
</div>