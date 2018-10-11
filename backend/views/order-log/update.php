<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\OrderLog */

$this->title = 'Редактировать ' . 'Лог заказов' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Лог заказов', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="order-log-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
