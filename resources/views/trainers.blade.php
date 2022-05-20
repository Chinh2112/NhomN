@extends('layouts.page')

@section('content')
<div class="title-content">
    <h1 class="h-title">Product Type</h1>
</div>

<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    <li class="nav-item add-companies">
        <label for="">Add Product Type</label>
        <button type="button" class="btn btn-outline-secondary add" data-toggle="modal" data-target="#formAddTrainer">
            <i class="fas fa-plus"></i>
        </button>
    </li>
</ul>
<!-- Add -->
@if(session('alertAdd'))
    <section class='alert alert-success '>{{session('alertAdd')}}</section>
@endif 
@if(session('alertDel'))
    <section class='alert alert-warning '>{{session('alertDel')}}</section>
@endif 
@if(session('alertEdit'))
    <section class='alert alert-warning '>{{session('alertEdit')}}</section>
@endif 
<div class="modal fade form-add" id="formAddTrainer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="{{route('addTrainer')}}" method="post">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Product Type</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-div">
                            <input type="text" class="form-control" name="name" id="" required placeholder=" " autocomplete="word">
                            <label for="" class="form-lable">Type Name</label>
                        </div>
                  
                        <div class="form-div">
                            <input type="text" name="user_id" class="form-control" id="" required placeholder=" ">
                            <label for="" class="form-lable">User ID</label>
                        </div>
               
                        <div class="form-div">
                            <input type="text" name="email" class="form-control" id="" required placeholder=" " autocomplete="email">
                            <label for="" class="form-lable">Trainer Email</label>
                        </div>
                        <div class="form-div">
                            <input type="tel" name="phone" class="form-control" id="" required placeholder=" " minlength="10" maxlength="10" pattern="^[0-9]+$" autocomplete="tel">
                            <label for="" class="form-lable">Trainer Phone</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" value="Add" class="btn btn-success" name="submitAdd">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- End Add -->

<table class="table">
    <thead>
        <tr>
        <th>ID</th>
            <th>Type Name</th>
     
            <th>Trainer Email</th>
            <th>Trainer Phone</th>
            <th>Created at</th>
            <th>Update at</th>
            <th class="scope" colspan="2">Action</th>
        </tr>
    </thead>
    <tbody>
            @foreach($trainers as $trainer)
            <tr>
            <td><p>{{$trainer->trainer_id}}</p></td>           
                <td><p>{{$trainer->trainer_name}}</p></td>           
                <td><p>{{$trainer->trainer_email}}</p></td>
                <td><p>{{$trainer->trainer_phone}}</p></td>
                <td><p>{{$trainer->created_at}}</p></td>
                <td><p>{{$trainer->updated_at}}</p></td>
                <td>
                    <form action="" method="get">
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#formEditTrainer{{$trainer->trainer_id}}">
                            <i class="far fa-edit"></i>
                        </button>
                    </form>
                </td>
                <td>
                    <form action="{{asset('')}}trainers/{{$trainer->trainer_id}}" method="post" onsubmit="return confirm('Bạn có muốn xóa không!')">
                        {{csrf_field()}}
                        {{method_field('delete')}}
                        <button type="submit" class="btn btn-outline-danger" name="delete" >
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </form>
                </td>
            </tr>
             <!-- Edit -->
             <div class="modal fade form-edit" id="formEditTrainer{{$trainer->trainer_id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="{{ route ('editTrainer.update',$trainer->trainer_id)}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Product Type</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">

                                    <h5>Trainer Name</h5>
                                    <input type="text" class="form-control" name="edit-name" value="{{$trainer->trainer_name}}" required>
                                   
                                    <h5>Trainer Email</h5>
                                    <input type="text" name="edit-email" class="form-control" value="{{$trainer->trainer_email}}" id="" required>
                                    <h5>Trainer Phone</h5>
                                    <input type="tel" name="edit-phone" class="form-control" value="{{$trainer->trainer_phone}}" id="" required minlength="10" maxlength="10" pattern="^[0-9]+$">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" value="Save" class="btn btn-success" name="submitEdit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            @endforeach
    </tbody>
</table>
<?php echo $trainers->render() ?>
@endsection
@section('title',' Trainer')


