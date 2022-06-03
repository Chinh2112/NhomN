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

    public function destroyProtype($id)
    {
        $obj = new Protypes();
        $obj->where('protype_id', $id)->delete();
        $alertDel = 'Delete Protype Type Success !!! ';
        return redirect('protypes')->with('alertDel', $alertDel);
    }
    public function destroyCategory($id)
    {
        $obj = new Categories();
        $obj->where('category_id', $id)->delete();
        $alertDel = 'Delete Category Type Success !!! ';
        return redirect('category')->with('alertDel', $alertDel);
    }
}
