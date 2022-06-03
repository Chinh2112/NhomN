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

    }
    protected function addCategory(Request $request)
    {
        if ($request->isMethod('POST')) {
            $name = $request->name; 
          
            
            Categories::create([
                'category_name' => $name,          
                'timestamp' => now()            
            ]);
            $alertAdd = 'Add Category Success !!! ';
            return redirect('category')->with('alertAdd', $alertAdd);
        } else {
            return redirect('/category');
        }
    }
    protected function editCategory( Request $request,$id)
    {
        $obj = new Categories();
        $data = $request->all();
        $category = $obj->find($id);
        $category->category_name = $data['edit-name'];
        $category->updated_at = now();
        $category->save();
        $alertEdit = 'Edit Category Success !!! ';
        return redirect('/category')->with('alertEdit',$alertEdit);
    }
}
