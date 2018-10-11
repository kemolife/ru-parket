<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "settings".
 *
 */
class Settings extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'settings';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'status', 'description', 'phone', 'email',
                'policy', 'address', 'facebook', 'google', 'linkedin', 'twitter', 'youtube', 'work_hours',
                'created_at', 'seo_title', 'seo_keywords',
                'seo_description', 'seo_categories_title', 'seo_categories_keywords', 'seo_categories_description','contact_info', 'lat_log', 'cost_departure', 'cost_delivery'], 'safe'],
            [['logo'], 'file']
        ];
    }

}
