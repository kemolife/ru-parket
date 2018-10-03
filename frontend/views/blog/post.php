<!-- main -->
<?php
/**
 * @var \common\models\BlogPost $post
 * @var \common\models\BlogTag $tag
 * @var \common\models\BlogComment $comment
 */

use common\models\BlogTag;

?>
<main class="main" role="main">

    <div class="container blog blog__single">
        <nav aria-label="hidden__down--md breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Главная</a></li>
                <li class="breadcrumb-item active" aria-current="page">Блог</li>
            </ol>
        </nav>
        <header class="page-title text-light">
            <h1><?= $post->title ?></h1>
            <div class="d-flex post-details">
                <div class="d-flex post-details-date">
                    <i class="material-icons">watch_later</i>
                    <span class="post-details-content"><?= date('d.m.Y', $post->created_at) ?></span>
                </div>
                <div class="d-flex post-details-comments">
                    <i class="material-icons">chat_bubble_outline</i>
                    <span class="post-details-content"><?= $post->commentsCount ?></span>
                </div>
            </div>
            <img src="/<?= $post->banner ?>" alt="post bg image" class="page-title-img">
        </header>
        <div class="blog__section">
            <article class="post blog__single--post">
                <?= $post->content ?>
            </article>
        </div>
        <div class="post-shares d-flex justify-content-between align-items-center">
            <span class="post-shares-title">Поделится:</span>
            <div class="nav" role="list">
                <a href="social-link.html" title="social 1" role="listitem"><img src="/img/svg/facebook.svg"
                                                                                 alt="social 1"></a>
                <a href="social-link.html" title="social 2" role="listitem"><img src="/img/svg/google-plus.svg"
                                                                                 alt="social 2"></a>
                <a href="social-link.html" title="social 3" role="listitem"><img src="/img/svg/odnoklassniki-logo.svg"
                                                                                 alt="social 3"></a>
                <a href="social-link.html" title="social 4" role="listitem"><img src="/img/svg/vk.svg"
                                                                                 alt="social 4"></a>
            </div>
        </div>
        <div class="blog__tags">
            <div class="h2">Тэги:</div>
            <div class="nav">
                <?php foreach (BlogTag::string2array($post->tags) as $tag) { ?>
                    <a href="<?= Yii::$app->getUrlManager()->createUrl(['/blog/search', 'tag' => $tag]) ?>" class="blog__tags--link border-bottom"><?= $tag ?></a>
                <?php } ?>
            </div>
        </div>
        <div class="products__recommend">
            <div class="h1">Рекомендуем посмотреть</div>
            <div class="products__recommend--slider">
                <?php foreach ($recommendedItems as $item) {
                    echo $this->render('../site/block/main_products_part', ['type' => 'promote', 'item' => $item]);
                } ?>
            </div>
        </div>
        <div class="blog__footer">
            <div class="h2"><?= $post->commentsCount ?> коментарий</div>
            <div class="row">
                <div class="col-md-6">
                    <div class="blog__comments border-top">
                        <div class="blog__comments--list comments">
                            <?php foreach ($post->comments as $comment){ ?>
                            <div class="comments__item">
                                <div class="comments__title h3"><?= $comment->author ?></div>
                                <div class="comments__date text-secondary">
                                    <p><?= date('d.m.Y', $comment->created_at) ?></p></div>
                                <div class="comments__content">
                                    <p><?= $comment->content ?></p>
                                </div>
                            </div>
                        </div><!-- .blog__comments--list -->
                        <?php } ?>
                        <?= $this->render('comment_form', [
                            'model' => $comment,
                        ]); ?>
                    </div><!-- .blog__comments -->
                </div>
                <div class="col-md-6">
                    <div class="blog__sibling--posts border-top">
                        <div class="row">
                            <div class="col-6">
                                <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $posts[0]->id]) ?>" class="h3 btn" role="button" title="Пред. пост">
                                    <i class="material-icons">chevron_left</i>
                                    <span class="border-bottom">Пред. пост</span>
                                </a>
                            </div>
                            <div class="col-6 text-right">
                                <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $posts[1]->id]) ?>" class="h3 btn" role="button" title="След. пост">
                                    <span class="border-bottom">След. пост</span>
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <?php foreach ($posts as $post) { ?>
                                <div class="col-6">
                                    <article class="blog__sibling--post">
                                        <a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $post->id]) ?>" class="post-img"
                                           title="<?= $post->title ?>"><img
                                                    src="/<?= $post->banner ?>" alt="post pict"></a>
                                        <div class="h2"><a href="<?= Yii::$app->urlManager->createUrl(['/blog/post', 'id' => $post->id]) ?>"
                                                           title="<?= $post->title ?>"><?= $post->title ?></a></div>
                                    </article>
                                </div>
                            <?php } ?>
                        </div>
                    </div><!-- .blog__sibling -->
                </div>
            </div>
        </div><!-- .blog__footer -->
    </div>

</main>

<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-blog-post');
</script>
