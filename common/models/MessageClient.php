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
    const STATUS_NOT_DRIVE = 2;
    const STATUS_DRIVE = 3;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'client_messages';
    }

    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios['callback'] = ['name','tel'];//Scenario Values Only Accepted
        $scenarios['pass'] = ['email'];//Scenario Values Only Accepted
        return $scenarios;
    }

    /**c
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'tel', 'address'], 'required'],
            [['name', 'tel', 'address'], 'required', 'on' => 'consultant'],
            [['type', 'status', 'create_date'], 'integer'],
            [['tel', 'area'], 'string', 'max' => 100],
            [['address','name'], 'string', 'max' => 255],
        ];
    }

    public static function getDiveLabel()
    {
        return [
            self::STATUS_NOT_DRIVE => 'Консультация без выезда на объект',
            self::STATUS_DRIVE => 'Консультация з выездом на объект'
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
            if(!$this->status) {
                $this->status = 1;
            }
            $this->create_date = time();

            return true;
        }
        else {
            return false;
        }
    }
}
