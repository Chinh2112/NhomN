@extends('layouts.page')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md">
            <form action="" method="get">
                <input class="" type="text" name="name" id="">
                <input type="submit" class="btn btn-primary" value="Submit">
            </form>
        </div>
        <div class="col-md">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product_name</th>
                        <th>Product_price</th>
                        <th>Product_image</th>
                        <th>Product_Category</th>
                        <th>Product_Description</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($companies as $company):
                    <tr>
                        <td>
                            <p>{{$company->product_name}}</p>
                        </td>
                        <td>
                            <p>{{$company->product_price}}</p>
                        </td>
                        <td>
                            <p>{{$company->product_image}}</p>
                        </td>
                        <td>
                            <p>{{$company->trainer_id}}</p>
                        </td>
                        <td>
                            <p>{{$company->product_description}}</p>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <?php echo $companies->render() ?>
        </div>
    </div>
</div>
@endsection


