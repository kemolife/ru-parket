<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Cart */

$this->title =  'Update ') .  'Cart') . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' =>  'Carts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] =  'Update');
?>
<div class="cart-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
