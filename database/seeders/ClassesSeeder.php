<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
class ClassesSeeder extends Seeder
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
            DB::table('classes')->insert([
                'class_name' =>Str::random(10),
                'course_id' => $i,
                'created_at' => now()
            ]);
        }
    }
}
