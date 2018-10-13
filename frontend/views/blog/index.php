<?php

use yii\widgets\LinkPager;
$this->title = 'Блог';
$this->params['breadcrumbs'][] = $this->title;

?>
<main class="main" role="main">
    <div class="container blog">
        <nav aria-label="hidden__down--md breadcrumb">
            <ol class="breadcrumb">
                <?= \yii\widgets\Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    'options' => ['class' => 'breadcrumb'],
                    'tag' => 'div',
                    'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
                    'activeItemTemplate' => '<li class="breadcrumb-item active" aria-current="page">{link}</li>',
                ]) ?>
            </ol>
        </nav>
        <header class="page-title text-center">
            <div class="h1 border-bottom"><?= $this->title ?></div>
            <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.</p>
            <p></p>
        </header>
        <div class="blog__section blog__top">
            <div class="row">

                <?php
                /**
                 * @var \common\models\BlogPost $bigPost
                 */
                foreach ($bigPosts as $bigPost) { ?>
                    <div class="col-sm-6">
                        <article class="post blog__top--post">
                            <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $bigPost->id]) ?>"
                               title="top post" class="blog__top--link">
                                <img src="/<?= $bigPost->banner ?>" class="post-img" alt="">
                                <div class="blog__top--details post-details text-light">
                                    <div class=h2><?= $bigPost->title ?></div>
                                    <div class="d-flex">
                                        <div class="d-flex post-details-date">
                                            <i class="material-icons">watch_later</i>
                                            <span class="post-details-content"><?= date('d.m.Y', $bigPost->created_at) ?></span>
                                        </div>
                                        <div class="d-flex post-details-comments">
                                            <i class="material-icons">chat_bubble_outline</i>
                                            <span class="post-details-content"><?= $bigPost->commentsCount ?></span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="blog__tag bg-primary"><a
                                        href="<?= Yii::$app->urlManager->createUrl(['/blog', 'catalog' => $bigPost->catalog->id]) ?>"
                                        title="post tag"><?= $bigPost->catalog->title ?></a></div>
                        </article>
                    </div>
                <?php } ?>
            </div>
        </div>
        <div class="blog__section blog__pop">
            <div class="blog__section--title h1 border-bottom">Популярное</div>
            <div class="blog__pop--slider">
                <?php
                /**
                 * @var \common\models\BlogPost $popularsPost
                 */
                foreach ($popularsPosts as $popularPost) { ?>
                    <article class="post blog__pop--post">
                        <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $popularPost->id]) ?>"
                           title="top post" class="blog__pop--link post">
                            <figure class="post-img">
                                <img src="/<?= $popularPost->banner ?>" alt="">
                            </figure>
                            <div class=h2><?= $popularPost->title ?></div>
                        </a>
                        <div class="blog__pop--details post-details">
                            <div class="d-flex post-details-date text-secondary">
                                <i class="material-icons">watch_later</i>
                                <span class="post-details-content"><?= date('d.m.Y', $popularPost->created_at) ?></span>
                            </div>
                        </div>
                        <div class="blog__tag bg-primary"><a
                                    href="<?= Yii::$app->urlManager->createUrl(['/blog', 'catalog' => $popularPost->catalog->id]) ?>"
                                    title="post tag"><?= $popularPost->catalog->title ?></a></div>
                    </article>
                <?php } ?>
            </div>
        </div>
        <div class="blog__section blog__last">
            <div class="blog__section--title h1 border-bottom">Статьи</div>
            <?php foreach ($posts as $post) { ?>
                <article class="blog__last--post post">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <div class="blog__last--link">
                                <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $post->id]) ?>"
                                   title="title post" class="">
                                    <img src="/<?= $post->banner ?>" alt="">
                                </a>
                                <div class="blog__tag bg-primary"><a
                                            href="<?= Yii::$app->urlManager->createUrl(['/blog', 'catalog' => $post->catalog->id]) ?>"
                                            title="post tag"><?= $post->catalog->title ?></a></div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-8">
                            <div class="h2"><a
                                        href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $post->id]) ?>"
                                        title="post title"><?= $post->title ?></a></div>
                            <div class="blog__last--details post-details d-flex">
                                <div class="d-flex post-details-date text-secondary">
                                    <i class="material-icons">watch_later</i>
                                    <span class="post-details-content"><?= date('d.m.Y', $post->created_at) ?></span>
                                </div>
                            </div>
                            <div class="post-content">
                                <p><?= $post->replaceContent ?></p>
                            </div>
                            <div class="post-shares d-flex justify-content-between align-items-center">
                                <span class="post-shares-title">Поделится:</span>
                                <div class="nav" role="list">
                                    <a href="social-link.html" title="social 1" role="listitem"><img
                                                src="..//img/svg/facebook.svg" alt="social 1"></a>
                                    <a href="social-link.html" title="social 2" role="listitem"><img
                                                src="..//img/svg/google-plus.svg" alt="social 2"></a>
                                    <a href="social-link.html" title="social 3" role="listitem"><img
                                                src="..//img/svg/odnoklassniki-logo.svg" alt="social 3"></a>
                                    <a href="social-link.html" title="social 4" role="listitem"><img
                                                src="..//img/svg/vk.svg" alt="social 4"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            <?php } ?>
        </div>
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
    </div>

</main>

<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-blog');
</script>