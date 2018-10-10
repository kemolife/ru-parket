<?php
namespace common\widgets;

use common\models\MessageClient;
use common\models\Settings;
use yii\base\Widget;
use yii\helpers\Html;

class ConsultantModal extends Widget
{
    public $model;
    public $settings;

    public function init()
    {
        $this->model = new MessageClient();
        $this->settings = Settings::find()->one();
    }

    public function run()
    {
        return $this->render('consultant-modal', [
            'settings' => $this->settings,
            'model' => $this->model,
        ]);
    }
}
