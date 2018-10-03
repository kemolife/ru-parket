<?php

$blockType = [
    'new' => [
        'class' => 'badge-success',
        'title' => 'Новинка'
    ],
    'promote' => [
        'class' => 'badge-danger',
        'title' =>  $item->stock
    ],
    'hot' => [
        'class' => 'badge-warning',
        'title' =>  'Хит'
    ]
]

?>
<div class="card card-product">
    <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>"
       class="card-img-top"
       title="<?= $item->name ?>">
        <img class="card-img-main" src="<?= $item->thumb ?>"
             alt="Береза желтая картри лак береза желтая">
        <img class="card-img-firm" src="/img/slider1/slide1.jpg" alt="firm img">
        <div class="card-badge">
            <span class="badge <?= $blockType[$type]['class'] ?>"><?= $blockType[$type]['title'] ?></span>
        </div>
    </a>
    <div class="card-body">
        <div class="h2 card-title"><a
                href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>"
                title="<?= $item->name ?>"><?= $item->name ?></a></div>
        <div class="d-flex card-price">
            <div class="card-price-old"><?= $item->market_price ?><span
                    class="currency">&#8381;/м <sup>2</sup></span></div>
            <div class="card-price-new"><?= $item->price ?><span
                    class="currency">&#8381;/м <sup>2</sup></span></div>
        </div>
        <a href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $item->id]) ?>" class="btn btn-primary btn-buy" data-product = "<?= $item->id ?>" role="button" title="Купить">
            <i class="material-icons">shopping_cart</i>
            <span>Купить</span>
        </a>
    </div>
</div>