<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "client_messages".
 *
 * @property int $id
 * @property int $name
 * @property string $tel
 * @property string $area
 * @property string $address
 * @property int $type
 * @property int $status
 * @property int $create_date
 */
class MessageClient extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'client_messages';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type', 'status', 'create_date'], 'integer'],
            [['tel', 'area'], 'string', 'max' => 100],
            [['address','name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Ваше имя:',
            'tel' => 'Ваш телефон:',
            'area' => 'Area',
            'address' => 'Address',
            'type' => 'Type',
            'status' => 'Status',
            'create_date' => 'Create Date',
        ];
    }

    public function beforeSave($insert)
    {
        if(parent::beforeSave($insert))
        {
            $this->status = 1;
            $this->create_date = time();

            return true;
        }
        else {
            return false;
        }
    }
}
