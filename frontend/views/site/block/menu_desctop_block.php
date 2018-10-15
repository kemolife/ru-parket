<div class="submenu-ab-title">
    <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $firstLevelCat->id]) ?>" class="menulink">
        <span><?= $firstLevelCat->name ?></span>
    </a>
    <figure class="submenu-img"><img src="<?= $firstLevelCat->banner ?>" alt="submenu pic">
    </figure>
</div>
<?php $secondLevelCats = \common\models\Category::find()->where(['parent_id' => $firstLevelCat->id])->all() ?>
<ul class="nav flex-column submenu">
    <?php foreach ($secondLevelCats as $secondLevelCat) { ?>
        <li class="submenu-ab-item">
            <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $secondLevelCat->id]) ?>" class="submenu-ab-link">
                <span>$secondLevelCat</span>
            </a>
        </li>
    <?php } ?>
</ul>