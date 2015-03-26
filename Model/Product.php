<?php
class Model_Product
{
    public $id;
    public $name;
    public $description;
    public $img;
    public $price;
    public $total;
   
    public static function getItems($params)
    {
        $dbTableProduct = new Model_Db_Table_Product();
        $productsData   = $dbTableProduct->getByCriteria($params);
        
        $productModels = array();
        
        foreach ($productsData as $item) {
            $productModel               = new self();
            $productModel->id           = $item->id;
            $productModel->name         = $item->name;
            $productModel->description  = $item->description;
            $productModel->img          = $item->img;
            $productModel->price        = $item->price;
            $productModel->total        = $item->total;
            $productModels[] = $productModel;
        }
        
        return $productModels;
    }
    
    public static function getCountItems()
    {
        $dbTableProduct = new Model_Db_Table_Product();
        $countItems     = $dbTableProduct->getCount();
        return $countItems; 
    }        

}
