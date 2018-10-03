<?php

use common\models\BlogTag;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model BlogTag */

$this->title = Yii::t('blog', 'Create ') . Yii::t('blog', 'Blog Tag');
$this->params['breadcrumbs'][] = ['label' => Yii::t('blog', 'Blog Tags'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-tag-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
