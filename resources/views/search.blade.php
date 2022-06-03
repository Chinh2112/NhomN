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
                    @foreach($products as $product):
                    <tr>
                        <td>
                            <p>{{$product->product_name}}</p>
                        </td>
                        <td>
                            <p>{{$product->product_price}}</p>
                        </td>
                        <td>
                            <p>{{$product->product_image}}</p>
                        </td>
                        <td>
                            <p>{{$product->trainer_id}}</p>
                        </td>
                        <td>
                            <p>{{$product->product_description}}</p>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <?php echo $products->render() ?>
        </div>
    </div>
</div>
@endsection


