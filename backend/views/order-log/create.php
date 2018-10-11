<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\OrderLog */

$this->title = 'Создать ' . 'Лог заказов';
$this->params['breadcrumbs'][] = ['label' => 'Лог заказов', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-log-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
