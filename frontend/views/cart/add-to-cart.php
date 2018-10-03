<?php
$this->registerCssFile('@web/css/add-to-cart.css', ['depends' => \frontend\assets\AppAsset::className()]);

?>
<div id="wrapper">
    <div class="add_ok">
        <div class="tip"> Товар успешно добавлен в корзину покупок </div>
        <div class="go"> <a class="back" href="<?= Yii::$app->urlManager->createUrl(['product/view', 'id' => $id]) ?>">&lt;&lt;Продолжить покупки</a> <a class="btn" href="<?= Yii::$app->urlManager->createUrl(['/cart']) ?>">Корзина</a> </div>
    </div>
</div>
