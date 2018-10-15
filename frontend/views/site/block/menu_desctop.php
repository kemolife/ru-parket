<?php foreach ($mainCategories as $mainCategory) { ?>
    <li class="nav-item ">
        <a class="nav-link d-flex justify-content-between border-bottom" href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $mainCategory->id]) ?>">
            <span><?= $mainCategory->name ?></span>
            <i class="material-icons">chevron_right</i>
        </a>
        <?php $firstLevelCats = \common\models\Category::find()->where(['parent_id' => $mainCategory->id])->all() ?>
        <div class="collapse submenu submenu-ab">
            <div class="row">
                <div class="col-5">
                    <div class="row">
                        <?php foreach (array_slice($firstLevelCats, 0, 2) as $firstLevelCat) { ?>
                            <div class="col-6 submenu-column">
                                <?= $this->render('menu_desctop_block', ['firstLevelCat' => $firstLevelCat]); ?>
                                <a href="<?= Yii::$app->urlManager->createUrl(['/category']) ?>" class="arrow-right link-more" title="Смотреть все">
                                    <span class="border-bottom">Смотреть все</span>
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </div>
                        <?php }
                        unset($firstLevelCat);
                        ?>
                    </div>
                </div><!-- .col-5 -->
                <div class="col-7">
                    <div class="row">
                        <?php foreach (array_slice($firstLevelCats, 2) as $firstLevelCat) { ?>
                            <div class="col-4 submenu-column">
                               <?= $this->render('menu_desctop_block', ['firstLevelCat' => $firstLevelCat]); ?>
                            </div>
                        <?php } ?>
                    </div>
                </div><!-- .col-7 -->
            </div>
        </div>
    </li>
<?php } ?>