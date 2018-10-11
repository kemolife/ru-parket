<?php

use common\models\BlogCatalog;
use common\models\Status;
use common\models\StatusBlog;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel funson86\blog\models\BlogCatalogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Блог категории';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-catalog-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('Создать ' . 'категорию блога', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th><?=Yii::t('blog', 'Title') ?> </th>
            <th><?=Yii::t('blog', 'Sort Order') ?></th>
            <th><?=Yii::t('blog', 'Template') ?></th>
            <th><?=Yii::t('blog', 'Is Nav') ?></th>
            <th><?=Yii::t('blog', 'Status') ?></th>
            <th><?=Yii::t('blog', 'Actions') ?></th>

        </tr>
        </thead>
        <tbody>
        <?php foreach($dataProvider as $item){ ?>
        <tr data-key="1">
            <td><?= $item['id']; ?></td>
            <td><?= $item['str_label']; ?></td>
            <td><?= $item['sort_order']; ?></td>
            <td><?= $item['template']; ?></td>
            <td><?= BlogCatalog::getOneIsNavLabel($item['is_nav']); ?></td>
            <td><?= Status::labels()[$item['status']]; ?></td>
            <td>
                <a href="<?= \Yii::$app->getUrlManager()->createUrl(['blog-catalog/update','id'=>$item['id']]); ?>"" title="<?= Yii::t('blog', 'Update');?>" data-pjax="0"><span class="glyphicon glyphicon-pencil"></span></a>
                <a href="<?= \Yii::$app->getUrlManager()->createUrl(['blog-catalog/delete','id'=>$item['id']]); ?>"" title="<?= Yii::t('blog', 'Delete');?>" data-confirm="<?= Yii::t('blog', 'Are you sure you want to delete this item?');?>" data-method="post" data-pjax="0"><span class="glyphicon glyphicon-trash"></span></a>
            </td>
        </tr>
        <?php } ?>
        </tbody>
    </table>

</div>
