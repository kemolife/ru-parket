<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\MessageClientSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Клиенсткие сообщения';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="massage-client-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'tel',
            'area',
            'address',
            //'type',
            //'status',
            //'create_date',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{update} {delete}'],
        ],
    ]); ?>
</div>
