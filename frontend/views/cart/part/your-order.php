<?php
$totalNumber = 0;
$totalPrice = 0;
foreach ($products as $product) {
    $totalNumber += $product->number;
    $totalPrice += $product->number * $product->price;
}
?>

<div class="h2">Ваш заказ</div>
<div class="checkout__order border border-primary order-md-0">
    <div class="cart-list">
        <?php foreach ($products as $product) {
            echo $this->render('cart-product', ['product' => $product]);
        } ?>
        <div class="cart-item border-bottom">
            <div class="row no-gutters align-items-center">
                <div class="col-8 col-lg-9 secondary-text">
                    <strong>Доставка по Москве в предедах МКАД</strong>
                </div>
                <div class="col-4 col-lg-3 text-right">
                    <span class="calculator-result"><strong>1500</strong> ₽</span>
                </div>
            </div>
        </div><!-- .cart-item -->
    </div><!-- .cart-list -->
    <div class="cart-result">
        <div class="cart-result-sum text-right">
            <div class="d-inline-block border-bottom border-success">
                <span>Итого к оплате:</span>
                <strong><?= $totalPrice ?></strong>
            </div>
        </div>
    </div>
</div><!-- .checkout__order -->