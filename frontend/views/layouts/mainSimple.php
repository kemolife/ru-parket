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
            <?= $this->render('headerSimple') ?>
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

    <?= \common\widgets\SearchModal::widget() ?>

    <?= \common\widgets\BasketModal::widget() ?>

    <?= \common\widgets\PaymentModal::widget() ?>

    <?= \common\widgets\DeliveryModal::widget() ?>

    <?= \common\widgets\BuyNowModal::widget() ?>

    <?= \common\widgets\PassRemindModal::widget() ?>

    <?= \common\widgets\PassSendModal::widget() ?>

    <?= \common\widgets\ConfirmOrderModal::widget() ?>

    <?= \common\widgets\CallbackModal::widget() ?>

    <?= \common\widgets\ConsultantModal::widget() ?>


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

