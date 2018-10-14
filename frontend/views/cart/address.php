<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/checkout.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>
<?php $form = ActiveForm::begin(['id' => '']); ?>
<div class="form-bd" id="first-addr-form">
    <ul class="form addr-form" id="addr-form">
        <li>
            <label class="nobg">
                Маркировка адреса:</label>
            <span class="flag-default"><?= Html::activeTextInput($model, 'name', ['class' => 'txt']) ?></span>
        </li>
        <li>
            <label>Получающее имя:</label>
            <?= Html::activeTextInput($model, 'consignee', ['class' => 'txt']) ?>
        </li>
        <li class="addr-li cle">
            <label>область:</label>
            <?php
            echo Html::activeDropDownList($model, 'country', ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => 0])->all(), 'id', 'name'), [
                'prompt'=> Yii::t('app','Please Select'),
                'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-province" ).html( data );
                            });',
            ]);
            echo '&nbsp;&nbsp;&nbsp;&nbsp;';
            echo Html::activeDropDownList($model, 'province',
                $model->province ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->country])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                [
                    'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-city" ).html( data );
                            });'
                ]);
            echo '&nbsp;&nbsp;&nbsp;&nbsp;';
            echo Html::activeDropDownList($model, 'city',
                $model->city ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->province])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')],
                [
                    'onchange'=> '
                            $.post( "'.Yii::$app->urlManager->createUrl('region/ajax-list-child?id=').'"+$(this).val(), function( data ) {
                              $( "select#address-district" ).html( data );
                            });'
                ]);
            echo '&nbsp;&nbsp;&nbsp;&nbsp;';
            echo Html::activeDropDownList($model, 'district', $model->district ? ArrayHelper::map(\common\models\Region::find()->where(['parent_id' => $model->city])->all(), 'id', 'name') : ['' => Yii::t('app', 'Please Select')]);
            ?>
        <li>
            <label>街道地址:</label>
            <?= Html::activeTextInput($model, 'address', ['class' => 'txt']) ?>
        </li>
        <li>
            <label>邮编:</label>
            <?= Html::activeTextInput($model, 'zipcode', ['class' => 'txt']) ?>
        </li>
        <li>
            <label>联系电话:</label>
            <?= Html::activeTextInput($model, 'mobile', ['class' => 'txt']) ?>
            <span class="info">推荐手机，座机需加区号和“-”符号</span></li>
        <li class="last"><?= Html::submitButton( Yii::t('app', '提交'), ['class' => 'btn',]) ?><a href="javascript:;" hidefocus="true" class="btn">取 消</a></li>
    </ul>
</div>
<?php ActiveForm::end(); ?>
