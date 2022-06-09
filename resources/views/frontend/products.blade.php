@extends('layouts.page')
@section('content')
<div class="title-content">
    <h1 class="h-title">Products</h1>
</div>
<!--Main!-->
{{-- @dd($product); --}}
<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    <li class="nav-item add-companies">
        <label for="">Add Products</label>
        <button type="button" class="btn btn-outline-secondary add" data-toggle="modal" data-target="#formAddCompany">
            <i class="fas fa-plus"></i>
        </button>
    </li>
</ul>
<!--Add!-->

<table class="table">
    <thead>
        <tr>
            <th class="scope">ID</th>
            <th class="scope">Product Name</th>
            <th class="scope">Product Price</th>
            <th class="scope">Product Image</th>
            <th class="scope">Protype ID</th>
            <th class="scope">Product Description</th>
            <th class="scope" colspan="2">Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($products as $product)
        <tr>
            <td>
                <p>{{ $product->product_id }}</p>
            </td>
            <td>
                <p>{{ $product->product_name }}</p>
            </td>
            <td>
                <p>{{ $product->product_price }}</p>
            </td>
            <td>
                <img src="{{ url('public/image/'.$product->product_image) }}" style="height: 170px; width: 150px;">
            </td>
            <td>
                <p>{{ $product->trainer_id }}</p>
            </td>
            <td>
                <p>{{ $product->product_description }}</p>
            </td>
            <td>
                <form action="" method="get">
                    <button type="button" class="btn btn-outline-info" data-toggle="modal"
                        data-target="#formEditCompany{{$product->product_id}}">
                        <i class="far fa-edit"></i>
                    </button>
                </form>
            </td>
            <td>
                <form action="{{asset('')}}products/{{$product->product_id}}" method="post"
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
        <div class="modal fade form-edit" id="formEditCompany{{$product->product_id}}" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="{{ route ('editProducts.update',$product->product_id)}}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Products</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <h5>Product Name</h5>
                                <input type="text" class="form-control" name="edit-name"
                                    value="{{$product->product_name}}" required>
                                <h5>Product Price</h5>
                                <input type="text" name="edit-web" class="form-control"
                                    value="{{$product->product_price}}" id="" required>
                                <h5>Product Image </h5>
                                <input type="file" name="image" class="form-control" value="{{$product->product_image}}"
                                    id="" required>
                                <h5>Protype Id</h5>
                                <input type="text" name="edit-code" class="form-control"
                                    value="{{$product->trainer_id}}" id="" required>
                                <h5>Product Description</h5>
                                <input type="tel" name="edit-phone" class="form-control"
                                    value="{{$product->product_description}}" id="" required>
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
<?php echo $products->render(); ?>
@endsection
@section('title','Products1')