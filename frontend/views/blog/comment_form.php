<?php

use yii\helpers\Html;
use yii\helpers\StringHelper;
use yii\widgets\ActiveForm;

?>

<?php $form = ActiveForm::begin([
    'id' => 'comment-form',
    'options' => ['class' => 'blog__comments--form']
]); ?>

<div class="comments__title h3">Напишите ваш отзыв</div>
<div class="d-md-flex justify-content-md-between">
    <?= $form->field($model, 'author')->textInput(['maxlength' => 32, 'class' => 'form-control']); ?>
    <?= $form->field($model, 'email')->textInput(['maxlength' => 32, 'class' => 'form-control']); ?>
</div>
<div class="form-group">
    <?= $form->field($model, 'content')->textarea(['rows' => 6, 'class' => 'form-control']) ?>
</div>

<div class="text-center text-sm-right">
    <?= Html::button('<span>Опубликовать</span><i class="material-icons">arrow_forward</i>', ['class' => 'btn btn-primary btn-icon', 'type' => 'submit']) ?>
</div>


<?php ActiveForm::end(); ?>
