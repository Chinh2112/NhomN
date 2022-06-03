@extends('layouts.page')
@section('content')
<div class="title-content">
    <h1 class="h-title">Category</h1>
</div>

<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    <li class="nav-item add-companies">
        <label for="">Add Category</label>
        <button type="button" class="btn btn-outline-secondary add" data-toggle="modal" data-target="#formAddCategory">
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
<div class="modal fade form-add" id="formAddCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="{{route('addCategory')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-div">
                            <input type="text" class="form-control" name="name" id="" required placeholder=" "
                                autocomplete="word">
                            <label for="" class="form-lable">Category Name</label>
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




<table class="table">
    <thead>
        <tr>
            <th>Category_id</th>
            <th>Category_name</th>
            <th>Created_at</th>
            <th>Updated_at</th>

            <th class="scope" colspan="2">Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach($categories as $category)
        <tr>
            <td>
                <p>{{$category->category_id}}</p>
            </td>
            <td>
                <p>{{$category->category_name}}</p>
            </td>

            <td>
                <p>{{$category->created_at}}</p>
            </td>
            <td>
                <p>{{$category->updated_at}}</p>
            </td>
            <td>
                <form action="" method="get">
                    <button type="button" class="btn btn-outline-info" data-toggle="modal"
                        data-target="#formEditCategory{{$category->category_id}}">
                        <i class="far fa-edit"></i>
                    </button>
                </form>
            </td>
            <td>
                <form action="{{asset('')}}categories/{{$category->category_id}}" method="post"
                    onsubmit="return confirm('Bạn có muốn xóa không!')">
                    {{csrf_field()}}
                    {{method_field('delete')}}
                    <button type="submit" class="btn btn-outline-danger" name="delete">
                        <i class="far fa-trash-alt"></i>
                    </button>
                </form>
            </td>
        </tr>

        <!-- Edit -->
        <div class="modal fade form-edit" id="formEditCategory{{$category->category_id}}" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="{{ route ('editCategory.update',$category->category_id)}}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">

                                <h5>Category Name</h5>
                                <input type="text" class="form-control" name="edit-name"
                                    value="{{$category->category_name}}" required>
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
<?php echo $categories->render() ?>
@endsection
@section('title',' Category')