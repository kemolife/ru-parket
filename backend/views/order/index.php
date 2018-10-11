<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\Order;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Заказы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            [
                'attribute' => 'user_id',
                'value'=>function ($model) {
                    return $model->user ? $model->user->username : '-';
                },
            ],
            // 'province',
            // 'city',
            // 'district',
            // 'address',
            // 'zipcode',
            // 'phone',
            'mobile',
            // 'email:email',
            // 'remark',
            // 'payment_method',
            [
                'attribute' => 'payment_status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->payment_status === Order::PAYMENT_STATUS_PAID) {
                        $class = 'label-success';
                    } elseif ($model->payment_status === Order::PAYMENT_STATUS_COD) {
                        $class = 'label-warning';
                    } elseif ($model->payment_status === Order::PAYMENT_STATUS_UNPAID) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . ($model->payment_status ? Order::getPaymentStatusLabels($model->payment_status) : '-') . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'payment_status',
                    Order::getPaymentStatusLabels(),
                    ['class' => 'form-control']
                )
            ],
            // 'payment_id',
            // 'payment_name',
            // 'payment_fee',
            [
                'attribute' => 'shipment_status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->shipment_status === Order::SHIPMENT_STATUS_RECEIVED) {
                        $class = 'label-success';
                    } elseif ($model->shipment_status === Order::SHIPMENT_STATUS_SHIPPED) {
                        $class = 'label-warning';
                    } elseif ($model->shipment_status === Order::SHIPMENT_STATUS_PREPARING) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . ($model->shipment_status ? Order::getShipmentStatusLabels($model->shipment_status) : '-') . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'shipment_status',
                    Order::getShipmentStatusLabels(),
                    ['class' => 'form-control']
                )
            ],
            // 'shipment_id',
            // 'shipment_name',
            // 'shipment_fee',
            'amount',
            // 'tax',
            // 'invoice',
            [
                'attribute' => 'status',
                'format' => 'html',
                'value' => function ($model) {
                    if ($model->status === Order::SHIPMENT_STATUS_RECEIVED) {
                        $class = 'label-success';
                    } elseif ($model->status === Order::PAYMENT_STATUS_UNPAID) {
                        $class = 'label-warning';
                    } elseif ($model->status === Order::STATUS_CANCEL || $model->status === Order::STATUS_DELETED) {
                        $class = 'label-danger';
                    } else {
                        $class = 'label-info';
                    }

                    return '<span class="label ' . $class . '">' . Order::getStatusLabels($model->status) . '</span>';
                },
                'filter' => Html::activeDropDownList(
                    $searchModel,
                    'status',
                    Order::getStatusLabels(),
                    ['class' => 'form-control']
                )
            ],
            // 'paid_at',
            // 'shipped_at',
            'created_at:date',
            // 'updated_at',
            // 'created_by',
            // 'updated_by',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{update} {delete}'],
        ],
    ]); ?>

</div>
