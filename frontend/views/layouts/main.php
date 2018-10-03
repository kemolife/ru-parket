<?php
use yii\helpers\Html;
use frontend\components\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name=“robots” content=“noindex,nofollow”>
    <!-- / robots -->
    <!-- fav & icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="icon" type="image/vnd.microsoft.icon" href="/img/favicon/favicon.ico">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#345c04">
    <link rel="preload" href="/fonts/MaterialIcons-Regular.woff2" as="font">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link href="https://fonts.googleapis.com/css?family=Oswald:400,700|Roboto:300,400,700&amp;subset=cyrillic,cyrillic-ext"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <style>
        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src: url(/fonts/MaterialIcons-Regular.eot); /* For IE6-8 */
            src: local('Material Icons'),
            local('MaterialIcons-Regular'),
            url(/fonts/MaterialIcons-Regular.woff2) format('woff2'),
            url(/fonts/MaterialIcons-Regular.woff) format('woff'),
            url(/fonts/MaterialIcons-Regular.ttf) format('truetype');
        }
        .material-icons {
            font-family: 'Material Icons';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;  /* Preferred icon size */
            display: inline-block;
            line-height: 1;
            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr;
            /* Support for all WebKit browsers. */
            -webkit-font-smoothing: antialiased;
            /* Support for Safari and Chrome. */
            text-rendering: optimizeLegibility;
            /* Support for Firefox. */
            -moz-osx-font-smoothing: grayscale;
            /* Support for IE. */
            font-feature-settings: 'liga';
        }
    </style>
    <script>
        window.menu = {
            mobile		: '/site/menu-mobile',
            desktop		: '/site/menu-desktop',
            container	: 'menuList'
        };
    </script>
