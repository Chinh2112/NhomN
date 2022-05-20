<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTrainersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trainers', function (Blueprint $table) {
            $table->increments('trainer_id');
            $table->string('trainer_name',55);
         
            
            $table->integer('user_id');/////////
            $table->string('trainer_email',55);
            $table->string('trainer_phone',55);
            $table->timestamps();
            // $table->foreign('company_id')->references('company_id')->on('companies');
            // $table->foreign('user_id')->references('user_id')->on('users');////////
            //xong roi thi noi nha
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trainers');
    }
}
