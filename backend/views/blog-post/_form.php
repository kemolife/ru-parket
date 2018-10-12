<?php

use common\models\BlogPost;
use common\models\Status;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use funson86\blog\models\BlogCatalog;
use kartik\markdown\MarkdownEditor;
use mihaildev\ckeditor\CKEditor;

/* @var $this yii\web\View */
/* @var $model BlogPost */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="blog-post-form">

    <?php $form = ActiveForm::begin([
        'options'=>['enctype'=>'multipart/form-data'],
    ]); ?>

    <?= $form->field($model, 'catalog_id')->dropDownList(ArrayHelper::map(BlogCatalog::get(0, BlogCatalog::find()->all()), 'id', 'str_label')) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'brief')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'content')->widget(CKEditor::className(),[
        'editorOptions' => [
            'preset' => 'full',
            'inline' => false,
        ],
    ]); ?>

    <?= $form->field($model, 'tags')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'surname')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'banner')->fileInput() ?>

    <?php if($model->banner){ ?>
        <img width="20%" src="/<?= $model->banner ?>">
    <?php } ?>
    <?= $form->field($model, 'click')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList(Status::labels()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ?  'Создать' :  'Изменить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?></div>

    <?php ActiveForm::end(); ?>

</div>
