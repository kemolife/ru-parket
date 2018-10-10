<?php use yii\bootstrap\ActiveForm; ?>
<div class="modal fade" id="consultantModal" tabindex="-1" role="dialog" aria-labelledby="consultantModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="h1 modal-title" id="consultantModalTitle">Заказать консультацию технолога</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="material-icons" aria-hidden="true">close</i>
                </button>
            </div>
            <?php
            $form = ActiveForm::begin(
                [
                    'action' => ['message-client/consultant'],
                    'id' => 'consultant',
                    'options' => ['class' => 'form']
                ]
            ); ?>
                <div class="modal-body">
                    <form action="" class="form">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="border border-primary p-3">
                                    <div class="form-checkbox custom-control d-flex">
                                        <input type="radio" id="consultantMethod1" name="customRadio" class="checkbox" checked>
                                        <label class="" for="consultantMethod1"><span>Предварительная консультация без выезда на объект, <strong>БЕСПЛАТНО</strong></span></label>
                                    </div>
                                </div>
                                <div class="border border-primary p-3 my-4">
                                    <div class="form-checkbox custom-control d-flex">
                                        <input type="radio" id="consultantMethod2" name="customRadio" class="checkbox">
                                        <label class="" for="consultantMethod2"><span>Консультация с выездом на объект и проведением комплекса мероприятей, <strong>ПЛАТНО</strong></span></label>
                                    </div>
                                    <div class="pl-3 mt-4">
                                        <?= $settings->cost_departure ?>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="border border-primary p-3">
                                    <p>Все поля обязательны для заполнения!</p>
                                    <?php echo $form->field($model, 'type')->hiddenInput(['value' => '3', 'class' => 'form-control']) ?>
                                    <?php echo $form->field($model, 'name')->textInput(['class' => 'form-control']) ?>
                                    <?php echo $form->field($model, 'tel')->textInput(['class' => 'form-control']) ?>
                                    <?php echo $form->field($model, 'area')->textInput(['type' => 'number', 'class' => 'form-control']) ?>
                                    <?php echo $form->field($model, 'address')->textInput(['class' => 'form-control']) ?>
                                    <p>Также оформить вызов технолога на ваш объект вы можете связавшись с нами по телефону</p>
                                    <p><strong><?= $settings->phone ?></strong> или отправив заявку на электронный адрес <strong><?= $settings->email ?></strong></p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer d-flex flex-column">
                    <button class="btn btn-primary btn-icon" type="submit">
                        <span>Отправить заявку</span>
                        <i class="material-icons">send</i>
                    </button>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div><!-- #consultantModal -->