<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title =  'Settings';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="banner-index">
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
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['settings/view','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'View');?>" data-pjax="0"><span class="glyphicon glyphicon-eye-open"></span></a>
                    <a href="<?= \Yii::$app->getUrlManager()->createUrl(['settings/update','id'=>$item['id']]); ?>"" title="<?= Yii::t('cms', 'Update');?>" data-pjax="0"><span class="glyphicon glyphicon-pencil"></span></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

</div>
