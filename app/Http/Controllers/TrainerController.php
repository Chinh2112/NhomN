<?php

namespace App\Http\Controllers;

use App\Models\Trainers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class TrainerController extends Controller
{
    //
    public function getTrainer(Request $request){
        $per_page = $request->input('per_page');
        $obj = new Trainers();
        $trainers = $obj->paginate($per_page);
        return view('trainers',['trainers' => $trainers]);
      //  echo "aaa";
        // $companies =  DB::table('companies')->simplePaginate(5);
        // return view('companies',['companies' =>  $companies]);
    }

    protected function editTrainer( Request $request,$id)
    {
        $obj = new Trainers();
        $data = $request->all();
        $trainer = $obj->find($id);
        $trainer->trainer_name = $data['edit-name'];

        $trainer->trainer_email = $data['edit-email'];
        $trainer->trainer_phone = $data['edit-phone'];
        $trainer->updated_at = now();
        $trainer->save();
        $alertEdit = 'Edit Product Type Success !!! ';
        return redirect('/trainers')->with('alertEdit',$alertEdit);
    }

    protected function addTrainer(Request $request)
    {
        if ($request->isMethod('POST')) {
            $name = $request->name;
            $email = $request->email;
            $user_id = $request->user_id;
            $phone = $request->phone;
            Trainers::create([
                'trainer_name' => $name,
                'trainer_email' => $email,
                'trainer_phone' => $phone,
                'user_id' => $user_id,
                'timestamp' => now()
            ]);

            $alertAdd = 'Add Product Type Success !!! ';
            return redirect('trainers')->with('alertAdd', $alertAdd);
        } else {
            return redirect('/trainers');
        }
    }
}
