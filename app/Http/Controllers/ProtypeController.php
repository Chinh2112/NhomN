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

    protected function editProtype( Request $request,$id)
    {
        $obj = new Protypes();
        $data = $request->all();
        $protype = $obj->find($id);
        $protype->protype_name = $data['edit-name'];

        $fileName = time().'.'.$request->image->extension();  
        $request->image->move(public_path('public/image'), $fileName);  
        $protype->protype_phone = $fileName;

        $protype->updated_at = now();
        $protype->save();
        $alertEdit = 'Edit Protype Type Success !!! ';
        return redirect('/protypes')->with('alertEdit',$alertEdit);
    }

    protected function addProtype(Request $request)
    {
        if ($request->isMethod('POST')) {
            $name = $request->name; 
            $fileName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('public/image'), $fileName);  
            
            Protypes::create([
                'protype_name' => $name,          
                'protype_phone' => $fileName,        
                'timestamp' => now()
            ]);

            $alertAdd = 'Add Protype Type Success !!! ';
            return redirect('protypes')->with('alertAdd', $alertAdd);
        } else {
            return redirect('/protypes');
        }
    }
}
