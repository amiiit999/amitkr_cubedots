@extends('layouts.app')
<style type="text/css">
    .avatar{
        border-radius: 100%;
        max-width: 100px;
    }

    .pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
</style>
@section('content')
<div class="container">

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>
                  @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if(session('response'))
                       <div class="alert alert-success">
                           {{session('response')}}
                       </div>
                    @endif
                    
                     @if(session('info_post'))
                       <div class="alert alert-success">
                           {{session('info_post')}}
                       </div>

                    @endif

                    @if(session('update'))
                       <div class="alert alert-success">
                           {{session('update')}}
                       </div>
                       
                    @endif
                    @if(session('delete'))
                       <div class="alert alert-success">
                           {{session('delete')}}
                       </div>
                       
                    @endif

                    @if(session('res_update'))
                       <div class="alert alert-success">
                           {{session('res_update')}}
                       </div>
                       
                    @endif


                <div class="card-body">
                   

                   <div class="col-md-6">
                        @if(!empty($profile))
                       <img src="{{$profile->profile_pic}}" class="avatar" alt="">
                       <button class="btn btn-info"><a href='{{url("/edit_profile/$profile->id")}}' class="text-white">Edit</a></button>
                       @else
                        <img src="{{url('uploads/avatar.png')}}" class="avatar" alt="">
                        @endif
                        <br>
                        @if(!empty($profile))
                        <p class="lead">Full Name : {{$profile->name}}</p>
                        @else
                        <br>
                        <p class="lead"><strong>Welcome Guest !</strong></p>
                        @endif
                         
                         @if(!empty($profile))
                        <p class="lead">Designation : {{$profile->designation}}</p>
                        @else
                        <p></p>
                        @endif
                    
                  </div>
                  <br>
                  <strong><hr></strong>
                   <div class="col-md-8" style="float:left">
                    @if(count($posts) > 0)
                            @foreach($posts->all() as $post)
                            <br>
                              <h4><strong>Title : {{$post->post_title}}</strong></h4>
                              <img src="{{$post->post_image}}" height="300px" width="600px"><br><br>
                              <p>{{substr($post->description,0,150)}}</p>
                              <ul class="nav nav-pills">
                                  <li role="presentation">
                                      <a href='{{url("/view/{$post->id}")}}'> 
                                       <span class="fa fa-eye"> VIEW</span>
                                      </a>&nbsp;&nbsp;&nbsp;
                                  </li>
                                      @if(Auth::id()==1 || Auth::id()==2)
                                  <li role="presentation">
                                      <a href='{{url("/edit/{$post->id}")}}'> 
                                       <span class="fa fa-edit"> EDIT</span>
                                      </a>
                                  </li>&nbsp;&nbsp;&nbsp;
                                     @endif
                                     @if(Auth::id()==1)
                                  <li role="presentation">
                                      <a href='{{url("/delete/{$post->id}")}}'> 
                                       <span class="fa fa-trash"> DELETE</span>
                                      </a>
                                  </li>
                                  @endif
                              </ul>
                              <cite style="float:left;">Posted on: {{date('M j, Y H:i',strtotime($post->updated_at))}}</cite>

                              <hr/>
                            @endforeach
                        @else
                           <p>No Post Available!!</p> 
                        @endif
                        
                       
                        {{$posts->links()}}
                       
                       
                       
                   </div>

                </div>
            </div>
        </div>
    </div>
</div>

@endsection
