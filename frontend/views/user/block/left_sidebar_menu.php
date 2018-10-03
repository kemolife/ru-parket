<div class="col-lg-2 sidebar">
    <nav class="hidden__down--md nav flex-column">
        <a href="<?= Yii::$app->urlManager->createUrl(['user/profile']) ?>" class="nav-link <?= $first ?>" title="Личные данные">Личные данные</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['order/index']) ?>" class="nav-link <?= $second ?>" title="Мои заказы">Мои заказы</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['cart']) ?>" class="nav-link " title="Товар в корзине">Товар в корзине</a>
    </nav>
</div>