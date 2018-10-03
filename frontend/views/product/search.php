<?php
/* @var $this yii\web\View */

use yii\widgets\LinkPager;

$this->title = 'Поиск';
$this->params['breadcrumbs'][] = $this->title;
?>

<!-- main -->
<main class="main" role="main">
    <section class="catalog search">
        <div class="container">
            <nav aria-label="hidden__down--md breadcrumb">
                <?= \yii\widgets\Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    'options' => ['class' => 'breadcrumb'],
                    'tag' => 'div',
                    'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
                    'activeItemTemplate' => '<li class="breadcrumb-item active" aria-current="page">{link}</li>',
                ]) ?>
            </nav>
            <div class="row no-gutters catalog__wrap">
                <div class="col sidebar catalog__sidebar">
                    <div class="h1"><?= $keyword ?></div>
                    <?php foreach ($subCatFirstLevel as $item) { ?>
                        <a href="<?= Yii::$app->urlManager->createUrl(['category/catalog', 'id' => $item->id]); ?>"
                           class="nav-link " title="<?= $item->name ?>"><?= $item->name ?></a>
                    <?php } ?>
                </div>
                <div class="col catalog__content">
                    <div id="catFilter" class="catalog__panel filter mb-3" aria-hidden="true">
                        <div class="filter-top">
                            <?= $this->render('../category/part/filter-top') ?>
                        </div>
                        <?= $this->render('../category/part/filter-main') ?>
                    </div><!-- .categires__panel--filters -->
                    <div class="catalog__panel sorting">
                        <?= $this->render('../category/part/filter-sorting') ?>
                    </div><!-- .categires__panel--sorting -->
                    <div class="catalog__list">
                        <div class="d-flex justify-content-xl-between">
                            <?php foreach ($products as $product) { ?>
                                <?= $this->render('../category/part/product', ['item' => $product]) ?>
                            <?php } ?>
                        </div>
                    </div><!-- .categires__list -->
                    <nav aria-label="blog page navigation">
                        <?= LinkPager::widget([
                            'pagination' => $pagination,
                            'lastPageLabel' => '<i class="material-icons" aria-hidden>chevron_right</i>',
                            'firstPageLabel' => '<i class="material-icons"aria-hidden>chevron_left</i>',
                            'nextPageLabel' => false,
                            'prevPageLabel' => false,
                            'hideOnSinglePage' => true,
                            'linkOptions' => [
                                'class' => 'page-link',
                            ],
                            'pageCssClass' => [
                                'class' => 'page-item'
                            ]
                        ]) ?>
                    </nav>
                    <div class="tags__panel">
                        <?= $this->render('../category/part/attr-tags') ?>
                    </div><!-- .tags__panel -->
                </div>
            </div>
        </div>
    </section>

</main>

<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-search');
</script>
