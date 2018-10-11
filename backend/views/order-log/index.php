<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Лог заказов';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('Создать ' . 'Лог заказов', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'order_id',
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    return \common\models\Order::getStatusLabels($model->status);
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    \common\models\Order::getStatusLabels(),
                    ['class' => 'form-control']
                )
            ],
            'remark',
            'created_at:datetime',
            // 'updated_at',
            [
                'attribute' => 'created_by',
                'value' => function ($model) {
                    return $model->createdBy ? $model->createdBy->username : '-';
                },
            ],
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{update} {delete}'],
        ],
    ]); ?>

</div>
