<?php
namespace common\widgets;

use yii\base\Widget;

class Search extends Widget
{
    public function init()
    {
        parent::init();
    }

    public function run()
    {
        return $this->render('search');
    }
}