<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Cart */

$this->title = 'Создать ' .'Корзину';
$this->params['breadcrumbs'][] = ['label' => 'Корзину', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cart-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
