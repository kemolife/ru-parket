<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Settings */

$this->title =  'Создать ' .  'Настройки';
$this->params['breadcrumbs'][] = ['label' =>  'Настройки', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="banner-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
