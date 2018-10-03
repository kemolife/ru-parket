<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;

/**
 * This is the model class for table "attribute".
 */
class UploadImage extends Model
{
    /**
     * @var UploadedFile
     */
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg'],
        ];
    }

    public function upload()
    {
        $productName = '';
        if ($this->validate()) {
            $productName = Yii::$app->params['productUpload'] . date('Ymdhis') . rand(1000, 9999) . '.' . $this->imageFile->extension;
            $this->imageFile->saveAs(Yii::getAlias('@frontend/web') . DIRECTORY_SEPARATOR . $productName);
        }

        return $productName;
    }

}
