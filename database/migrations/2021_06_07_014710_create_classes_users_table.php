<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassesUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('classes_users', function (Blueprint $table) {
            $table->integer('user_id');
            $table->integer('class_id');
            $table->integer('teacher_id');
            $table->timestamps();
            // $table->foreign('user_id')->references('user_id')->references('users');
            // $table->foreign('class_id')->references('class_id')->references('classes');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('classes_users');
    }
}
