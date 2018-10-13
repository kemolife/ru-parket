<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>

<?php $form = ActiveForm::begin([
    'id' => 'comment-form',
    'action' => Yii::$app->urlManager->createUrl(['/comment/create']),
    'options' => ['class' => 'product__tabs--form']
]); ?>

<?php if (Yii::$app->user->isGuest) { ?>
    <div class="d-md-flex justify-content-md-between">
        <?= $form->field($model, 'username')->textInput((['maxlength' => 32, 'class' => 'form-control'])); ?>
        <?= $form->field($model, 'email')->textInput((['maxlength' => 32, 'class' => 'form-control'])); ?>
    </div>
<?php } ?>
<?= $form->field($model, 'product_id')->hiddenInput((['maxlength' => 32, 'class' => 'form-control', 'value' => $product->id])); ?>
<div class="form-group">
    <?= $form->field($model, 'content')->textarea(['rows' => 6, 'class' => 'form-control']) ?>
</div>

<div class="text-center text-sm-right">
    <?= Html::button('<span>Опубликовать</span>
        <i class="material-icons">arrow_forward</i>', ['class' => 'btn btn-primary btn-icon', 'type' => 'submit']) ?>
</div>

<?php ActiveForm::end(); ?>