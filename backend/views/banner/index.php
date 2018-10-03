<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\BannerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title =  'Banner';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="banner-index">

    <p>
        <?= Html::a( 'Create ' .  'Banner', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th><?=  'Name' ?> </th>
            <th><?=  'Status' ?></th>
            <th><?=  'Created at' ?></th>
            <th><?=  'Actions' ?></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach($dataProvider as $item){ ?>
            <tr data-key="1">
                <td><?= $item->id ?></td>
                <td><?= $item->name; ?></td>
                <td><?= \common\models\Status::labels()[$item->status]; ?></td>
                <td><?= $item->created_at; ?></td>
                <td>
                    <!--a href="<?= \Yii::$app->getUrlManager()->createUrl(['banner/create']); ?>" title="<?= Yii::t('cms', 'Create');?>" data-pjax="0"><span class="glyphicon glyphicon-plus-sign"></span></a-->
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['banner/view','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'View');?>" data-pjax="0"><span class="glyphicon glyphicon-eye-open"></span></a>
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['banner/update','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'Update');?>" data-pjax="0"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['banner/delete','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'Delete');?>" data-confirm="<?= Yii::t('cms', 'Are you sure you want to delete this item?');?>" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

</div>
