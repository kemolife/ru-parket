<?php

use common\models\YesNo;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Settings;

/* @var $this yii\web\View */
/* @var $model common\models\Settings */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="banner-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['class' => 'form-horizontal', 'enctype'=>'multipart/form-data'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}{hint}</div>\n<div class=\"col-lg-5\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-2 control-label'],
        ],
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'phone')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'email')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'facebook')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'google')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'linkedin')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'twitter')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'youtube')->textInput(['maxlength' => 128]) ?>
    <?= $form->field($model, 'address')->textInput(['maxlength' => 255]) ?>
    <?= $form->field($model, 'seo_title')->textInput(['maxlength' => 255]) ?>
    <?= $form->field($model, 'seo_keywords')->textInput(['maxlength' => 255]) ?>
    <?= $form->field($model, 'seo_categories_title')->textInput(['maxlength' => 255]) ?>
    <?= $form->field($model, 'seo_categories_keywords')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'logo')->fileInput() ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'policy')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'work_hours')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'seo_description')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'work_hours')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'seo_categories_description')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'contact_info')->textarea(['rows' => 6]) ?>
    <?= $form->field($model, 'lat_log')->fileInput() ?>
    <?= $form->field($model, 'cost_departure')->fileInput() ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="">&nbsp;</label>
        <?= Html::submitButton($model->isNewRecord ?  'Create' :  'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
