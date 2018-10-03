<div class="cart-item border-bottom">
    <div class="row no-gutters align-items-sm-center">
        <div class="col-sm-6 order-sm-1">
            <div class="h3"><a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $product->product_id]) ?>" title="<?= $product->name ?>"><?= $product->name ?></a></div>
        </div>
        <div class="col-7 col-sm-3 order-sm-0 cart-img">
            <figure class="border border-secondary">
                <img src="<?= $product->thumb ?>" class="img-fluid" alt="<?= $product->name ?>">
            </figure>
        </div>
        <div class="col-5 col-sm-3 order-2 text-right">
            <span class="calculator-result"><strong id="resultPrice1"><?= $product->number * $product->price ?></strong> ₽</span>
        </div>
    </div>
</div><!-- .cart-item -->