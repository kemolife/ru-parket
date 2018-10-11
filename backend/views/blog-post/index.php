<?php

use common\models\BlogPost;
use common\models\BlogPostSearch;
use common\models\Status;
use common\models\StatusBlog;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel BlogPostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Блог посты';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('Создать ' . 'посты блога', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn'],

            [
                'attribute'=>'catalog_id',
                'value'=>function ($model) {
                        return $model->catalog->title;
                    },
                'filter' => Html::activeDropDownList(
                        $searchModel,
                        'catalog_id',
                        BlogPost::getArrayCatalog(),
                        ['class' => 'form-control']
                    )
            ],
            'title',
            // 'content:ntext',
            // 'tags',
            // 'surname',
            // 'click',
            // 'user_id',
            'commentsCount',
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
            'created_at:date',
            // 'update_time',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{update} {delete}'],
        ],
    ]); ?>

</div>
