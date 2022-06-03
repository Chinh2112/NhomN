<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
class GroupsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        for($i =1; $i < 1000000; $i++){
            DB::table('groups')->insert([
                'group_name' =>Str::random(10),
                'created_at' => now()
            ]);
        }
    }
}
