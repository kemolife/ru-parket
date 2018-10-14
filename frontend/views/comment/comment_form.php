<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>

<?php $form = ActiveForm::begin([
    'id' => 'comment-form',
    'action' => Yii::$app->urlManager->createUrl(['/product/view?id='.$product->id]),
    'options' => ['class' => 'product__tabs--form']
]); ?>

<?php if (Yii::$app->user->isGuest) { ?>
    <div class="d-md-flex justify-content-md-between">
        <div class="form-group">
            <label for="checkoutDeliveryAddress">Ваше имя *</label>
            <?= Html::activeTextInput($model, 'username', ['class' => 'form-control']) ?>
            <?= Html::error($model, 'username', ['tag' => 'small', 'class' => 'text-danger']); ?>
        </div>
        <div class="form-group">
            <label for="checkoutDeliveryAddress">Электронный адрес</label>
            <?= Html::activeTextInput($model, 'email', ['class' => 'form-control']) ?>
            <?= Html::error($model, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
        </div>
    </div>
<?php } ?>
<div class="form-group">
    <div class="form-group">
        <label for="checkoutDeliveryAddress">Ваш отзыв...</label>
        <?= Html::activeTextarea($model, 'content', ['rows' => 6,'class' => 'form-control']) ?>
        <?= Html::error($model, 'content', ['tag' => 'small', 'class' => 'text-danger']); ?>
    </div>
</div>

<div class="text-center text-sm-right">
    <?= Html::button('<span>Опубликовать</span>
        <i class="material-icons">arrow_forward</i>', ['class' => 'btn btn-primary btn-icon', 'type' => 'submit']) ?>
</div>

<?php ActiveForm::end(); ?>