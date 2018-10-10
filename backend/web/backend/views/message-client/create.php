<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\MessageClient */

$this->title = 'Create Massage Client';
$this->params['breadcrumbs'][] = ['label' => 'Massage Clients', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="massage-client-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
