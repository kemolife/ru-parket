<?php
use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;
?>
<div class="modal fade" id="passSendModal" tabindex="-1" role="dialog" aria-labelledby="passSendModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="h2 modal-title" id="passSendModalTitle">Напомнить пароль</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <?php
            $form = ActiveForm::begin(
                [
                    'action' => Yii::$app->urlManager->createUrl(['site/request-password-reset']),
                    'id' => 'send-pass',
                    'options' => ['class' => 'form'],
                    'method' => 'POST'
                ]
            ); ?>
            <div class="modal-body">
                <?php echo $form->field($model, 'email')->textInput(['class' => 'form-control']) ?>
                <?= Html::error($model, 'email', ['tag' => 'small', 'class' => 'text-danger']); ?>
            </div>
            <div class="modal-footer d-flex flex-column align-items-md-end">
                <button class="btn btn-info btn-icon" type="submit">
                    <span>Напомнить</span>
                    <i class="material-icons">arrow_forward</i>
                </button>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div><!-- #passSendModal -->