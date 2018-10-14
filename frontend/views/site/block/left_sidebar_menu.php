<?php $action = Yii::$app->controller->action->id;
?>
<div class="col-lg-2 sidebar">
    <nav class="hidden__down--md nav flex-column">
        <a href="<?= Yii::$app->urlManager->createUrl(['site/our-clients']) ?>" class="nav-link <?= $action == 'our-clients'?'active':'' ?>" title="Наши клиенти">Наши
            клиенти</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/our-partners']) ?>" class="nav-link <?= $action == 'our-partners'?'active':'' ?>"
           title="Наши  партнери">Наши партнери</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/our-projects']) ?>" class="nav-link <?= $action == 'our-projects'?'active':'' ?>" title="Наши проекти">Наши
            проекти</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/about']) ?>"
           class="nav-link <?= $action == 'about'?'active':'' ?>" title="О компании">О компании</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['/blog']) ?>"
           class="nav-link <?= $action == 'index'?'active':'' ?>" title="Блог">Блог</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/payment-delivery']) ?>"
           class="nav-link <?= $action == 'payment-delivery'?'active':'' ?>" title="Оплата и доставка">Оплата и доставка</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/warranty']) ?>"
           class="nav-link <?= $action == 'warranty'?'active':'' ?>" title="Гарантия">Гарантия</a>
        <a href="<?= Yii::$app->urlManager->createUrl(['site/service']) ?>"
           class="nav-link <?= $action == 'service'?'active':'' ?>" title="Сервис">Сервис</a>
    </nav>
</div>