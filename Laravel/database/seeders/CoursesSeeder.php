<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
class CoursesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


        for($i =1; $i < 1000000; $i++){
            DB::table('courses')->insert([
                'course_name' => Str::random(10),
                'course_semester' => random_int(1,2),
                'course_year' => random_int(2019,2022),
                'created_at' => now()
            ]);
        }
    }
}
