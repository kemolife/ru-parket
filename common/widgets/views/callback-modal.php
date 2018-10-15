<?php use yii\bootstrap\ActiveForm; ?>
    <div class="modal fade" id="callbackModal" tabindex="-1" role="dialog" aria-labelledby="callbackModalTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h2 modal-title" id="callbackModalTitle">Обратный звонок</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons" aria-hidden="true">close</i>
                    </button>
                </div>
                <?php
                $form = ActiveForm::begin(
                    [
                        'action' => ['message-client/callback'],
                        'id' => 'callback',
                        'validateOnSubmit' => false,
                        'validateOnChange' => false,
                        'validateOnBlur' => false,
                        'options' => ['class' => 'form']
                    ]
                ); ?>
                <div class="modal-body">
                    <?php echo $form->field($model, 'type')->hiddenInput(['value' => '2', 'class' => 'form-control'])->label(false) ?>
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
    </div><!-- #callbackModal -->

<?php
$js = <<<JS
$(document).ready(function () {
        $('form#callback').on('submit', function (event) {
            event.preventDefault();
            event.stopImmediatePropagation();
            var yiiform = $(this);
            $.ajax({
                type: yiiform.attr('method'),
                url: yiiform.attr('action'),
                data: yiiform.serializeArray()
            }
        )
        .done(function(data) {
            if(data.success) {
                $('#callbackModal').modal('hide');
                  $('.alert').addClass('show').alert();
            } else if (data.validation) {
                // server validation failed
                yiiform.yiiActiveForm('updateMessages', data.validation, true); // renders validation messages at appropriate places
            } else {
                // incorrect server response
            }
        })
        .fail(function () {
            // request failed
        });
        return false;
         });
        
    });
JS;

$this->registerJs($js);
?>