<?php
/* @var $this yii\web\View */

use common\models\Order;
use yii\widgets\LinkPager;

$this->title = 'Мои заказы';
$this->params['breadcrumbs'][] = ['label' => 'Личный кабинет', 'url' => ['/user/profile']];
$this->params['breadcrumbs'][] = $this->title;

$unpaidOrder = null;
foreach ($orders as $order) {
    if ($order->status == \common\models\Order::PAYMENT_STATUS_UNPAID) {
        $unpaidOrder = $order;
    }
    break;
}

$statusClass = ($unpaidOrder->payment_status === Order::PAYMENT_STATUS_UNPAID || $unpaidOrder->shipment_status === Order::SHIPMENT_STATUS_UNSHIPPED)?'text-danger':'text-info'

?>

<!-- main -->
<main class="main" role="main">

    <section class="account">
        <div class="container">
            <nav aria-label="hidden__down--md breadcrumb">
                <?= \yii\widgets\Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                    'options' => ['class' => 'breadcrumb'],
                    'tag' => 'div',
                    'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
                    'activeItemTemplate' => '<li class="breadcrumb-item active" aria-current="page">{link}</li>',
                ]) ?>
            </nav>
            <header class="page-title text-center">
                <div class="h1 border-bottom"><?= $this->title ?></div>
            </header>
            <div class="row">
                <?= $this->render('/user/block/left_sidebar_menu', ['first' => '', 'second' => 'active']) ?>
                <div class="col-lg-10">
                    <?php if ($unpaidOrder) { ?>
                        <div class="h2">Заказ: &#8470; <?= $unpaidOrder->id ?></div>
                        <div class="row">
                            <div class="col-lg-7">
                                <table class="table table-bordered border-primary">
                                    <tbody>
                                    <tr>
                                        <th scope="row">Дата:</th>
                                        <td><?= date('d.m.Y', $unpaidOrder->created_at) ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Адрес доставки:</th>
                                        <td><?= $unpaidOrder->address ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Тип доставки:</th>
                                        <td><?= \common\models\Order::$shipmentMethods[$unpaidOrder->shipment_id] ?></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Статус оплаты:</th>
                                        <td>
                                            <strong class="<?= $statusClass ?>"><?= \common\models\Order::getPaymentStatusLabels($unpaidOrder->payment_status) ?></strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Статус отгрузки:</th>
                                        <td>
                                            <strong class="<?= $statusClass ?>"><?= \common\models\Order::getShipmentStatusLabels($unpaidOrder->shipment_status) ?></strong>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-lg-5">
                                <div class="account__order border border-primary order-md-0">
                                    <div class="cart-list">
                                        <?php foreach ($unpaidOrder->orderProducts as $product) {
                                            echo $this->render('../cart/part/cart-product', ['product' => $product]);
                                        } ?>
                                    </div><!-- .cart-list -->
                                </div><!-- .checkout__order -->
                            </div>
                        </div><!-- .row -->
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="buttons">
                                    <a href="<?= Yii::$app->urlManager->createUrl(['cart/pay', 'id' => $unpaidOrder->sn]) ?>"
                                       class="btn btn-info btn-icon" role="button"
                                       title="Оплатить заказ">
                                        <span>Оплатить заказ</span>
                                        <i class="material-icons">arrow_forward</i>
                                    </a>
                                    <a  href="javascript:;" data-link="<?= Yii::$app->urlManager->createUrl(['order/ajax-status', 'id' => $unpaidOrder->id, 'status' => \common\models\Order::STATUS_CANCEL]) ?>"
                                       class="btn btn-danger btn-icon order-cancel" role="button"
                                       title="Отменить заказ">
                                        <span>Отменить заказ</span>
                                        <i class="material-icons">close</i>
                                    </a>
                                </div>
                                <div class="account__orders">
                                    <div class="account__orders--title h2 pt-2 pb-2 my-4 text-center">
                                        <span>История заказов</span>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Номер заказа:</th>
                                            <th>Дата заказа:</th>
                                            <th>Состояние заказа:</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($orders as $item) { ?>
                                            <tr>
                                                <td><?= $item->id ?></td>
                                                <td><?= date('d.m.Y', $item->created_at) ?></td>
                                                <td>
                                                    <strong class="<?= $statusClass ?>"><?= \common\models\Order::getStatusLabels($item->status) ?></strong>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                    <nav aria-label="blog page navigation">
                                        <?= LinkPager::widget([
                                            'pagination' => $pagination,
                                            'lastPageLabel' => '<i class="material-icons" aria-hidden>chevron_right</i>',
                                            'firstPageLabel' => '<i class="material-icons" aria-hidden>chevron_left</i>',
                                            'nextPageLabel' => false,
                                            'prevPageLabel' => false,
                                            'hideOnSinglePage' => true,
                                            'linkOptions' => [
                                                'class' => 'page-link',
                                            ],
                                            'pageCssClass' => [
                                                'class' => 'page-item'
                                            ]
                                        ]) ?>
                                    </nav>
                                </div><!-- .account__order -->
                            </div>
                        </div><!-- .row -->
                    <?php } ?>
                </div>
            </div><!-- .row -->
        </div>
    </section>

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-account');
</script>

<?php
$js = <<<JS
$(document).ready(function() {
$(".order-cancel").click(function(){
    var link = $(this).data('link');
    $.get(link, function(data, status) {
        if (status == "success") {
            location.reload()
        }
    });
});
});
JS;


$this->registerJs($js);
?>

