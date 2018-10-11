<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Category;
use mihaildev\ckeditor\CKEditor;

/* @var $this yii\web\View */
/* @var $model common\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

    <div class="product-form">

        <?php $form = ActiveForm::begin([
            'id' => 'mend-form'
        ]); ?>

        <?= $form->field($model, 'category_id')->dropDownList(ArrayHelper::map(Category::get(0, Category::find()->asArray()->all()), 'id', 'label')) ?>

        <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

        <?= $form->field($model, 'sku')->textInput(['maxlength' => 64]) ?>

        <?= $form->field($model, 'stock')->textInput() ?>

        <?= $form->field($model, 'weight')->textInput(['maxlength' => 10]) ?>

        <?= $form->field($model, 'box')->textInput(['type' => 'number']) ?>

        <?= $form->field($model, 'market_price')->textInput(['maxlength' => 10]) ?>

        <?= $form->field($model, 'price')->textInput(['maxlength' => 10]) ?>

        <?= $form->field($model, 'brief')->textInput(['maxlength' => 255]) ?>

        <?= $form->field($model, 'content')->widget(CKEditor::className(), [
            'editorOptions' => [
                'preset' => 'full',
                'inline' => false,
            ],
        ]); ?>

        <?= $form->field($model, 'keywords')->textInput(['maxlength' => 255]) ?>

        <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

        <?= $form->field($model, 'type')->checkboxList(\common\models\ProductType::labels()) ?>

        <?= $form->field($model, 'brand_id')->dropDownList(ArrayHelper::map(\common\models\Brand::find()->all(), 'id', 'name'), ['prompt' => Yii::t('app', 'Please Select')]) ?>

        <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

        <div class="form-group">
            <?php
            foreach ($model->productImages as $image) {
                echo '<div style="width:150px; float: left; text-align: center">';
                echo '<a href="' . \Yii::$app->getUrlManager()->createUrl(['product/remove', 'id' => $image->id]) . '" title="' . Yii::t('app', 'Delete') . '" data-confirm="' . Yii::t('app', 'Are you sure you want to delete this item?') . '" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a><br>';
                echo '<img src="' . $image->thumb . '"  width=100><br>';
                echo '</div>';
            } ?>
            <div style="clear:both"></div>
        </div>

        <div class="form-group">
            <?php $id = $model->isNewRecord?(($last->id)+1):$model->id; ?>
            <?= dastanaron\dropzone\DropZoneWidget::widget([
                'id' => 'myDropZone', // ID on the div element
                'site_url' => 'http://localhost:8081/', //If you are using JS file generation, you must specify
                'generateJSFile' => true, //Generate js file (the default is on)
                'options' => [
                    'url' => '/product/image-upload?product=' . $id, //Where to send a request to save the file
                    'maxFiles' => 10, //The maximum number of files
                    'acceptedFiles' => 'image/*', // MIME - file types
                ],
                'events' => [
                    'success' => 'function(event, response) {
                console.log("success")
                $("input#inputid").val(response.id);
            }',
                ],
            ]); ?>
        </div>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ?  'Создать' :  'Изменить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?></div>

        <?php ActiveForm::end(); ?>

    </div>

<?php $this->registerJs('
function removeImage() {
    alert("ok");
}
') ?>