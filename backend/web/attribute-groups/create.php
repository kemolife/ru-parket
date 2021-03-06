<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\AttributeGroup */

$this->title = 'Create Attribute Group';
$this->params['breadcrumbs'][] = ['label' => 'Attribute Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="attribute-group-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
