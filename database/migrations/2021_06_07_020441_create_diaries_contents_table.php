<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiariesContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('diaries_contents', function (Blueprint $table) {
            $table->increments('diarycontent_id');
            $table->string('diarycontent_weekday',100);
            $table->string('diarycontent_work',200);
            $table->string('diarycontent_content',255);
            $table->string('diarycontent_note',100);
            $table->string('diarycontent_teacher_comment');
            $table->string('diarycontent_trainer_comment');
            $table->integer('week_id');
            $table->timestamps();
            // $table->foreign('week_id')->references('week_id')->on('weeks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('diaries_contents');
    }
}
