<?php

use common\models\YesNo;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Category;

/* @var $this yii\web\View */
/* @var $model common\models\Category */
/* @var $form yii\widgets\ActiveForm */
$parentCategory = ArrayHelper::merge([0 => 'Главная категория'], ArrayHelper::map(Category::get(0, Category::find()->asArray()->all()), 'id', 'label'));
unset($parentCategory[$model->id]);
?>

<div class="category-form">

    <?php $form = ActiveForm::begin([
        'id' => 'mend-form',
        'options' => ['enctype'=>'multipart/form-data']
    ]); ?>

    <?= $form->field($model, 'parent_id')->dropDownList($parentCategory) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => 128]) ?>

    <?= $form->field($model, 'brief')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'is_nav')->dropDownList(YesNo::labels()) ?>

    <?= $form->field($model, 'banner')->fileInput() ?>

    <?php if($model->banner){ ?>
        <img width="20%" src="/<?= $model->banner ?>">
    <?php } ?>

    <?= $form->field($model, 'keywords')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'redirect_url')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'sort_order')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList(\common\models\Status::labels()) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ?  'Создать' :  'Изменить', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?></div>

    <?php ActiveForm::end(); ?>

</div>
