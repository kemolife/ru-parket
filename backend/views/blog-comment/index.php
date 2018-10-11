<?php

use common\models\BlogCommentSearch;
use common\models\Status;
use common\models\StatusBlog;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel BlogCommentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = ' Блог комментарии';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-comment-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('Создать ' . ' Блог комментарии', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn'],

            [
                'attribute'=>'post_id',
                'value'=>function ($model) {
                    return mb_substr($model->post->title, 0, 15, 'utf-8') . '...';
                },
                /*'filter' => Html::activeDropDownList(
                    $searchModel,
                    'post_id',
                    \funson86\blog\models\BlogPost::getArrayCatalog(),
                    ['class' => 'form-control', 'prompt' => Yii::t('blog', 'Please Filter')]
                )*/
            ],
            [
                'attribute'=>'content',
                'value'=>function ($model) {
                    return mb_substr(Yii::$app->formatter->asText($model->content), 0, 30, 'utf-8') . '...';
                },
            ],
            'author',
            'email:email',
            // 'url:url',
            [
                'attribute' => 'status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->status === Status::STATUS_ACTIVE) {
                        $class = 'label-success';
                    } elseif ($model->status === Status::STATUS_INACTIVE) {
                        $class = 'label-warning';
                    } else {
                        $class = 'label-danger';
                    }

                    return '<span class="label ' . $class . '">' . $model->getStatus()->label . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    Status::labels(),
                    ['class' => 'form-control']
                )
            ],

            // 'create_time',
            // 'update_time',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{update} {delete}'],
        ],
    ]); ?>

</div>
