<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Address */

$this->title = 'Создать ' . 'Адрес';
$this->params['breadcrumbs'][] = ['label' => 'Адрес', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="address-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
