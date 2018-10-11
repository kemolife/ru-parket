<?php

use common\models\BlogPost;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model BlogPost */

$this->title = 'Редактировать ' . 'Блог посты' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Блог посты', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="blog-post-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
