<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "attribute".
 */
class Attribute extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'attribute';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_id', 'sort_order', 'name'], 'safe'],
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
            'group_id' => 'Group',
        ];
    }

    public function getGroup()
    {
        return $this->hasOne(AttributeGroup::className(), ['id' => 'group_id']);
    }

}
