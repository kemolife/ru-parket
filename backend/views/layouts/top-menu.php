<?php

use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;

NavBar::begin([
    'brandLabel' => 'РФ-Паркет',
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar-inverse navbar-fixed-top',
    ],
]);
$menuItemsMain = [
    [
        'label' => 'Заказы',
        'url' => ['#'],
        'active' => false,
        'items' => [
            [
                'label' => 'Заказы',
                'url' => ['/order'],
            ],
            [
                'label' => 'Корзина',
                'url' => ['/cart'],
            ],
        ],
        //'visible' => Yii::$app->user->can('readPost'),
    ],
    [
        'label' => 'Продукты',
        'url' => ['#'],
        'active' => false,
        'items' => [
            [
                'label' => 'Категории',
                'url' => ['/category'],
            ],
            [
                'label' => 'Продукты',
                'url' => ['/product'],
            ],
            [
                'label' => 'Аттрибуты',
                'url' => ['/attribute'],
            ],
            [
                'label' => 'Групы Аттрибутов',
                'url' => ['/attribute-group'],
            ],
            [
                'label' => 'Опции',
                'url' => ['/options'],
            ],
            [
                'label' => 'Комментарии',
                'url' => ['/comment'],
            ],
            [
                'label' => 'Бренды',
                'url' => ['/brand'],
            ],
            [
                'label' => 'Импорт продуктив',
                'url' => ['/product/import'],
            ],
            [
                'label' => 'Экспорт продуктив',
                'url' => ['/product/export'],
            ],
        ],
        //'visible' => Yii::$app->user->can('readPost'),
    ],
    [
        'label' => 'Блог',
        'url' => ['#'],
        'active' => false,
        //'visible' => Yii::$app->user->can('haha'),
        'items' => [
            [
                'label' => 'Блог посты',
                'url' => ['/blog-post'],
            ],
            [
                'label' => 'Блог комментарии',
                'url' => ['/blog-comment'],
            ],
            [
                'label' => 'Блог категории',
                'url' => ['/blog-catalog'],
            ],
            [
                'label' => 'Блог теги',
                'url' => ['/blog-tag'],
            ],
        ],
    ],
    [
        'label' => 'Пользователи',
        'url' => ['#'],
        'active' => false,
        //'visible' => Yii::$app->user->can('haha'),
        'items' => [
            [
                'label' => 'Пользователи',
                'url' => ['/user'],
            ],
            [
                'label' => 'Адреса',
                'url' => ['/address'],
            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Favorite'),
//                'url' => ['/favorite'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Point Log'),
//                'url' => ['/point-log'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Coupon Type'),
//                'url' => ['/coupon-type'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Coupon'),
//                'url' => ['/coupon'],
//            ],
        ],
    ],
//    [
//        'label' => '<i class="fa fa-cog"></i> ' . Yii::t('app', 'System'),
//        'url' => ['#'],
//        'active' => false,
//        //'visible' => Yii::$app->user->can('haha'),
//        'items' => [
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Payment'),
//                'url' => ['/payment'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Shipment'),
//                'url' => ['/shipment'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Auth Role'),
//                'url' => ['/auth'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Setting'),
//                'url' => ['/setting'],
//            ],
//            [
//                'label' => '<i class="fa fa-lock"></i> ' . Yii::t('app', 'Region'),
//                'url' => ['/region'],
//            ],
//        ],
//    ],
    [
        'label' => 'Настройки',
        'url' => ['#'],
        'active' => false,
        //'visible' => Yii::$app->user->can('haha'),
        'items' => [
            [
                'label' => 'Настройки',
                'url' => ['/settings']
            ],
            [
                'label' => 'Клиенсткие сообщения',
                'url' => ['/message-client']
            ],
            [
                'label' => 'Баннер',
                'url' => ['/banner']
            ],
        ]
    ]
];
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left'],
    'items' => $menuItemsMain,
    'encodeLabels' => false,
]);
if (Yii::$app->user->isGuest) {
    $menuItems[] = ['label' => 'Войти', 'url' => ['/site/login']];
} else {
    $menuItems[] = [
        'label' => 'Выйти' . '(' . Yii::$app->user->identity->username . ')',
        'url' => ['/site/logout'],
        'linkOptions' => ['data-method' => 'post']
    ];
}
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-right'],
    'items' => $menuItems,
]);
NavBar::end();
