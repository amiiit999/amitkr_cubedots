@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header"><strong>{{ __('Add Post') }}</strong></div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                       
                             <form class="form-horizontal" method="POST" action="{{ url('/addpost') }}" enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('post_title') ? ' has-error' : '' }}">
                            <label for="post_title" class="col-md-4 control-label">Post Title</label>

                            <div class="col-md-8">
                                <input id="post_title" type="post_title" class="form-control" name="post_title" value="{{ old('post_title') }}" required autofocus>

                                @if ($errors->has('post_title'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('post_title') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('text_body') ? ' has-error' : '' }}">
                            <label for="text_body" class="col-md-4 control-label">Description</label>

                            <div class="col-md-8">
                                <textarea id="text_body" rows="5" class="form-control" name="text_body" value="{{ old('text_body') }}" required></textarea>

                                @if ($errors->has('text_body'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('text_body') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('category_id') ? ' has-error' : '' }}">
                            <label for="category_id" class="col-md-4 control-label">Category</label>

                            <div class="col-md-8">
                               <select id="category_id" type="category_id" class="form-control" name="category_id" required>
                                    <option value="">select</option>
                                    @if(count($category) > 0)
                                       @foreach($category ->all() as $cat)
                                         <option value="{{$cat->id}}">{{$cat->category}}</option>
                                       @endforeach
                                    @endif
                                </select>

                                
                            </div>
                        </div>
                        
                        <div class="form-group{{ $errors->has('post_image') ? ' has-error' : '' }}">
                            <label for="post_image" class="col-md-8 control-label">Enter Post Image</label>

                            <div class="col-md-8">
                                <input id="post_image" type="file" class="form-control" name="post_image" required>

                                @if ($errors->has('post_image'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('post_image') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary btn-large btn-block">
                                    Publish Post
                                </button>
                            </div>
                        
                    </form>

                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
