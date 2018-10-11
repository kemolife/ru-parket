<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model funson86\blog\models\BlogCatalog */

$this->title = 'Создать ' .'Блог каталог';
$this->params['breadcrumbs'][] = ['label' => 'Блог каталог', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-catalog-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
