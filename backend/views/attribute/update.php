<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Attribute */

$this->title = 'Редактировать Атрибут' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Атрибут', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="attribute-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
