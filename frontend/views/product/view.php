<?php
/* @var $this yii\web\View */
$this->registerCssFile('', ['depends' => \frontend\assets\AppAsset::className()]);

$arrayPath = \common\models\Category::getCatalogPath($model->category_id, $allCategory);
foreach ($arrayPath as $path) {
    $category = \common\models\Category::findOne($path);
    $this->params['breadcrumbs'][] = ['label' => $category->name, 'url' => ['/category/view', 'id' => $category->id]];
}
$this->params['breadcrumbs'][] = $model->name;

$countCommentsPassed = count($model->commentsPassed);
$starGoodPercent = $starNormalPercent = $starBadPercent = 0;

$urlAddToCart = Yii::$app->urlManager->createUrl(['cart/add-to-cart']);
$urlFavorite = Yii::$app->urlManager->createUrl(['product/favorite']);
$urlLogin = Yii::$app->urlManager->createUrl(['site/login']);
$urlConsultationAdd = Yii::$app->urlManager->createUrl(['consultation/ajax-add']);
$urlComment = Yii::$app->urlManager->createUrl(['product/comment']);
$urlConsultation = Yii::$app->urlManager->createUrl(['product/consultation']);

?>
    <!-- main -->
    <main class="main" role="main">

        <div class="section">
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
                <div class="product">
                    <h1><?= $model->name ?></h1>
                    <div class="row">
                        <div class="col-xl-5">
                            <div class="product__sliders">
                                <div class="product__slider product__slider--large">
                                    <?php foreach ($model->productImagesSort as $imageBig) { ?>
                                        <div class="item">
                                            <img src="/<?= $imageBig->image ?>" alt="<?= $model->name ?> picture"
                                                 class="img-main">
                                            <img src="/img/slider1/slide5.jpg" alt="firm logo" class="img-firm">
                                            <div class="product__slider--badge">
                                                <div class="badge badge-danger">-30%</div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div><!-- .product__slider--large -->
                                <div class="product__slider product__slider--thumbnails">
                                    <?php foreach ($model->productImagesSort as $image) { ?>
                                        <div class="item">
                                            <img src="/<?= $image->thumb ?>" alt="thumbnails">
                                        </div>
                                    <?php } ?>
                                </div><!-- .product__slider--thumbnails -->
                            </div>
                        </div>
                        <div class="col-xl-7">
                            <div class="row product__details">
                                <div class="col-md-6">
                                    <div class="product__details--primary">
                                        <?php foreach ($model->attributesProduct as $productAttribute) { ?>
                                            <?= $this->render('part/product-attribute', ['attribute' => $productAttribute]) ?>
                                        <?php } ?>
                                    </div>
                                    <div class="product__details--secondary hidden__down--sm">
                                        <div class="support-order">
                                            <button class="btn btn-primary btn-support" data-toggle="modal"
                                                    data-target="#consultantModal">
                                                <img src="/img/svg/builder1.svg" alt="">
                                                <span>Консультация технолога</span>
                                            </button>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/operator.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Заказ подтвердим за час</b></div>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/delivery-van.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Оперативная доставка и самовывоз</b></div>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/medall.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Гарантия на все виды работ</b></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 product__details--right">
                                    <div class="product__pricecalc">
                                        <div class="product__price d-flex align-items-center">
                                            <span class="product__price--text">Цена за 1 м²:</span>
                                            <span id="productPrice"
                                                  class="product__price--num h1 text-red"><?= $model->market_price ?></span>
                                            <span class="h1 text-red"> ₽/м2</span>
                                        </div><!-- .product__price -->
                                        <div class="product__calc d-flex flex-column">
                                            <div class="product__calc--buttons d-flex">
                                                <button id="btnMinus">
                                                    <span class="sr-only">minus</span>
                                                    <i class="material-icons">remove</i>
                                                </button>
                                                <input value="1" id="input-buy-number" class="squareArea">
                                                <button id="btnPlus">
                                                    <span class="sr-only">plus</span>
                                                    <i class="material-icons">add</i>
                                                </button>
                                                <span id="buy-number">1</span>
                                                <span>м² =</span>
                                                <span id="sumResult"></span>
                                                <span>₽</span>
                                            </div>
                                            <div class="product__calc--boxing small"><b>5</b> упаковок</div>
                                            <div class="d-none" data-calc-perbox="<?= $model->box ?>"></div>
                                            <div class="product__calc--result">
                                                <strong>м²&nbsp;</strong>
                                                <span class="calculator-equals">=</span>
                                                <span class="calculator-result" id="prodResultPrice">21249</span>
                                                <span class="calculator-currency">₽</span>
                                            </div>
                                        </div>
                                        </div><!-- .product__calc -->
                                        <div class="product__pricecalc--text hidden__up--md">Для площади 10.00 м2, ваш
                                            заказ будет округлен до 5 упаковок или 11.01 м2, на суму <b>21249</b> ₽
                                        </div>
                                    </div>
                                    <div class="product__buyprocess">
                                        <button class="btn btn-info btn-icon" data-toggle="modal"
                                                data-target="#buyNowModal">
                                            <span>Купить в 1 клик</span>
                                            <i class="material-icons">arrow_forward</i>
                                        </button>
                                        <button class="btn btn-buy btn-primary" data-product="<?= $model->id ?>"
                                                role="button" title="Купить">
                                            <i class="material-icons">shopping_cart</i>
                                            <span>Купить</span>
                                        </button>
                                        <div class="product__buyprocess--additionally">
                                            <div class="additionally d-flex align-items-center justify-content-center">
                                                <span>С этим товаром Вы получаете подарок</span>
                                                <svg width="32px" height="32px"
                                                     enable-background="new 0 0 299.47 299.47"
                                                     version="1.1" viewBox="0 0 299.47 299.47" xml:space="preserve"
                                                     xmlns="http://www.w3.org/2000/svg"
                                                     xmlns:cc="http://creativecommons.org/ns#"
                                                     xmlns:dc="http://purl.org/dc/elements/1.1/"
                                                     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                                        <rdf:RDF>
                                                            <cc:Work rdf:about="">
                                                                <dc:format>image/svg+xml</dc:format>
                                                                <dc:type
                                                                        rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                                                <dc:title/>
                                                            </cc:Work>
                                                        </rdf:RDF>
                                                    </metadata>
                                                    <g fill="#b22721">
                                                        <path d="m293.25 65.56h-286.97c-3.442 0-6.249 2.807-6.249 6.249v59.788c0 3.442 2.807 6.249 6.249 6.249h8.844v155.38c0 3.442 2.807 6.249 6.249 6.249h256.74c3.442 0 6.249-2.807 6.249-6.249v-155.38h8.844c3.442 0 6.249-2.807 6.249-6.249v-59.788c-1e-3 -3.442-2.755-6.249-6.197-6.249zm-125.88 12.498v47.29h-35.216v-47.29h35.216zm-154.85 0h107.18v47.29h-107.18v-47.29zm15.093 59.788h92.039v149.18h-92.039v-149.18zm104.54 149.13v-149.18h35.216v149.18h-35.216zm139.75 0h-92.092v-149.13h92.039v149.13h0.053zm15.093-161.62h-107.18v-47.29h107.18v47.29z"/>
                                                        <path d="m89.206 63.866c1.959 0 4.607 0.053 7.573 0.159 4.978 0.159 9.85 0.265 14.563 0.265 16.681 0 31.086-1.324 38.394-7.096 7.308 5.772 21.712 7.096 38.394 7.096 4.713 0 9.585-0.106 14.563-0.265 3.019-0.106 5.613-0.159 7.573-0.159 17.582 0 31.933-14.298 31.933-31.933-1e-3 -17.582-14.3-31.933-31.934-31.933-12.657 0-47.396 18.111-60.53 35.11-13.133-16.999-47.926-35.11-60.529-35.11-17.582 0-31.933 14.298-31.88 31.933-0.053 17.635 14.298 31.933 31.88 31.933zm121.11-51.368c10.697 0 19.435 8.738 19.435 19.435s-8.738 19.435-19.435 19.435c-2.065 0-4.819 0.053-7.943 0.159-34.793 0.953-43.795-1.959-45.225-4.448h-2.224 2.224c-0.054-8.738 39.717-34.581 53.168-34.581zm-121.11 0c13.398 0 53.063 25.79 53.222 34.528-1.589 2.595-10.75 5.507-45.278 4.501-3.124-0.106-5.878-0.159-7.944-0.159-10.697 0-19.435-8.738-19.435-19.435s8.684-19.435 19.435-19.435z"/>
                                                    </g>
										</svg>
                                            </div>
                                        </div>
                                    </div><!-- .product__buyprocess -->
                                    <div class="product__payment-delivery">
                                        <div class="d-flex flex-md-column">
                                            <figure class="order-md-1">
                                                <img src="/img/oplata_s.png" alt="oplata">
                                            </figure>
                                            <button class="arrow-right order-md-0" data-toggle='modal'
                                                    data-target='#testInfoModal'>
                                                <span class="border-bottom">Оплата</span>
                                                <i class="material-icons">chevron_right</i>
                                            </button>
                                        </div>
                                        <div class="d-flex flex-md-column">
                                            <figure class="order-md-1">
                                                <img src="/img/pek.png" alt="dostavka">
                                            </figure>
                                            <button class="arrow-right order-md-0" data-toggle='modal'
                                                    data-target='#testInfoModal'>
                                                <span class="border-bottom">Доставка</span>
                                                <i class="material-icons">chevron_right</i>
                                            </button>
                                        </div>
                                    </div><!-- .product__payment-delivery -->
                                    <div class="product__details--secondary hidden__up--md">
                                        <div class="support-order">
                                            <button class="btn btn-primary btn-support" data-toggle="modal"
                                                    data-target="#consultantModal">
                                                <img src="/img/svg/builder1.svg" alt="">
                                                <span>Консультация технолога</span>
                                            </button>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/operator.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Заказ подтвердим за час</b></div>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/delivery-van.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Оперативная доставка и самовывоз</b></div>
                                        </div>
                                        <div class="row align-items-center py-2">
                                            <div class="col-3">
                                                <span class="d-block mr-2 icon"><img
                                                            src="/img/svg/opt/medall.svg"
                                                            alt="attribute icon"></span>
                                            </div>
                                            <div class="col-9"><b>Гарантия на все виды работ</b></div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- .product__details -->
                        </div>
                    </div>
                    <!-- Backend insert this TABS only for MOBILE -->
                    <div class="product__tabs product__tabs--mobile">
                        <ul class="nav nav-tabs" id="productTabMob" role="tablist">
                            <li class="nav-item active">
                                <a class="nav-link" id="prod-tab-m1" href="#tab-m-1" role="tab" aria-controls="tab-m-1"
                                   aria-selected="true">
                                    <span>Основные характеристики</span>
                                    <i class="material-icons">expand_more</i>
                                </a>
                                <article class="tab-pane fade show active" id="tab-m-1" role="tabpanel"
                                         aria-labelledby="prod-tab-m1">
                                    <?= $model->content ?>
                                </article>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="prod-tab-m2" href="#tab-m-2" role="tab" aria-controls="tab-m-2"
                                   aria-selected="false">
                                    <span>Описание</span>
                                    <i class="material-icons">expand_more</i>
                                </a>
                                <article class="tab-pane fade" id="tab-m-2" role="tabpanel"
                                         aria-labelledby="prod-tab-m2">
                                    <p><?= $model->description ?></p>
                                </article>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="prod-tab-m3" href="#tab-m-3" role="tab" aria-controls="tab-m-3"
                                   aria-selected="false">
                                    <span>Отзывы <span><?= count($model->comments) ?></span></span>
                                    <i class="material-icons">expand_more</i>
                                </a>
                                <article class="tab-pane fade" id="tab-m-3" role="tabpanel"
                                         aria-labelledby="prod-tab-m3">
                                    <div class="comments">
                                        <div class="product__tabs--list">
                                            <?php
                                            /**
                                             * @var \common\models\Comment $comment
                                             */
                                            foreach ($model->comments as $comment) { ?>
                                                <div class="comments__item">
                                                    <div class="comments__title h3"><?= $comment->user_id ? $comment->user->username : $comment->username ?></div>
                                                    <div class="comments__date text-secondary">
                                                        <p><?= date('d.m.Y', $comment->created_at) ?></p></div>
                                                    <div class="comments__content">
                                                        <p><?= $comment->content ?></p>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        </div><!-- .blog__comments--list -->
                                        <?= $this->render('/comment/comment_form', ['product' => $model, 'model' => $commentModel]) ?>
                                    </div><!-- .comments -->
                                </article>
                            </li>
                        </ul>
                    </div><!-- .product__tabs mobile -->
                    <!-- Backend insert this TABS only for DESKTOP -->
                    <div class="product__tabs product__tabs--desktop">
                        <ul class="nav nav-tabs" id="productTabDesk" role="tablist">
                            <li class="nav-item text-center">
                                <a class="nav-link active" id="prod-tab-d1" data-toggle="tab" href="#tab-d-1" role="tab"
                                   aria-controls="tab-d-1" aria-selected="true">Основные характеристики</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link" id="prod-tab-d2" data-toggle="tab" href="#tab-d-2" role="tab"
                                   aria-controls="tab-d-2" aria-selected="false">Описание</a>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link" id="prod-tab-d3" data-toggle="tab" href="#tab-d-3" role="tab"
                                   aria-controls="tab-d-3" aria-selected="false">Отзывы
                                    <span><?= count($model->comments) ?></span></a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <article class="tab-pane fade show active" id="tab-d-1" role="tabpanel"
                                     aria-labelledby="prod-tab-d1">
                                <?= $model->content ?>
                            </article>
                            <article class="tab-pane fade" id="tab-d-2" role="tabpanel" aria-labelledby="prod-tab-d2">
                                <p><?= $model->description ?></p>
                            </article>
                            <article class="tab-pane fade" id="tab-d-3" role="tabpanel" aria-labelledby="prod-tab-d3">
                                <div class="comments">
                                    <div class="product__tabs--list">
                                        <?php
                                        /**
                                         * @var \common\models\Comment $comment
                                         */
                                        foreach ($model->comments as $comment) { ?>
                                            <div class="comments__item">
                                                <div class="comments__title h3"><?= $comment->user_id ? $comment->user->username : $comment->username ?></div>
                                                <div class="comments__date text-secondary">
                                                    <p><?= date('d.m.Y', $comment->created_at) ?></p></div>
                                                <div class="comments__content">
                                                    <p><?= $comment->content ?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div><!-- .blog__comments--list -->
                                    <?= $this->render('/comment/comment_form', ['product' => $model, 'model' => $commentModel]) ?>
                                </div><!-- .comments -->
                            </article>
                        </div>
                    </div><!-- .product__tabs desktop -->
                    <div class="products__recommend">
                        <div class="h1">Рекомендуем посмотреть</div>
                        <div class="products__recommend--slider">
                            <?php foreach ($sameCategoryProducts as $sameCategoryProduct) {
                                echo $this->render('../site/block/main_products_part', ['type' => 'promote', 'item' => $sameCategoryProduct]);
                            } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Backend - this will replaced with backend function to add class -->
    <script>
        document.querySelector('.page').classList.add('page-single-product');
    </script>
<?php
$this->registerJs('
var product = {productId:' . $model->id . ', stock:' . $model->stock . ', csrf:"' . Yii::$app->request->getCsrfToken() . '"};
var user = {id:' . (Yii::$app->user->isGuest ? 0 : Yii::$app->user->id) . ', favorite:' . 0 . '};
var urlCartAdd = "' . Yii::$app->urlManager->createUrl(['cart/ajax-add']) . '";
');
$js = <<<JS
var view = $("#pic-view");
var thumb = $("#item-thumbs");
var clone = thumb.find('img').eq(0).clone();
var len = thumb.find('li').length;
var _left = 66;
var  show = null;
clone.insertAfter(view);
thumb.append('<div class="arrow"><i class="icon iconfont">^</i></div>');
var arrow = thumb.find('div.arrow');
arrow.css({
    'left': _left
}).show();
if (len < 5) {
    var l = 5 - len;
    _left += l * 33;
    arrow.css({
        'left': _left
    }).show();
    thumb.find('ul').css({
        'width': 66 * len
    });
}
thumb.find('li').eq(0).addClass('current');
thumb.find('li').mouseenter(function(){
    var _li = $(this);
    if (_li.hasClass('current')) {
        return false;
    }
    var _i = _li.index();
    var _img = _li.find('img');
    _ssrc = _img.attr('src');
    _bsrc = _img.data('view');

    arrow.css({
        'left': _i * 66 + _left
    });
    _li.addClass('current').siblings('li').removeClass('current');
    clone.attr('src', _ssrc);
    view.attr('src', _bsrc);

});

if (product.stock > 0) {
    $("li.add_cart_li").html('<a href="javascript:;" class="btn" id="buy_btn"><i class="glyphicon glyphicon-shopping-cart"></i></a>')
} else {
    $("li.add_cart_li").html('<span></span>')
}
if (user.favorite > 0) {
    $("li.add_cart_li").append('<a href="javascript:;" class="graybtn" id="has_fav_btn"><i class="glyphicon glyphicon-heart"></i></a>');
} else {
    $("li.add_cart_li").append('<a href="javascript:;" class="graybtn" id="fav_btn"><i class="glyphicon glyphicon-heart-empty"></i></a>');
}

$("#pjxqitem").hide();
$("#askitem").hide();
function priceChange() {
  var price = parseInt({$model->market_price});
  var num =  parseInt($("#input-buy-number").val());
  $('#sumResult').text(price * num);
  $('#buy-number').text(num);
}
priceChange();
$(document).ready(function() {
$("#btnMinus").click(function(e){
    e.preventDefault();
    $("#input-buy-number").val(parseInt($("#input-buy-number").val()) - 1);
    if (parseInt($("#input-buy-number").val()) < 1 ) {
        $("#input-buy-number").val(1);
    }
    priceChange();
});//end click
$("#btnPlus").click(function(e){
    e.preventDefault();
    $("#input-buy-number").val(parseInt($("#input-buy-number").val()) + 1);
    if (parseInt($("#input-buy-number").val()) > product.stock ) {
        $("#input-buy-number").val(product.stock);
    }
    priceChange();
});//end click

  $(".btn-buy").click(function(e){
      e.preventDefault();
    var number = $("#input-buy-number").val();
    var productId = $(this).data('product');
        $(this).html('<img src="/images/loading.gif" />');
        param = {
            productId : productId,
            number : $("#input-buy-number").val(),
            _csrf : product.csrf
        };
        $.post(urlCartAdd, param, function(data) {
            if (data.status > 0) {
                location.href = "{$urlAddToCart}?id=" + productId;
            }
        }, "json");
  });

$("#fav_btn").click(function(){
    if (user.id > 0) {
        $.get("{$urlFavorite}?id=" + product.productId, function(data, status) {
            if (status == "success") {
                if (data.status) {
                    $("#fav_btn").html('<i class="glyphicon glyphicon-heart"></i></a>');
                }
            }
        }, "json");
    } else {
        location.href = '{$urlLogin}?returnUrl=' + window.location.href;
    }
});


$(".spxqitem").click(function(){
    $("#tabs_bar li").removeClass('current_select');
    $(this).parent().addClass('current_select');
    $("#spxqitem").show();
    $("#pjxqitem").hide();
    $("#askitem").hide();
});
$(".pjxqitem").click(function(){
    $("#tabs_bar li").removeClass('current_select');
    $(this).parent().addClass('current_select');
    $("#spxqitem").hide();
    $("#pjxqitem").show();
    $("#askitem").hide();
});
$(".askitem").click(function(){
    $("#tabs_bar li").removeClass('current_select');
    $(this).parent().addClass('current_select');
    $("#spxqitem").hide();
    $("#pjxqitem").hide();
    $("#askitem").show();
});

$.ajax({
    url: "{$urlComment}?productId=" + {$model->id},
    type: "GET",
    dataType: "html",
    success: function(data){
        $('.z-com-list').html(data);
    }
}).fail(function(){
        alert("Error");
});

$('.z-com-list').on('click', '.pagination a', function(e){
    e.preventDefault();
    $.ajax({
        url: $(this).attr('href'),
        type: "GET",
        dataType: "html",
        success: function(data){
            $('.z-com-list').html(data);
        }

    }).fail(function(){
            alert("Error");
    });

});

$('.z-com-list').on('click', 'a.up', function(e){
    var up = $(this);
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            //alert(data.up);
            up.html("( <i>" + data.up + "</i> )");
        }
    }, 'json');
});

$("#consultation-btn").click(function(){
    if (user.id > 0) {
        param = {
            productId : product.productId,
            question : $("#consultation-question").val(),
            _csrf : product.csrf
        };
        $.post("{$urlConsultationAdd}", param, function(data) {
            if (data.status > 0) {
                alert("");
                $("#consultation-question").val('');
            }
        }, "json");
    } else {
        location.href = '$urlLogin?returnUrl=' + window.location.href;
    }
});


$.ajax({
    url: "{$urlConsultation}?productId=" + {$model->id},
    type: "GET",
    dataType: "html",
    success: function(data){
        $('.ask-list').html(data);
    }
}).fail(function(){
        alert("Error");
});

$('.ask-list').on('click', '.pagination a', function(e){
    e.preventDefault();
    $.ajax({
        url: $(this).attr('href'),
        type: "GET",
        dataType: "html",
        success: function(data){
            $('.ask-list').html(data);
        }

    }).fail(function(){
        alert("Error");
    });

});
})
JS;

$this->registerJs($js);
?>