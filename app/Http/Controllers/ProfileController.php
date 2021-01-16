<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use App\Models\profile;
use Auth;

class ProfileController extends Controller
{
    public function profile(){
    	return view('profiles.profile');
    }

    public function addprofile(Request $request){
    	$this->validate($request,[
          'name' => 'required',
           'designation' => 'required',
            'profile_pic' => 'required'
    	]);
    	$profiles = new Profile;
    	$profiles->user_id = Auth::user()->id;
    	$profiles->name = $request->input('name');
    	
    	$profiles->designation = $request->input('designation');
         
         if(Input::hasFile('profile_pic')){
          $file = Input::file('profile_pic');
          $file->move(public_path().'/uploads',$file->getClientOriginalName())	;
          $url = URL::to("/").'/uploads/'.$file->getClientOriginalName();

         
         }
        $profiles->profile_pic = $url;
        $profiles->save();
        return redirect ('/home')->with('response','Profile Added Successfully !!');
    }

    public function edit_profile($id){
      $edit_profile= Profile::where('id','=',$id)->first();
      

      return view('profiles.editprofile',['edit_profile'=>$edit_profile]);

    }

    public function updateprofile(Request $request,$id){
      $this->validate($request,[
      'name'=>'required',
      'designation'=>'required',
      'profile_pic' => 'required'
      ]);

      $update = profile::find($id);
      $update->name = $request->input('name');
      $update->designation = $request->input('designation');
      if(Input::hasFile('profile_pic')){
          $file = Input::file('profile_pic');
          $file->move(public_path().'/uploads',$file->getClientOriginalName())  ;
          $url = URL::to("/").'/uploads/'.$file->getClientOriginalName();         
         }
        $update->profile_pic = $url;
        $update->save();
        return redirect ('/home')->with('res_update','Profile Uploaded Successfully !!');

    }

}
