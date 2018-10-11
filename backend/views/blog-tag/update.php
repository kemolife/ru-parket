<?php

use common\models\BlogTag;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model BlogTag */

$this->title = 'Редактировать ' . 'Блог теги' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Блог теги', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="blog-tag-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
