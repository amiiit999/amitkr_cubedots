<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\profile;
use App\Models\User;
use App\Models\post;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user_id = Auth::user()->id;
        $profile = DB::table('users')
                 ->join('profiles','users.id', '=','profiles.user_id')
                 ->select('users.*', 'profiles.*')
                
                 ->where(['profiles.user_id' =>$user_id])
                    
                 ->first();
                 

                $posts = Post::orderBy('id', 'desc')->Paginate(6); 
                 return view('home',['profile'=>$profile,'posts'=>$posts]);
                 
    
    }
}
