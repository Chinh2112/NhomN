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


    protected function editProducts( Request $request,$id)
    {
        $obj = new Products();
        $data = $request->all();
        $products = $obj->find($id);
        $products->product_name = $data['edit-name'];
        $products->trainer_id = $data['edit-code'];
        $products->product_description = $data['edit-phone'];

        $fileName = time().'.'.$request->image->extension();  
        $request->image->move(public_path('public/image'), $fileName);

        $products->product_image = $fileName;
        $products->product_price = $data['edit-web'];
        $products->updated_at = now();
        $products->save();
        $alertEdit = 'Edit Product Success !!! ';
        return redirect('/products')->with('alertEdit',$alertEdit);
    }






 
}
