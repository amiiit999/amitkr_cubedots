<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use App\Models\category;
use App\Models\post;
use Auth;

class PostController extends Controller
{
    public function post(){
    	$category = category::all();
    	return view('posts.post',['category'=>$category]);
    }

     public function addPost(Request $request){
        $this->validate($request,[
          'post_title'=>'required',
           'text_body'=>'required',
            'category_id'=>'required',
             'post_image'=>'required'

        ]);

        $Posts = new Post;
        $Posts->user_id = Auth::user()->id;
        $Posts->post_title = $request->input('post_title');
        
        $Posts->description = $request->input('text_body');
         $Posts->category_id = $request->input('category_id');

         if(Input::hasFile('post_image')){
          $file = Input::file('post_image');
          $file->move(public_path().'/posted_images',$file->getClientOriginalName())	;
          $url = URL::to("/").'/posted_images/'.$file->getClientOriginalName();

         
         }
        $Posts->post_image = $url;
        $Posts->save();
        return redirect ('/home')->with('info_post','Post Uploaded Successfully');
    }


     public function view($post_id){
    	$posts= Post::where('id','=',$post_id)->get();
     
    	 $categories = Category::all();
    	 
    	return view('posts.view',['posts'=>$posts,'categories'=>$categories]);

    }

    public function edit($post_id){
              $categories = Category::all();
              $posts = Post::find($post_id);
              $category = Category::find($posts->category_id);
              return view('posts.edit',['categories'=>$categories,'posts'=>$posts,'category'=>$category]);
    }

    public function updatepost(Request $request, $post_id){
               $this->validate($request,[
          'post_title'=>'required',
           'text_body'=>'required',
            'category_id'=>'required',
             'post_image'=>'required'

        ]);

        $posts = Post::find($post_id);
        $posts->post_title = $request->input('post_title');
        $posts->user_id = Auth::user()->id;
        $posts->description = $request->input('text_body');
         $posts->category_id = $request->input('category_id');

         if(Input::hasFile('post_image')){
          $file = Input::file('post_image');
          $file->move(public_path().'/posted_images',$file->getClientOriginalName())  ;
          $url = URL::to("/").'/posted_images/'.$file->getClientOriginalName();

         
         }
        $posts->post_image = $url;
        $data = array(
          'post_title'=>$posts->post_title,
           'user_id'=>$posts->user_id,
            'description'=>$posts->description,
             'category_id'=>$posts->category_id,
              'post_image'=>$posts->post_image
        );
         Post::where('id',$post_id)
         ->update($data);
        $posts->update();
        return redirect ('/home')->with('update','Post Updated Successfully !!'); 
    }

    public function deletePost($post_id){
        Post::where('id',$post_id)
        ->delete();
         return redirect ('/home')->with('delete','Post Deleted Successfully !!'); 
    }

    public function category($cat_id){
      $categories = Category::all();

      $posts = DB::table('posts')
            ->join('categories', 'posts.category_id', '=', 'categories.id')
            ->select('posts.*', 'categories.*')
            ->where(['categories.id'=>$cat_id])
            ->get();
              
            return view('posts.categoryposts',['categories'=>$categories,'posts'=>$posts]) ; 
            
    }
}
