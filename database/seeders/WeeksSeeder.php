<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
class WeeksSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $endDate = Carbon::now();
        for($i =1; $i < 1000000; $i++){
            DB::table('weeks')->insert([
                'week_weekdays' => Str::random(10),
                'status_check' => random_int(0,1),
                'end_at' => $endDate->addDay()->addMonth(),
                'diary_id' => $i,
                'created_at' => now()
            ]);
        }
    }
}
