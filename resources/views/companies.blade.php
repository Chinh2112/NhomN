@extends('layouts.page')
@section('content')
<div class="title-content">
    <h1 class="h-title">Products</h1>
</div>
    <!--Main!-->
    {{-- @dd($company); --}}
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
    <div class="modal fade form-add" id="formAddCompany" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="{{route('addCompanies')}}" method="post">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="form-div">
                                <input type="text" class="form-control" name="name" id="" required placeholder=" ">
                                <label for="" class="form-lable">Product Name</label>
                            </div>
                         
                            <div class="form-div">
                                <input type="text" name="web" class="form-control" id="" required placeholder=" ">
                                <label for="" class="form-lable">Product Price</label>
                            </div>
                            <div class="form-div">
                                <input type="text" name="address" class="form-control" id="" required placeholder=" ">
                                <label for="" class="form-lable">Product Image</label>
                            </div>
                            <div class="form-div">
                                <input type="text" name="code" class="form-control" id="" required placeholder=" ">
                                <label for="" class="form-lable">Product Category</label>
                            </div>
                            <div class="form-div">
                                <input type="tel" name="phone" class="form-control" id="" required placeholder=" " >
                                <label for="" class="form-lable">Product Description</label>
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
            <th class="scope">ID</th>
                <th class="scope">Product Name</th>
                <th class="scope">Product Price</th>
                <th class="scope">Product Image</th>
                <th class="scope">Product Category</th>
                <th class="scope">Product Description</th>
                <th class="scope" colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($companies as $company)
                <tr>
                <td>
                        <p>{{ $company->product_id }}</p>
                    </td>
                    <td>
                        <p>{{ $company->product_name }}</p>
                    </td>
                    <td>
                        <p>{{ $company->product_price }}</p>
                    </td>
                    <td>
                        <p>{{ $company->product_image }}</p>
                    </td>
                    <td>
                        <p>{{ $company->trainer_id }}</p>
                    </td>
                    <td>
                        <p>{{ $company->product_description }}</p>
                    </td>
                    <td>
                        <form action="" method="get">
                            <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#formEditCompany{{$company->product_id}}">
                                <i class="far fa-edit"></i>
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="{{asset('')}}companies/{{$company->product_id}}" method="post" onsubmit="return confirm('Bạn có muốn xóa không!')">
                            {{csrf_field()}}
                            {{method_field('delete')}}
                            <button type="submit" class="btn btn-outline-danger" name="delete" >
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <!-- Edit -->
                <div class="modal fade form-edit" id="formEditCompany{{$company->product_id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="{{ route ('editCompanies.update',$company->product_id)}}" method="post" enctype="multipart/form-data">
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
                                        <input type="text" class="form-control" name="edit-name" value="{{$company->product_name}}" required>
                                        <h5>Product Price</h5>
                                        <input type="text" name="edit-web" class="form-control" value="{{$company->product_price}}" id="" required>
                                        <h5>Product Image </h5>
                                        <input type="text" name="edit-address" class="form-control" value="{{$company->product_image}}" id="" required>
                                        <h5>Product Category</h5>
                                        <input type="text" name="edit-code" class="form-control" value="{{$company->trainer_id}}" id="" required>
                                        <h5>Product Description</h5>
                                        <input type="tel" name="edit-phone" class="form-control" value="{{$company->product_description}}" id="" required >
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
    <?php echo $companies->render(); ?>
@endsection
@section('title','Companies')
