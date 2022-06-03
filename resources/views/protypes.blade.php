@extends('layouts.page')
@section('content')
<div class="title-content">
    <h1 class="h-title">Product Type</h1>
</div>

<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    <li class="nav-item add-companies">
        <label for="">Add Protype</label>
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
            <form action="{{route('addProtype')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Protype</h5>
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
                            <input type="file" name="image" class="form-control" id="" required placeholder=" " >
                            <label for="" class="form-lable">Type Image</label>
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
            <th>Type Image</th>
            <th>Created at</th>
            <th>Update at</th>
            <th class="scope" colspan="2">Action</th>
        </tr>
    </thead>
    <tbody>
            @foreach($protypes as $protype)
            <tr>
            <td>
                <p>{{$protype->protype_id}}</p>
            </td>           
             <td>
                    <p>{{$protype->protype_name}}</p>
            </td>                
                <td>          
                    <img src="{{ url('public/image/'.$protype->protype_phone) }}"
 style="height: 170px; width: 150px;">
            </td>        
                <td><p>{{$protype->created_at}}</p></td>
                <td><p>{{$protype->updated_at}}</p></td>
                <td>
                    <form action="" method="get">
                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#formEditTrainer{{$protype->protype_id}}">
                            <i class="far fa-edit"></i>
                        </button>
                    </form>
                </td>
                <td>
                    <form action="{{asset('')}}protypes/{{$protype->protype_id}}" method="post" onsubmit="return confirm('Bạn có muốn xóa không!')">
                        {{csrf_field()}}
                        {{method_field('delete')}}
                        <button type="submit" class="btn btn-outline-danger" name="delete" >
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </form>
                </td>
            </tr>
             <!-- Edit -->
             <div class="modal fade form-edit" id="formEditTrainer{{$protype->protype_id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="{{ route ('editProtype.update',$protype->protype_id)}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Protype</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">

                                    <h5>Type Name</h5>
                                    <input type="text" class="form-control" name="edit-name" value="{{$protype->protype_name}}" required>
                                   
                         
                                    <h5>Type Image</h5>
                                    <input type="file" name="image" class="form-control" value="{{$protype->protype_phone}}" required >
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
<?php echo $protypes->render() ?>
@endsection
@section('title',' Protype')