</head>
<body>
    <?php $this->beginBody() ?>
    <div class="page" data-role="page">

        <header id="header" class="header border-bottom">
            <?= $this->render('headerBar') ?>
        </header>
        <!-- nav block -->
        <nav class="navbar" aria-hidden="true">
            <div class="container">
                <div class="collapse navbar-collapse navbar-light" id="mainMenu">
                    <button type="button" class="btn navbar-close" data-target="#mainMenu" aria-label="Close">
                        <span class="navbar-close-line"></span>
                        <span class="navbar-close-line"></span>
                    </button>
                    <form class="form-inline border header__search">
                        <label class="sr-only" for="headerSearch1">Поиск</label>
                        <input type="text" class="form-control" id="headerSearch1" placeholder="Что вы хотите купить?">
                        <button type="submit" class="btn btn-search">
                            <i class="material-icons">search</i>
                            <span class="sr-only">Поиск</span>
                        </button>
                    </form>
                    <ul class="navbar-nav" id="menuList">

                    </ul><!-- .navbar-nav -->
                </div><!-- .navbar-collapse -->
            </div>
        </nav><!-- .navbar -->
    <?= $content ?>
    <?= $this->render('footer') ?>

    </div>
    <!-- end .page -->
    <!-- all modals -->
    <div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="testModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="exampleModalLongTitle">Modal title</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="form-group">
                            <label for="test-name" class="col-form-label">Recipient:</label>
                            <input type="text" class="form-control" id="test-name">
                        </div>
                        <div class="form-group">
                            <label for="test-mes-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="test-mes-text"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer d-flex flex-column">
                    <button class="btn btn-secondary btn-icon" type="button">
                        <span>Закрить</span>
                        <i class="material-icons">close</i>
                    </button>
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Продолжить</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- .modal__name -->

    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header d-xl-block">
                    <div class="h2 modal-title text-center" id="searchModalTitle">Поиск</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-inline border header__search">
                        <label class="sr-only" for="headerSearch1">Поиск</label>
                        <input type="text" class="form-control" id="headerSearch1" placeholder="Что вы хотите купить?">
                        <button type="submit" class="btn btn-search">
                            <i class="material-icons">search</i>
                            <span class="sr-only">Поиск</span>
                        </button>
                    </form>
                    <div class="modal-search-result">
                        <p></p>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- #searchModal -->

    <div class="modal fade modal-cart" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title text-left">Корзина</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="cart-list">
                        <div class="cart-item border-top">
                            <div class="row no-gutters align-items-sm-center">
                                <div class="col-12">
                                    <div class="h3"><a href="single-product.html" title="product title">Дуб шампань браш лак Дуб шампань браш лак</a></div>
                                </div>
                                <div class="col-3 cart-img">
                                    <figure class="border border-secondary">
                                        <img src="../assets/img/product-1.jpg" class="img-fluid" alt="product image">
                                    </figure>
                                </div>
                                <div class="col-md-2 hidden__down--sm text-center">
                                    <span><strong id="price1">1930</strong> ₽/м²</span>
                                </div>
                                <div class="col-5 col-sm-4 text-center cart-item-calc">
                                    <div class="hidden__up--md">
                                        <span><strong id="price1">1930</strong> ₽/м2</span>
                                    </div>
                                    <div class="calculator d-inline-flex flex-column" data-role="calculator" data-calc-result="#resultPrice1" data-calc-target="#price1" data-calc-summary="#resultsSummary" aria-hidden="true">
                                        <div class="calculator-buttons d-flex">
                                            <button class="calculator-minus" data-calc="minus">
                                                <span class="sr-only">minus</span>
                                                <i class="material-icons">remove</i>
                                            </button>
                                            <input type="number" name="squarArea" class="calculator-value" data-calc="input" value="10" min="10" />
                                            <button class="calculator-plus" data-calc="plus">
                                                <span class="sr-only">plus</span>
                                                <i class="material-icons">add</i>
                                            </button>
                                        </div>
                                        <div class="calculator-boxing small"><b>5</b> упаковок</div>
                                        <div class="d-none" data-calc-perbox="2"></div>
                                    </div>
                                    <strong>м²&nbsp;</strong>
                                    <!-- .product__calc -->
                                </div>
                                <div class="cart-item-summary col-4 col-sm-3">
                                    <span class="calculator-result"><strong id="resultPrice1">19300</strong> ₽</span>
                                </div>
                            </div>
                            <button class="btn btn-link cart-delete">
                                <span class="sr-only">delete</span>
                                <i class="material-icons" aria-hidden="">close</i>
                            </button>
                        </div><!-- .cart-item -->

                        <div class="cart-item border-top border-bottom">
                            <div class="row no-gutters align-items-sm-center">
                                <div class="col-12">
                                    <div class="h3"><a href="single-product.html" title="product title">Дуб шампань браш лак</a></div>
                                </div>
                                <div class="col-3 cart-img">
                                    <figure class="border border-secondary">
                                        <img src="../assets/img/product-1.jpg" class="img-fluid" alt="product image">
                                    </figure>
                                </div>
                                <div class="col-md-2 hidden__down--sm text-center">
                                    <span><strong id="price2">1930</strong> ₽/м²</span>
                                </div>
                                <div class="col-5 col-sm-4 text-center cart-item-calc">
                                    <div class="hidden__up--md">
                                        <span><strong id="price1">1930</strong> ₽/м2</span>
                                    </div>
                                    <div class="calculator d-inline-flex flex-column" data-role="calculator" data-calc-result="#resultPrice2" data-calc-target="#price2" data-calc-summary="#resultsSummary" aria-hidden="true">
                                        <div class="calculator-buttons d-flex">
                                            <button class="calculator-minus" data-calc="minus">
                                                <span class="sr-only">minus</span>
                                                <i class="material-icons">remove</i>
                                            </button>
                                            <input type="number" name="squarArea" class="calculator-value" data-calc="input" value="10" min="10" />
                                            <button class="calculator-plus" data-calc="plus">
                                                <span class="sr-only">plus</span>
                                                <i class="material-icons">add</i>
                                            </button>
                                        </div>
                                        <div class="calculator-boxing small"><b>5</b> упаковок</div>
                                        <div class="d-none" data-calc-perbox="2"></div>
                                    </div>
                                    <strong>м²&nbsp;</strong>
                                    <!-- .product__calc -->
                                </div>
                                <div class="cart-item-summary col-4 col-sm-3">
                                    <span class="calculator-result"><strong id="resultPrice2">19300</strong> ₽</span>
                                </div>
                            </div>
                            <button class="btn btn-link cart-delete">
                                <span class="sr-only">delete</span>
                                <i class="material-icons" aria-hidden="">close</i>
                            </button>
                        </div><!-- .cart-item -->
                    </div><!-- .cart-list -->
                    <div class="cart-result">
                        <div class="cart-result-sum text-right">
                            <div class="d-inline-block border-bottom border-success">
                                <span>Итого к оплате:</span>
                                <strong id="resultsSummary">38600</strong> <strong>₽</strong>
                            </div>
                        </div>
                    </div><!-- .cart-result -->
                </div>
                <div class="modal-footer d-flex flex-column align-items-end">
                    <button class="btn btn-info btn-icon" data-toggle="modal" data-target="#callbackModal">
                        <span>Купить в 1 клик</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                    <a href="checkout.html" class="btn btn-primary btn-icon" role="button" title="Оформить заказ">
                        <span>Оформить заказ</span>
                        <i class="material-icons">arrow_forward</i>
                    </a>
                </div>
            </div>
        </div>
    </div><!-- .modal-cart -->

    <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="paymentModalTitle">Оплата</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="post">
                        <p>Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum</p>
                        <ul>
                            <li>Что такое Lorem Ipsum?</li>
                            <li>Откуда он появился?</li>
                            <li>Почему он используется?</li>
                            <li>Где его взять?</li>
                        </ul>
                        <p>Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum</p>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- #paymentModal -->

    <div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="deliveryModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="deliveryModalTitle">Доставка</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="post">
                        <p>Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum</p>
                        <ul>
                            <li>Что такое Lorem Ipsum?</li>
                            <li>Откуда он появился?</li>
                            <li>Почему он используется?</li>
                            <li>Где его взять?</li>
                        </ul>
                        <p>Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum</p>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- #deliveryModal -->

    <div class="modal fade" id="callbackModal" tabindex="-1" role="dialog" aria-labelledby="callbackModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="callbackModalTitle">Обратный звонок</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="form-group">
                            <label for="callback-name" class="col-form-label">Ваше имя:</label>
                            <input type="text" class="form-control" id="callback-name">
                        </div>
                        <div class="form-group">
                            <label for="callback-tel" class="col-form-label">Ваш телефон:</label>
                            <input type="tel" class="form-control" id="callback-tel">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Заказать звонок</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- #callbackModal -->

    <div class="modal fade" id="buyNowModal" tabindex="-1" role="dialog" aria-labelledby="buyNowModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="buyNowModalTitle">Купить в 1 клик</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="form-group">
                            <label for="buynow-name" class="col-form-label">Ваше имя:</label>
                            <input type="text" class="form-control" id="buynow-name">
                        </div>
                        <div class="form-group">
                            <label for="buynow-tel" class="col-form-label">Ваш телефон:</label>
                            <input type="tel" class="form-control" id="buynow-tel">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Заказать звонок</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- #buyNowModal -->

    <div class="modal fade" id="passRemindModal" tabindex="-1" role="dialog" aria-labelledby="passRemindModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="passRemindModalTitle">Забыли пароль</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="form-group">
                            <label for="passremind-email" class="col-form-label">Электронный адрес:</label>
                            <input type="email" class="form-control" id="passremind-email" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer d-flex flex-column align-items-md-end">
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Напомнить</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- #passRemindModal -->

    <div class="modal fade" id="passSendModal" tabindex="-1" role="dialog" aria-labelledby="passSendModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="passSendModalTitle">Напомнить пароль</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="form-group">
                            <label for="passsend-email" class="col-form-label">Электронный адрес:</label>
                            <input type="email" class="form-control" id="passsend-email" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer d-flex flex-column align-items-md-end">
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Напомнить</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- #passSendModal -->

    <div class="modal fade" id="confirmOrderModal" tabindex="-1" role="dialog" aria-labelledby="confirmOrderModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header d-block">
                    <div class="h2 modal-title text-center" id="confirmOrderModalTitle">Заказ сформирован</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="post">
                        <p>Ваш заказ №3679 от 16.06.2018 14:58:17 успешно создан. В ближайшее время мы свяжемся с вами по указаному при оформлении заказа телефону.</p>
                        <p>Вы можете следить за выполнением своего заказа в <a href="/account.html" class="border-bottom border-dark text-info" title="Личном кабинете">Личном кабинете</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- #confirmOrderModal -->

    <div class="modal fade" id="consultantModal" tabindex="-1" role="dialog" aria-labelledby="consultantModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h1 modal-title" id="consultantModalTitle">Заказать консультацию технолога</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="border border-primary p-3">
                                    <div class="form-checkbox custom-control d-flex">
                                        <input type="radio" id="consultantMethod1" name="customRadio" class="checkbox" checked>
                                        <label class="" for="consultantMethod1"><span>Предварительная консультация без выезда на объект, <strong>БЕСПЛАТНО</strong></span></label>
                                    </div>
                                </div>
                                <div class="border border-primary p-3 my-4">
                                    <div class="form-checkbox custom-control d-flex">
                                        <input type="radio" id="consultantMethod2" name="customRadio" class="checkbox">
                                        <label class="" for="consultantMethod2"><span>Консультация с выездом на объект и проведением комплекса мероприятей, <strong>ПЛАТНО</strong></span></label>
                                    </div>
                                    <div class="pl-3 mt-4">
                                        <p>Стоимость выезда:<br>По Москве в предедах МКАД - 1500 руб.<br>За МКАД до 20 км - 2000 руб., свыше - 2000 руб. + 30 руб./км.<br>За МКАД свыше 100 км - по договоренности.</p>
                                        <p>При заключении договора на монтаж оплата выезда компенсируется за счет скидки на стоимость выезда технолога.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="border border-primary p-3">
                                    <p>Все поля обязательны для заполнения!</p>
                                    <div class="form-group">
                                        <label for="consultant-name" class="col-form-label">Ваше имя</label>
                                        <input type="text" class="form-control" id="consultant-name" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="consultant-tel" class="col-form-label">Телефон</label>
                                        <input type="tel" class="form-control" id="consultant-tel" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="consultant-square" class="col-form-label">Площадь м2:</label>
                                        <input type="number" class="form-control" id="consultant-square" name="square" min="1">
                                    </div>
                                    <div class="form-group">
                                        <label for="consultant-address" class="col-form-label">Адрес</label>
                                        <input type="text" class="form-control" id="consultant-address" name="address">
                                    </div>
                                    <p>Также оформить вызов технолога на ваш объект вы можете связавшись с нами по телефону</p>
                                    <p><strong>+7 (495) 662-98-97</strong> или отправив заявку на электронный адрес <strong>info@ru-parket.ru</strong></p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer d-flex flex-column">
                    <button class="btn btn-primary btn-icon" type="submit">
                        <span>Отправить заявку</span>
                        <i class="material-icons">send</i>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- #consultantModal -->


    <?php $this->endBody() ?>
    <script>
        var isMobile = false;		if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) isMobile = true;
        if(isMobile) {document.body.classList.add('mobile');} else {document.body.classList.add('desktop');}
    </script>
    <script>
        if ($('#introSlider')) {
            $(".carousel").swipe({
                swipe: function(event, direction, distance, duration, fingerCount, fingerData) {
                    if (direction == 'left') $(this).carousel('next');
                    if (direction == 'right') $(this).carousel('prev');
                },
                allowPageScroll: "vertical"
            });
        }
    </script>
    <script>
        if ($('footer #currentYear').length) {
            $('footer #currentYear').text(new Date().getFullYear());
        }
    </script>
</body>
</html>
<?php $this->endPage() ?>

