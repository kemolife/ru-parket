<?php
namespace common\widgets;

use common\models\BlogPost;
use common\models\MessageClient;
use common\models\StatusBlog;
use yii\base\Widget;
use yii\helpers\Html;

class BuyNowModal extends Widget
{
    public $model;

    public function init()
    {
        $this->model = new MessageClient();
    }

    public function run()
    {
        return $this->render('buynow-modal', [
            'model' => $this->model
        ]);
    }
}
