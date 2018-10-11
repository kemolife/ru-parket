<?php
/* @var $this yii\web\View */
$totalNumber = 0;
$totalPrice = 0;
foreach ($products as $product) {
    $totalNumber += $product->number;
    $totalPrice += $product->number * $product->price;
}
$urlCurrent = Yii::$app->urlManager->baseUrl;
$urlCheckout = Yii::$app->urlManager->createUrl(['cart/checkout']);
$catalog = Yii::$app->urlManager->createUrl(['category/catalog']);

/* @var $this yii\web\View */
$this->title = 'Корзина';
$this->params['breadcrumbs'][] = $this->title;
?>
    <!-- main -->
    <main class="main" role="main">

        <section class="section cart">
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
                <header class="page-title">
                    <div class="h1">Корзина</div>
                </header>
                <div class="cart-list">
                    <?php foreach ($products as $product) { ?>
                        <div class="cart-item border-top">
                            <div class="row no-gutters align-items-sm-center">
                                <div class="col-sm-4 order-sm-1">
                                    <div class="h3"><a
                                                href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>"
                                                title="product title"><?= $product->name ?></a></div>
                                </div>
                                <div class="col-3 col-sm-2 col-xl-1 order-sm-0 cart-img">
                                    <figure class="border border-secondary">
                                        <img src="<?= $product->thumb ?>" class="img-fluid"
                                             alt="<?= $product->name ?>">
                                    </figure>
                                </div>
                                <div class="col-lg-1 order-2 hidden__down--lg text-center">
                                    <span>Артикул: <b><?= $product->id ?></b></span>
                                </div>
                                <div class="col-md-1 order-3 hidden__down--sm text-center">
                                    <span><strong id="price1"><?= $product->price ?></strong> ₽/м²</span>
                                </div>
                                <div class="col-lg-1 order-4 hidden__down--md text-center">
                                    <span><?= $product->number !== 0 ? 'В наличии' : 'Нет в наличии' ?></span>
                                </div>
                                <div class="col-5 col-sm-3 col-lg-2 order-5 cart-item-calc">
                                    <div class="hidden__up--md">
                                        <span><strong id="price1"><?= $product->number * $product->price ?></strong> ₽/м2</span>
                                    </div>
                                    <div class="calculator d-inline-flex flex-column" data-role="calculator"
                                         data-calc-result="#resultPrice1" data-calc-target="#price1"
                                         data-calc-summary="#resultsSummary" aria-hidden="true">
                                        <div class="calculator-buttons d-flex">
                                            <button class="calculator-minus" data-calc="minus">
                                                <span data-link="<?= Yii::$app->urlManager->createUrl(['cart/index', 'type' => 'minus', 'product_id' => $product->product_id]) ?>"
                                                      class="minus">minus</span>
                                                <i class="material-icons">remove</i>
                                            </button>
                                            <input type="number" class="calculator-value" data-limit="99"
                                                   data-link="<?= Yii::$app->urlManager->createUrl(['cart/index', 'type' => 'change', 'product_id' => $product->product_id]) ?>"
                                                   value="<?= $product->number ?>">
                                            <button class="calculator-plus" data-calc="plus">
                                                <span data-link="<?= Yii::$app->urlManager->createUrl(['cart/index', 'type' => 'add', 'product_id' => $product->product_id]) ?>"
                                                      class="add">plus</span>
                                                <i class="material-icons">add</i>
                                            </button>
                                        </div>
                                        <!--                                    <div class="calculator-boxing small"><b>5</b> упаковок</div>-->
                                        <!--                                    <div class="d-none" data-calc-perbox="2"></div>-->
                                    </div>
                                    <strong>м²&nbsp;</strong>
                                    <!-- .product__calc -->
                                </div>
                                <div class="cart-item-summary col-4 col-sm-3 col-md-2 order-6">
                                    <span class="calculator-result"><strong
                                                id="resultPrice1"><?= $product->number * $product->price ?></strong> ₽</span>
                                </div>
                            </div>
                            <a href="<?= Yii::$app->urlManager->createUrl(['cart/delete', 'id' => $product->product_id]) ?>"
                               class="btn btn-link cart-delete">
                                <span class="sr-only">delete</span>
                                <i class="material-icons" aria-hidden="">close</i>
                            </a>
                        </div><!-- .cart-item -->
                    <?php } ?>
                </div><!-- .cart-list -->
                <div class="cart-result">
                    <!--                    <div class="cart-helptext">-->
                    <!--                        <p>Для прощади 10.00 м2, ваш заказ будет округлен до 5 упаковок или 11.01 м2, на суму <strong>21 249 ₽</strong></p>-->
                    <!--                    </div>-->
                    <div class="cart-result-sum text-right">
                        <div class="d-inline-block border-bottom border-success">
                            <span>Итого к оплате:</span>
                            <strong id="resultsSummary"><?= $totalPrice ?></strong> <strong>₽</strong>
                        </div>
                    </div>
                </div>
                <div class="cart-buttons row align-items-lg-center">
                    <div class="col-md-4 col-lg-3 order-md-2">
                        <button class="btn btn-info btn-icon" data-toggle="modal" data-target="#buyNowModal">
                            <span>Купить в 1 клик</span>
                            <i class="material-icons">arrow_forward</i>
                        </button>
                    </div>
                    <div class="col-md-4 col-lg-3 order-md-1">
                        <a href="<?= $urlCheckout ?>" class="btn btn-primary btn-icon" role="button"
                           title="Оформить заказ">
                            <span>Оформить заказ</span>
                            <i class="material-icons">arrow_forward</i>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-6 order-md-0">
                        <a href="<?= $catalog ?>" class="btn btn-link" role="button" title="Продолжить покупки">
                            <i class="material-icons">chevron_left</i>
                            <span class="border-bottom">Продолжить покупки</span>
                        </a>
                    </div>
                </div><!-- .cart-buttons -->
            </div>
        </section><!-- .cart -->

        <section class="section border-top recommendations">
            <div class="container">
                <div class="products__recommend">
                    <div class="d-block">
                        <div class="h1 d-inline-block">С этим товаром покупают:</div>
                        <ul class="d-inline-flex nav nav-tabs" id="recommendTabs" role="tablist">
                            <?php foreach ($sameCategories as $key => $category) { ?>
                                <li class="nav-item">
                                    <a class="nav-link <?= $key === 0?'active':'' ?>" id="tabRecommendProds<?= $category->id ?>"
                                       data-toggle="tab"
                                       href="#recommendProds<?= $category->id ?>"
                                       role="tab" aria-controls="recommendProds<?= $category->id ?>"
                                       aria-selected="true"><?= $category->name ?></a>
                                </li>
                            <?php }
                            unset($category);
                            unset($key);
                            ?>
                        </ul>
                    </div>
                    <div class="tab-content" id="recommendProdsList">
                        <?php foreach ($sameCategories as $key => $category) { ?>
                            <div class="tab-pane fade show <?= $key === 0?'active':'' ?>" id="recommendProds<?= $category->id ?>" role="tabpanel"
                                 aria-labelledby="tabRecommend<?= $category->id ?>">
                                <div class="products__recommend--slider">
                                    <?php foreach ($category->products as $product) {
                                        echo $this->render('../site/block/main_products_part', ['type' => 'promote', 'item' => $product]);
                                    } ?>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div><!-- .products__recommend -->
            </div>
        </section>

        <section class="section delivery">
            <div class="container">
                <div class="row align-items-md-center">
                    <div class="col-xl-5">
                        <div class="h2">Стоимость доставки:</div>
                        <?= $setting->cost_delivery ?>
                    </div>
                    <div class="col-md-6 col-xl-3 order-md-2">
                        <div class="support-order">
                            <button class="btn btn-primary btn-support" data-toggle="modal"
                                    data-target="#consultantModal">
                                <img src="/img/svg/builder1.svg" alt="">
                                <span>Консультация технолога</span>
                            </button>
                        </div>
                        <div class="row align-items-center info py-2">
                            <div class="col-3">
                                <span class="d-block mr-2 icon"><img src="/img/svg/opt/operator.svg"
                                                                     alt="attribute icon"></span>
                            </div>
                            <div class="col-9"><b>Заказ подтвердим за час</b></div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-4 order-md-1">
                        <div class="row align-items-center info py-2">
                            <div class="col-3">
                                <span class="d-block mr-2 icon"><img src="/img/svg/opt/delivery-van.svg"
                                                                     alt="attribute icon"></span>
                            </div>
                            <div class="col-9"><b>Оперативная доставка и самовывоз</b></div>
                        </div>
                        <div class="row align-items-center info py-2">
                            <div class="col-3">
                                <span class="d-block mr-2 icon"><img src="/img/svg/opt/medall.svg"
                                                                     alt="attribute icon"></span>
                            </div>
                            <div class="col-9"><b>Гарантия на все виды работ</b></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- Backend - this will replaced with backend function to add class -->
    <script>
        document.querySelector('.page').classList.add('page-cart');
    </script>

<?php
$js = <<<JS
$(document).ready(function() {
$(".minus").click(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload();
        }
    });
});//end click
$(".add").click(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload();
        }
    });
});//end click
$(".nums input").change(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link + "&value=" + this.value, function(data, status) {
        if (status == "success") {
            location.reload();
        }
    });
});//end click
});
JS;

$this->registerJs($js);
