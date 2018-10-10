<?php
namespace common\widgets;

use yii\base\Widget;
use yii\helpers\Html;

class ConfirmOrderModal extends Widget
{
    public $order;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        return $this->render('confirm-order-modal', [
            'order' => $this->order
        ]);
    }
}
