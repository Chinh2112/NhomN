<?php

namespace App\Http\Controllers;

use App\Models\Companies;
use App\Models\Trainers;
use Illuminate\Http\Request;


class DeleteController extends Controller
{
    public function destroy($id)
    {
        $obj = new Companies();
        $obj->where('product_id', $id)->delete();
        $alertDel = 'Delete Company Success !!! ';
        return redirect('companies')->with('alertDel', $alertDel);
    }

    public function destroyTrainer($id)
    {
        $obj = new Trainers();
        $obj->where('trainer_id', $id)->delete();
        $alertDel = 'Delete Product Type Success !!! ';
        return redirect('trainers')->with('alertDel', $alertDel);
    }
}
