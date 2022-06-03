<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Str;
class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        // $table->increments('user_id');
        // $table->string('user_name',100);
        // $table->integer('type_id');
        // $table->integer('group_id');
        for($i =1; $i <= 1000000; $i++){
            DB::table('users')->insert([
                'user_name' => Str::random(10),
                'type_id' => $i,
                'group_id' => $i,
            ]);
        }
    }
}
