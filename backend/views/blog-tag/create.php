<?php

use common\models\BlogTag;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model BlogTag */

$this->title = 'Создать ' . 'Блог теги';
$this->params['breadcrumbs'][] = ['label' => 'Блог теги', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-tag-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
