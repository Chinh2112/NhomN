<?php

namespace App\Http\Controllers;

use App\Models\Protypes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class ProtypeController extends Controller
{
    //
    public function getProtype(Request $request){
        $per_page = $request->input('per_page');
        $obj = new Protypes();
        $protypes = $obj->orderBy('protype_id', 'DESC')->paginate($per_page);
        return view('protypes',['protypes' => $protypes]);
   
    }
}