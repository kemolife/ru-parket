<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\MessageClient */

$this->title = 'Редактировать Клиенсткие сообщения: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Клиенсткие сообщения', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Редактировать';
?>
<div class="massage-client-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
