<?php
namespace common\widgets;

use common\models\BlogPost;
use common\models\StatusBlog;
use frontend\models\PasswordResetRequestForm;
use yii\base\Widget;
use yii\helpers\Html;

class PassSendModal extends Widget
{
    public $model;

    public function init()
    {
        $this->model = new PasswordResetRequestForm();
    }

    public function run()
    {
        return $this->render('passsend-modal', [
            'model' => $this->model
        ]);
    }
}
