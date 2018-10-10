<?php
namespace common\widgets;

use frontend\models\PasswordResetRequestForm;
use yii\base\Widget;
use yii\helpers\Html;

class PassRemindModal extends Widget
{
    public $model;

    public function init()
    {
        $this->model = new PasswordResetRequestForm();
    }

    public function run()
    {
        return $this->render('passremind-modal', [
            'model' => $this->model
        ]);
    }
}
