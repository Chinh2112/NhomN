@extends('layouts.page')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4 my-5">
            <div class="card">
                <h3 class="card-header text-center">Edit Product</h3>
                <div class="card-body">
                    <form action="{{route('companies.update','$id')}}" method="POST">
                        @csrf
                        {{method_field('put')}}
                        <label for="">Company Name</label>
                        <div class="form-group mb-3">
                            <input type="text" placeholder="Enter Name" id="name" class="form-control" name="name"
                                required autofocus>
                        </div>

                        <div class="form-group mb-3">
                            <input type="text" placeholder="Email" id="email_address" class="form-control" name="email"
                                required autofocus>
                            @if ($errors->has('email'))
                            <span class="text-danger">{{ $errors->first('email') }}</span>
                            @endif
                        </div>

                        <div class="form-group mb-3">
                            <input type="password" placeholder="Password" id="password" class="form-control"
                                name="password" required>
                            @if ($errors->has('password'))
                            <span class="text-danger">{{ $errors->first('password') }}</span>
                            @endif
                        </div>

                        <div class="form-group mb-3">
                            <div class="checkbox">
                                <label><input type="checkbox" name="remember"> Remember Me</label>
                            </div>
                        </div>

                        <div class="d-grid mx-auto">
                            <button type="submit" class="btn btn-dark btn-block">Sign up</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>

</div>

@endsection