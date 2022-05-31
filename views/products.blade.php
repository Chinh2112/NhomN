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

@if(session('alertAdd'))
    <section class='alert alert-success '>{{session('alertAdd')}}</section>
@endif  
@if(session('alertDel'))
    <section class='alert alert-warning '>{{session('alertDel')}}</section>
@endif 
@if(session('alertEdit'))
    <section class='alert alert-warning '>{{session('alertEdit')}}</section>
@endif 

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
@section('title','Products')