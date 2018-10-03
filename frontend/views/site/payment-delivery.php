<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;
?>
<!-- main -->
<main class="main" role="main">


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
        <header class="page-title text-center">
            <div class="h1 border-bottom"><?= $model->header ?></div>
        </header>
        <div class="row">
            <?= $this->render('block/left_sidebar_menu') ?>
            <?= $model->body ?>
        </div>
    </div>

</main>