<?php
namespace common\widgets;

use common\models\BlogPost;
use common\models\StatusBlog;
use yii\base\Widget;
use yii\helpers\Html;

class SearchModal extends Widget
{
    public function init()
    {

    }

    public function run()
    {
        return $this->render('search-modal', [

        ]);
    }
}
