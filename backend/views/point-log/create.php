<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\PointLog */

$this->title = 'Создать ' .'Point Log';
$this->params['breadcrumbs'][] = ['label' =>'Point Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="point-log-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
