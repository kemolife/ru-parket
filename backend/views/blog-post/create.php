<?php

use common\models\BlogPost;
use yii\helpers\Html;
use funson86\blog\Module;


/* @var $this yii\web\View */
/* @var $model BlogPost */

$this->title = 'Создать ' . 'Блог посты';
$this->params['breadcrumbs'][] = ['label' => 'Блог посты', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-post-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
