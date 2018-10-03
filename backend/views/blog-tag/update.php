<?php

use common\models\BlogTag;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model BlogTag */

$this->title = Yii::t('blog', 'Update ') . Yii::t('blog', 'Blog Tag') . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('blog', 'Blog Tags'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('blog', 'Update');
?>
<div class="blog-tag-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
