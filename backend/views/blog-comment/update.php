<?php

use common\models\BlogComment;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model BlogComment */

$this->title = 'Редактировать ' . 'Блог комментари' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Блог комментари', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="blog-comment-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
