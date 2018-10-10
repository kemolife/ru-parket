<div class="modal fade modal-cart" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="h2 modal-title text-left"><?= $title ?></div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <div class="modal-body">
                <?php if($products){
                    $lastProduct = end($products); ?>
                    <div class="cart-list">
                        <?php foreach ($products as $product){ ?>
                            <div class="cart-item border-top <?=  $product->id === $lastProduct->id?'border-bottom':'' ?>">
                            <div class="row no-gutters align-items-sm-center">
                                <div class="col-12">
                                    <div class="h3"><a
                                                href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>"
                                                title="product title"><?= $product->name ?></a></div>
                                </div>
                                <div class="col-3 cart-img">
                                    <figure class="border border-secondary">
                                        <img src="<?= $product->thumb ?>" class="img-fluid" alt="<?= $product->name ?>">
                                    </figure>
                                </div>
                                <div class="col-md-2 hidden__down--sm text-center">
                                    <span><strong id="price1"><?= $product->price ?></strong> ₽/м²</span>
                                </div>
                                <div class="col-5 col-sm-4 text-center cart-item-calc">
                                    <div class="hidden__up--md">
                                        <span><strong id="price1"><?= $product->price ?></strong> ₽/м2</span>
                                    </div>
                                    <div class="calculator d-inline-flex flex-column" data-role="calculator" data-calc-result="#resultPrice1" data-calc-target="#price1" data-calc-summary="#resultsSummary" aria-hidden="true">
                                        <div class="calculator-buttons d-flex">
                                            <button class="calculator-minus" data-calc="minus">
                                                <span data-link="<?= Yii::$app->urlManager->createUrl(['cart/index', 'type' => 'minus', 'product_id' => $product->product_id]) ?>"
                                                      class="minus">minus</span>
                                                <i class="material-icons">remove</i>
                                            </button>
                                            <input type="number" class="calculator-value" data-limit="99" data-calc="input" value="<?= $product->number ?>" />
                                            <button class="calculator-plus" data-calc="plus">
                                                <span data-link="<?= Yii::$app->urlManager->createUrl(['cart/index', 'type' => 'add', 'product_id' => $product->product_id]) ?>"
                                                     class="add">plus</span>
                                                <i class="material-icons">add</i>
                                            </button>
                                        </div>
                                        <div class="calculator-boxing small"><b>5</b> упаковок</div>
                                        <div class="d-none" data-calc-perbox="<?= $model->box ?>"></div>
                                    </div>
                                    <strong>м²&nbsp;</strong>
                                    <!-- .product__calc -->
                                </div>
                                <div class="cart-item-summary col-4 col-sm-3">
                                    <span class="calculator-result"><strong id="resultPrice1"><?= $product->number * $product->price ?></strong> ₽</span>
                                </div>
                            </div>
                            <a data-link="<?= Yii::$app->urlManager->createUrl(['cart/delete', 'id' => $product->product_id]) ?>" class="btn btn-link cart-delete">
                                <span class="sr-only">delete</span>
                                <i class="material-icons" aria-hidden="">close</i>
                            </a>
                        </div><!-- .cart-item -->
                        <?php } ?>
                    </div><!-- .cart-list -->
                    <div class="cart-result">
                        <div class="cart-result-sum text-right">
                            <div class="d-inline-block border-bottom border-success">
                                <span>Итого к оплате:</span>
                                <strong id="resultsSummary"><?= $totalPrice ?></strong> <strong>₽</strong>
                            </div>
                        </div>
                    </div><!-- .cart-result -->
                <?php }else{ ?>
                    <p>Ваша корзина пустая</p>
                <?php } ?>
            </div>
            <div class="modal-footer d-flex flex-column align-items-end">
                <?php if($products){ ?>
                    <button class="btn btn-info btn-icon" data-toggle="modal" data-target="#buyNowModal">
                        <span>Купить в 1 клик</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                    <a href="<?= $urlCheckout ?>" class="btn btn-primary btn-icon" role="button" title="Оформить заказ">
                        <span>Оформить заказ</span>
                        <i class="material-icons">arrow_forward</i>
                    </a>
                <?php }else{ ?>
                    <a href="<?= $catalog ?>" class="btn btn-primary btn-icon" role="button" title="Каталог">
                        <span>Каталог</span>
                        <i class="material-icons">shopping_cart</i>
                    </a>
                <?php } ?>
            </div>
        </div>
    </div>
</div><!-- .modal-cart -->

<?php
$js = <<<JS
$(document).ready(function() {
$(".minus").click(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            
        }
    });
});//end click
$(".add").click(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            
        }
    });
});//end click

$(".cart-delete").click(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            
        }
    });
});//end click

$(".nums input").change(function(e){
    e.preventDefault();
    var link = $(this).data('link');
    $.get(link + "&value=" + this.value, function(data, status) {
        if (status == "success") {
           
        }
    });
});//end click
});
JS;

$this->registerJs($js);
