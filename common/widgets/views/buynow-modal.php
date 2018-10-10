<?php

use yii\widgets\ActiveForm;

?>
<div class="modal fade" id="buyNowModal" tabindex="-1" role="dialog" aria-labelledby="buyNowModalTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="h2 modal-title" id="buyNowModalTitle">Купить в 1 клик</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <?php $form = ActiveForm::begin(
                [
                    'action' => ['message-client/buy-now'],
                    'id' => 'buy-now',
                    'options' => ['class' => 'form']
                ]
            ); ?>
                <div class="modal-body">
                    <?php echo $form->field($model, 'type')->hiddenInput(['value' => '1', 'class' => 'form-control']) ?>
                    <?php echo $form->field($model, 'name')->textInput(['class' => 'form-control']) ?>
                    <?php echo $form->field($model, 'tel')->textInput(['class' => 'form-control']) ?>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info btn-icon" type="submit">
                        <span>Заказать звонок</span>
                        <i class="material-icons">arrow_forward</i>
                    </button>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div><!-- #buyNowModal -->