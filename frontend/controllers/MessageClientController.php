<?php
/**
 * Created by PhpStorm.
 * User: home
 * Date: 09.09.18
 * Time: 22:10
 */

namespace frontend\controllers;


use common\models\MessageClient;
use frontend\components\Controller;
use Yii;

class MessageClientController extends Controller
{
    public function actionBuyNow()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new MessageClient();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post()) && $model->save(false)) {
            return $this->goHome();
        }
    }

    public function actionCallback()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new MessageClient();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post()) && $model->save(false)) {
            return $this->goHome();
        }
    }

    public function actionConsultant()
    {
        //if(!Yii::$app->user->can('createYourAuth')) throw new ForbiddenHttpException(Yii::t('app', 'No Auth'));

        $model = new MessageClient();
        $model->loadDefaultValues();

        if ($model->load(Yii::$app->request->post()) && $model->save(false)) {
            return $this->goHome();
        }
    }
}