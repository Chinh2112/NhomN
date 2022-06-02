<?php

namespace App\Http\Controllers;

use App\Models\Products;
use App\Models\Protypes;
use Illuminate\Http\Request;
use App\Models\Categories;


class DeleteController extends Controller
{
    public function destroy($id)
    {
        $obj = new Products();
        $obj->where('product_id', $id)->delete();
        $alertDel = 'Delete Company Success !!! ';
        return redirect('products')->with('alertDel', $alertDel);
    }

   
}