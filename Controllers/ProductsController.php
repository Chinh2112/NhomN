<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Routing\Controller as BaseController;
use App\Models\Products;
//use Dotenv\Validator;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class ProductsController extends Controller
{

    public function getProducts(Request $request)
    {
        $per_page = $request->input('per_page');
        $obj = new Products();
        $products = $obj->paginate($per_page);
        $name = $request->get('search');
        $products = $obj->where('product_name', 'like', "%$name%")->orderBy('product_id', 'DESC')->paginate($per_page);
        $products->appends(['search' => $name]);
        return view('products', ['products' => $products]);
    }
    public function index(Request $res)
    {
        if (Session::has('username')) {
            return $this->getProducts($res);
        } else {
            return redirect('/login');
        }
    }

    protected function addProducts(Request $request)
    {
        if ($request->isMethod('POST')) {
            $name = $request->name;
            $price = $request->price;
           
            $fileName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('public/image'), $fileName);

            $category = $request->category;
            $description = $request->description;
            $products = Products::create([
                'product_name' => $name,
                'product_price' => $price,
                'product_image' => $fileName,
                'trainer_id' => $category,
                'product_description' => $description,
                'timestamp' => now()
            ]);

            $alertAdd = 'Add Product Success !!! ';
            return redirect('products')->with('alertAdd', $alertAdd);
        } else {
            return redirect('/products');
        }
    }







 
}
