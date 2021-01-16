@extends('layouts.app')
<style type="text/css">
    .avatar{
        border-radius: 100%;
        max-width: 100px;
    }
</style>
@section('content')
<div class="container">

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('View Post') }}</div>
                  
                
            
                   
                  <div class="card-body">
                    <div class="col-md-4">
                       <ul class="list-group">
                      @if(count($categories) >0)
                          @foreach($categories->all() as $category)
                            <li class="list-group-item"><a href='{{url("category/$category->id")}}'>{{$category->category}}</a></li>
                          @endforeach

                        @else 
                          <p>No Category Found !!</p> 
                      @endif

                       </ul>
                    </div>
                   <div class="col-md-10" style="float:left">
                    @if(count($posts) > 0)
                            @foreach($posts->all() as $post)
                              <h4><strong>Post Title : {{$post->post_title}}</strong></h4>
                              <img src="{{$post->post_image}}" height="400px" width="600px">
                              <br><br>
                              <p>{{($post->description)}}</p>
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
                   </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
