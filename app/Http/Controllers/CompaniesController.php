<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Routing\Controller as BaseController;
use App\Models\Companies;
//use Dotenv\Validator;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CompaniesController extends Controller
{

    public function getCompanies(Request $request)
    {
        $per_page = $request->input('per_page');
        $obj = new Companies();
        $companies = $obj->paginate($per_page);
        $name = $request->get('search');
        $companies = $obj->where('product_name', 'like', "%$name%")->paginate($per_page);
        $companies->appends(['search' => $name]);
        return view('companies', ['companies' => $companies]);
    }
    public function index(Request $res)
    {
        if (Session::has('username')) {
            return $this->getCompanies($res);
        } else {
            return redirect('/login');
        }
    }

    protected function addCompanies(Request $request)
    {
        if ($request->isMethod('POST')) {
            $name = $request->name;
            $price = $request->price;
            $image = $request->image;
            $category = $request->category;
            $description = $request->description;
            $companies = Companies::create([
                'product_name' => $name,
                'product_price' => $price,
                'product_image' => $image,
                'trainer_id' => $category,
                'product_description' => $description,
                'timestamp' => now()
            ]);

            $alertAdd = 'Add Product Success !!! ';
            return redirect('companies')->with('alertAdd', $alertAdd);
        } else {
            return redirect('/companies');
        }
    }

    protected function editCompanies( Request $request,$id)
    {
        $obj = new Companies();
        $data = $request->all();
        $companies = $obj->find($id);
        $companies->product_name = $data['edit-name'];
        $companies->trainer_id = $data['edit-code'];
        $companies->product_description = $data['edit-phone'];
        $companies->product_image = $data['edit-address'];
        $companies->product_price = $data['edit-web'];
        $companies->updated_at = now();
        $companies->save();
        $alertEdit = 'Edit Product Success !!! ';
        return redirect('/companies')->with('alertEdit',$alertEdit);
    }






 
}
