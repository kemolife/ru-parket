<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Attribute */

$this->title = 'Создать Атрибут';
$this->params['breadcrumbs'][] = ['label' => 'Атрибут', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="attribute-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
