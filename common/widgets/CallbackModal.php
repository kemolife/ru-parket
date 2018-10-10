<?php
namespace common\widgets;

use common\models\MessageClient;
use yii\base\Widget;
use yii\helpers\Html;

class CallbackModal extends Widget
{
    public $model;

    public function init()
    {
        $this->model = new MessageClient();
    }

    public function run()
    {
        return $this->render('callback-modal', [
            'model' => $this->model
        ]);
    }
}
