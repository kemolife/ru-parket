<?php
namespace common\services;

use common\models\Product;
use common\models\ProductType;

class ProductsService
{
    private $products;

    public function __construct()
    {
        $this->products = Product::find()->where(['status' => Product::STATUS_ACTIVE])->all();
    }

    private function getProductForType($productType)
    {
        $products = [];
        foreach ($this->products as $product){
            $types = ProductType::intToArray($product->type);
            foreach ($types as $type){
                if($type === $productType){
                    array_push($products, $product);
                }
            }
        }

        return $products;
    }

    public function getHot()
    {
        return $this->getProductForType(ProductType::IS_HOT);
    }

    public function getGift()
    {
        return $this->getProductForType(ProductType::IS_GIFT);
    }

    public function getNew()
    {
        return $this->getProductForType(ProductType::IS_NEW);
    }

    public function getPromote()
    {
        return $this->getProductForType(ProductType::IS_PROMOTE);
    }

    public function getGroup()
    {
        return $this->getProductForType(ProductType::IS_GROUP);
    }
}