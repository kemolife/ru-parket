<?php
namespace common\widgets;

use common\models\MessageClient;
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
