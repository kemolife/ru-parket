<?php

namespace common\models;

use blog\Module;
use Yii;

class StatusBlog
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_DELETED = -1;

    public $id;
    public $label;

    public function __construct($id = null)
    {
        if ($id !== null) {
            $this->id = $id;
            $this->label = $this->getLabel($id);
        }
    }

    public static function labels()
    {
        return [
            self::STATUS_ACTIVE => Yii::t('blog', 'STATUS_ACTIVE'),
            self::STATUS_INACTIVE => Yii::t('blog', 'STATUS_INACTIVE'),
            self::STATUS_DELETED => Yii::t('blog', 'STATUS_DELETED'),
        ];
    }

    public function getLabel($id)
    {
        $labels = self::labels();
        return isset($labels[$id]) ? $labels[$id] : null;
    }

}
