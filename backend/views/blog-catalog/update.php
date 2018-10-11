<?php

use yii\helpers\Html;
use funson86\blog\Module;

/* @var $this yii\web\View */
/* @var $model funson86\blog\models\BlogCatalog */

$this->title = 'Редактировать ' .'Блог каталог' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' =>'Блог каталог', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="blog-catalog-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
