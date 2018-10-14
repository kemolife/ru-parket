<?php
return [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'user.passwordResetTokenExpire' => 3600,
    'blogTitle' => 'Blog',
    'blogTitleSeo' => 'Simple Blog based on Yii2',
    'blogFooter' => 'Copyright &copy; ' . date('Y') . ' by ahuasheng on Yii2. All Rights Reserved.',
    'blogPostPageCount' => '2',
    'defaultPageSizeProduct' => '5',
    'defaultPageSizeOrder' => '2',
    'blogLinks' => [
        'Google' => 'http://www.google.com',
        'Funson86 Blog' => 'http://github.com/funson86/yii2-blog',
    ],
    'blogUploadPath' => 'upload/blog/', //default to frontend/web/upload
    'categoryUploadPath' => 'upload/category/', //default to frontend/web/upload
    'bannerUploadPath' => 'upload/banners/', //default to frontend/web/upload
    'settingsUploadPath' => 'upload/settings/', //default to frontend/web/upload
    'productUpload' => 'upload/product/', //default to frontend/web/upload
    'attrGroupUploadPath' => 'upload/attr-group/', //default to frontend/web/upload
];
