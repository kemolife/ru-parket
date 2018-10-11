<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Comment */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="comment-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form'
    ]); ?>

    <?php if ($model->isNewRecord) { ?>
        <?= $form->field($model, 'user_id')->textInput() ?>
        <?= $form->field($model, 'product_id')->textInput() ?>
    <?php } ?>

    <?= $form->field($model, 'star')->textInput() ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'point')->textInput() ?>

    <?= $form->field($model, 'up')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ?  'Создать' :  'Изменить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?></div>

    <?php ActiveForm::end(); ?>

</div>
