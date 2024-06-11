<?php

namespace  Tung1\COop\Controllers\Client;

use  Tung1\COop\Commons\Controller;
use Tung1\COop\Commons\Helper;
use Tung1\COop\Models\Product;

class HomeController extends Controller
{
    private Product $product;

    public function __construct()
    {
        $this->product = new Product();
    }
    public function index()
    {
        $name = 'Peach';
        
        $products = $this->product->all();
        // Helper::debug($products);
        $this->renderViewClient('home', [
            'name' => $name,
            'products' => $products
        ]);
    }
}