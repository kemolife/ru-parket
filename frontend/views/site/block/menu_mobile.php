<?php foreach ($mainCategories as $mainCategory) { ?>
    <li class="nav-item border-bottom ">
        <a class="nav-link d-flex justify-content-between"
           href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $mainCategory->id]) ?>">
            <span><?= $mainCategory->name ?></span>
            <i class="material-icons">chevron_right</i>
        </a>
        <?php $firstLevelCats = \common\models\Category::find()->where(['parent_id' => $mainCategory->id])->all() ?>
        <ul class="nav collapse submenu submenu-a">
            <?php foreach ($firstLevelCats as $firstLevelCat) { ?>
                <li class="border-bottom menuitem submenu-a-item">
                    <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $firstLevelCat->id]) ?>"
                       class="menulink submenu-a-link d-flex justify-content-between align-items-center">
                        <span><?= $firstLevelCat->name ?></span>
                        <i class="material-icons">chevron_right</i>
                    </a>
                    <figure class="submenu-img"><img src="<?= $firstLevelCat->banner ?>" alt="submenu pic"></figure>
                    <?php $secondLevelCats = \common\models\Category::find()->where(['parent_id' => $firstLevelCat->id])->all() ?>
                    <ul class="nav collapse submenu submenu-b">
                        <?php foreach ($secondLevelCats as $secondLevelCat) { ?>
                            <li class="border-bottom menuitem submenu-b-item">
                                <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $secondLevelCat->id]) ?>"
                                   class="menulink submenu-b-link d-flex justify-content-between align-items-center">
                                    <span><?= $secondLevelCat->name ?></span>
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>
        </ul>
    </li>
<?php } ?>