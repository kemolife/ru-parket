<?php

namespace backend\widgets\dropzone;

use yii\web\AssetBundle;

class DropZoneAsset extends AssetBundle
{
    public $css = [
        'css/dropzone.min.css',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\jui\JuiAsset',
    ];
    public $js = [
        'js/dropzone.min.js',
    ];
}
