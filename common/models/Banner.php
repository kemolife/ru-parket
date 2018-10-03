<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "settings".
 *
 *  @property string $image
 */
class Banner extends \yii\db\ActiveRecord
{
//    public $name;
//    public $status;
//    public $description_big;
//    public $description_small;
//    public $image;
//    public $created_at;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'banner';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'status', 'description_big', 'description_small', 'created_at'], 'safe'],
            [['image'], 'file', 'extensions' => 'jpg, png, svg', 'mimeTypes' => 'image/jpeg, image/png, image/svg+xml']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => 'Name',
        ];
    }

}
