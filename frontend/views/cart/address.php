<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
$this->registerCssFile('@web/css/checkout.css', ['depends' => \frontend\assets\AppAsset::className()]);
?>

<div id="main">
    <!-- 已登录状态 开始 -->
    <div class="user-tip cle">
        <div class="fl">Hi，<?= Yii::$app->user->identity->username ?>，请确认订单信息</div>
        <div class="fr"> <a href="<?= Yii::$app->urlManager->createUrl(['/cart']) ?>" class="graybtn">返回购物车修改</a> </div>
    </div>
    <!-- 但没有地址 -->
    <div class="first-addr">
        <h2>确认收货人信息</h2>
        <div class="gray">请填写你的第一个地址！商城会对您填写的内容进行加密，以保障您个人信息的安全</div>
        <?php $form = ActiveForm::begin(['id' => '']); ?>
        <div class="form-bd" id="first-addr-form">
            <ul class="form addr-form" id="addr-form">
                <li>
                    <label class="nobg">地址标注:</label>
                    <span class="flag-default"><?= Html::activeTextInput($model, 'name', ['class' => 'txt']) ?></span>
                </li>
                <li>
                    <label>收货姓名:</label>
                    <?= Html::activeTextInput($model, 'consignee', ['class' => 'txt']) ?>
                </li>
                <li class="addr-li cle">
                    <label>所在地区:</label>
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
    </div>
</div>
<!-- main -->
<main class="main" role="main">

    <section class="section checkout cart">
        <div class="container">
            <?= $this->render('part/checkout-step', [
                'stepOne' => 'completed',
                'stepTwo' => 'active',
                'stepTree' => '',
                'stepFour' => '',
            ]) ?>
            <div class="row checkout__body">
                <div class="col-lg-6 checkout__forms">
                    <div class="checkout__client">
                        <div class="row align-items-sm-center">
                            <div class="col-sm-4">
                                <div class="h2">Получатель</div>
                            </div>
                            <div class="col-sm-8">
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="tab-client-new" data-toggle="tab" href="#navClientNew" role="tab" aria-controls="navClientNew" aria-selected="true">Новый покупатель</a>
                                    <a class="nav-item nav-link" id="tab-client-old" data-toggle="tab" href="#navClientOld" role="tab" aria-controls="navClientOld" aria-selected="false">Постоянный клиент</a>
                                </div>
                            </div>
                        </div><!-- .row | client forms top -->
                        <div class="tab-content" id="checkoutClientTabs">
                            <div class="tab-pane fade show active" id="navClientNew" role="tabpanel" aria-labelledby="tab-client-new">
                                <fieldset>
                                    <div class="form-group">
                                        <label for="checkoutClientNewName">Ваше имя *</label>
                                        <input type="text" class="form-control" id="checkoutClientNewName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewEmail">Электронный адрес</label>
                                        <input type="email" class="form-control" id="checkoutClientNewEmail" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewTel">Телефон</label>
                                        <input type="tel" class="form-control" id="checkoutClientNewTel" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewPass">Пароль</label>
                                        <input type="password" class="form-control" id="checkoutClientNewPass" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientNewPass2">Подтвердите пароль</label>
                                        <input type="password" class="form-control is-invalid" id="checkoutClientNewPass2" required>
                                        <small class="text-danger">Пример поля с ошибкой</small>
                                    </div>
                                </fieldset><!-- new client form -->
                            </div><!-- #navClientsNew -->
                            <div class="tab-pane fade" id="navClientOld" role="tabpanel" aria-labelledby="tab-client-old">
                                <fieldset>
                                    <div class="form-group">
                                        <label for="checkoutClientOldEmail">Электронный адрес</label>
                                        <input type="email" class="form-control" id="checkoutClientOldEmail" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="checkoutClientOldPass">Пароль</label>
                                        <input type="password" class="form-control" id="checkoutClientOldPass" required>
                                    </div>
                                </fieldset><!-- old client form -->
                                <div class="d-block">
                                    <button class="btn btn btn-link" data-toggle="modal" data-target="#testModal">
                                        <span>Напомнить пароль</span>
                                        <i class="material-icons">navigate_next</i>
                                    </button>
                                </div>
                                <div class="social-block d-flex justify-content-between align-items-center">
                                    <span>Или авторизируйтесь с помощью:</span>
                                    <div class="nav" role="list">
                                        <a href="social-link.html" title="social 1" role="listitem"><img src="/assets/img/svg/facebook.svg" alt="social 1"></a>
                                        <a href="social-link.html" title="social 2" role="listitem"><img src="/assets/img/svg/google-plus.svg" alt="social 2"></a>
                                        <a href="social-link.html" title="social 3" role="listitem"><img src="/assets/img/svg/odnoklassniki-logo.svg" alt="social 3"></a>
                                        <a href="social-link.html" title="social 4" role="listitem"><img src="/assets/img/svg/vk.svg" alt="social 4"></a>
                                    </div>
                                </div>
                            </div><!-- #navClientsOld -->
                        </div><!-- .tab-content -->
                    </div><!-- .checkout__client -->
                    <div class="checkout__delivery">
                        <div class="h2">Способ доставки</div>
                        <fieldset>
                            <div class="form-group">
                                <select class="custom-select" id="deliveryRegion" required>
                                    <option selected>Ваш регион</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="custom-select" id="deliveryCity" required>
                                    <option selected>Населенный пункт</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="checkoutDeliveryAddress">Адрес *</label>
                                <input type="text" class="form-control is-invalid" id="checkoutDeliveryAddress" required>
                                <small class="text-danger">Пример поля с ошибкой</small>
                            </div>
                            <div class="form-group">
                                <select class="custom-select" id="deliveryMethod" required>
                                    <option selected>Способ доставки</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </fieldset>
                    </div><!-- .checkout__delivery -->
                    <div class="cart-buttons row justify-content-md-end order-md-2">
                        <div class="col-md-6 order-md-0 text-right">
                            <a href="checkout-2.html" class="btn btn-info btn-icon" role="button" title="Продолжить">
                                <span>Продолжить</span>
                                <i class="material-icons">arrow_forward</i>
                            </a>
                        </div>
                    </div><!-- .cart-buttons -->
                </div>
                <div class="col-lg-6 d-flex flex-column">
                    <div class="checkout__secondary order-md-1">
                        <div class="h2">Стоимость доставки:</div>
                        <div class="text-warning">
                            <p>Внимание, самовыаоз возможен только по предварительной договоренности с менеджером!</p>
                            <br>
                        </div>
                        <?= $setting->cost_delivery ?>
                    </div><!-- .checkout__secondary -->
                    <?= $this->render('part/your-order', ['product' => $products]) ?>
                </div>
            </div><!-- .checkout__body -->
        </div>
    </section><!-- .cart -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-checkout');
</script>
