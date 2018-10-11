<?php

use common\models\BlogComment;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model BlogComment */

$this->title = 'Создать ' .'Блог комментари';
$this->params['breadcrumbs'][] = ['label' => 'Блог комментари', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-comment-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
