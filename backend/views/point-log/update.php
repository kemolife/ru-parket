<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\PointLog */

$this->title = 'Редактировать ' . 'Point Log' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Point Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="point-log-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
