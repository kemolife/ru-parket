<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Cart */

$this->title =  'Редактировать ' .  'Корзину' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' =>  'Корзину', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] =  'Редактировать';
?>
<div class="cart-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
