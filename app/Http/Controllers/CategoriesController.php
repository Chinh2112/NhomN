<?php

namespace App\Http\Controllers;

use App\Models\Categories;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    //
    public function getCategory(Request $request){
        $per_page = $request->input('per_page');
        $obj = new Categories();
        $category = $obj->paginate($per_page);
        return view('category',['categories' => $category]);
        // $companies =  DB::table('companies')->simplePaginate(5);
        // return view('companies',['companies' =>  $companies]);
    }
}
