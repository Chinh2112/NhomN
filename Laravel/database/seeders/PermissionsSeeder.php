<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($i =1; $i < 1000000; $i++){
            DB::table('permissions')->insert([
                'permission_name' =>Str::random(10),
                'created_at' => now()
            ]);
        }
    }
}
