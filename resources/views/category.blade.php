@extends('layouts.page')

@section('content')
<table class="table">
    <thead>
        <tr>
            <th>Category_name</th>
        </tr>
    </thead>
    <tbody>
            @foreach($categories as $array):
            <tr>
                <td><p>{{$array->category_id}}</p></td>
                <td><p>{{$array->category_name}}</p></td>
            </tr>
            @endforeach
    </tbody>
</table>
<?php echo $categories->render() ?>
@endsection
