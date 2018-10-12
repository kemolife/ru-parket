<?php

use common\models\YesNo;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Banner;

/* @var $this yii\web\View */
/* @var $model common\models\Banner */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="banner-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['enctype'=>'multipart/form-data'],
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'image')->fileInput() ?>
    <?php if($model->image){ ?>
        <img width="20%" src="/<?= $model->image ?>">
    <?php } ?>

    <?= $form->field($model, 'description_big')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'description_small')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ?  'Создать' :  'Изменить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
