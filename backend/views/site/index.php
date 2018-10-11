<?php
/* @var $this yii\web\View */

$this->title = 'РФ-Паркет';
?>
<div class="site-index">
    <p>Статус заказа</p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>&nbsp;</th>
            <th>Cегодня</th>
            <th>Вчера</th>
            <th>Прошлая неделя</th>
            <th>На этой неделе</th>
            <th>Прошлый месяц</th>
            <th>Этот месяц</th>
        </tr>
        </thead>
        <tbody>
            <tr data-key="1">
                <td>Число</td>
                <td><?= $dataOrder['todayCount'] ?></td>
                <td><?= $dataOrder['yesterdayCount'] ?></td>
                <td><?= $dataOrder['lastWeekCount'] ?></td>
                <td><?= $dataOrder['thisWeekCount'] ?></td>
                <td><?= $dataOrder['lastMonthCount'] ?></td>
                <td><?= $dataOrder['thisMonthCount'] ?></td>
            </tr>
            <tr data-key="1">
                <td>Количество</td>
                <td><?= $dataOrder['todayAmount'] ?></td>
                <td><?= $dataOrder['yesterdayAmount'] ?></td>
                <td><?= $dataOrder['lastWeekAmount'] ?></td>
                <td><?= $dataOrder['thisWeekAmount'] ?></td>
                <td><?= $dataOrder['lastMonthAmount'] ?></td>
                <td><?= $dataOrder['thisMonthAmount'] ?></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="site-index">
    <p>Пользовательская статистика</p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>&nbsp;</th>
            <th>Cегодня</th>
            <th>Вчера</th>
            <th>Прошлая неделя</th>
            <th>На этой неделе</th>
            <th>Прошлый месяц</th>
            <th>Этот месяц</th>
        </tr>
        </thead>
        <tbody>
            <tr data-key="1">
                <td>Число</td>
                <td><?= $dataUser['todayCount'] ?></td>
                <td><?= $dataUser['yesterdayCount'] ?></td>
                <td><?= $dataUser['lastWeekCount'] ?></td>
                <td><?= $dataUser['thisWeekCount'] ?></td>
                <td><?= $dataUser['lastMonthCount'] ?></td>
                <td><?= $dataUser['thisMonthCount'] ?></td>
            </tr>
        </tbody>
    </table>
</div>
