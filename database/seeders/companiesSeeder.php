<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use IntlIterator;

class companiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        for($i =1; $i <= 80000; $i++){//con 9 lan
            DB::table('companies')->insert([
                'company_name' => Str::random(10),
                'company_web' => Str::random(10),
                'company_address' => Str::random(50),
                'company_code' => Str::random(10),
                'company_phone' => Str::random(10),
            ]);
        }

    }
}
