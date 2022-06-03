<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    //
    public function search(Request $request){
        $per_page = $request->get('per_page');
        $obj = new Products();
        $name = $request->get('name');
        $products = $obj->where('product_name','like',"%$name%")->paginate($per_page);
        $products->appends(['name' => $name]);
        return view('search',['products' => $products]);
    }
}