<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
class CustomAuthController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }
    public function customLogin(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
         if(Auth::attempt(['user_email' => $credentials['email'], 'password' => $credentials['password']])){
                $query = User::select('user_name')->where(['user_email' => $credentials['email']])->get();
                if(count($query) > 0){
                    $request->session()->flush();
                    $request->session()->put('username', $query[0]->user_name);
                    return redirect()->intended('companies')
                    ->withSuccess('Signed in');
                }
            }
        return redirect("login")->with(['message' => 'Login details are not valid']);
    }
    public function registration()
    {
        return view('auth.registration');
    }
    public function customRegistration(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,user_email',
            'password' => 'required|min:6',
        ]);

        $data = $request->all();
        $check = $this->create($data);
       return redirect("dashboard")->withSuccess('You have signed-in');
    }
    public function create(array $data)
    {
      return User::create([
        'user_name' => $data['name'],
        'user_email' => $data['email'],
        'password' => Hash::make($data['password']),
      ]);
    }

    public function dashboard()
    {
        if(Auth::check()){
            return view('auth.dashboard');
        }
        return redirect("login")->withSuccess('You are not allowed to access');
    }
    public function signOut() {
        Session::flush();
        Auth::logout();

        return Redirect('login');
    }
}
