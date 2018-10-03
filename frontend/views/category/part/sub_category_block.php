<div class="categories-sub-item border">
    <div class="categories-sub-title">
        <div class="h3"><a href="<?= Yii::$app->urlManager->createUrl(['category/catalog', 'id' => $cat->id]) ?>" class="border-bottom border-white"
                           title="category title"><?= $cat->name ?></a></div>
        <figure class="categories-sub-img"><img src="<?= $cat->banner ?>"
                                                class="img-fluid" alt="<?= $cat->banner ?>">
        </figure>
    </div>
    <ul class="nav flex-column categories-sub-list">
        <?php
        $subCatLevelTwo = \common\models\Category::find()->where(['parent_id' => $cat->id])->all();
        foreach ($subCatLevelTwo as $item) { ?>
            <li>
                <a href="<?= Yii::$app->urlManager->createUrl(['category/catalog', 'id' => $item->id]) ?>" title="<?= $item->name ?>" class="categories-sub-link">
                    <span><?= $item->name ?></span>
                </a>
            </li>
        <?php } ?>
    </ul>
</div>