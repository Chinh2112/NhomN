<?php

namespace Database\Seeders;


use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use IntlIterator;

class trainersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('trainers')->insert([
            'trainer_name' => Str::random(10),
            'is_leader' => 1,
            'company_id' => 1,
            'user_id' => 1,
            'trainer_email' => Str::random(50),
            'trainer_phone' => Str::random(10),
        ]);
        $isleader = 0;
        for($i =1; $i <= 1000000; $i++){
            DB::table('trainers')->insert([
                'trainer_name' => Str::random(10),
                'is_leader' => (Int)$isleader,
                'company_id' => $i,
                'user_id' => $i,
                'trainer_email' => Str::random(50),
                'trainer_phone' => Str::random(10),
            ]);
        }
    }
}
