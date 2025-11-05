<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Adjust the 'proveedores' table
        Schema::table('proveedores', function (Blueprint $table) {
            // Rename 'contacto_email' to 'email' to match the model and frontend
            $table->renameColumn('contacto_email', 'email');
            // Add the 'ciudad' column
            $table->string('ciudad')->nullable()->after('telefono');
        });

        // 2. Add the missing 'fecha_entrega' column to the 'envios' table
        Schema::table('envios', function (Blueprint $table) {
            $table->date('fecha_entrega')->nullable()->after('fecha_entrega_estimada');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('proveedores', function (Blueprint $table) {
            $table->renameColumn('email', 'contacto_email');
            $table->dropColumn('ciudad');
        });

        Schema::table('envios', function (Blueprint $table) {
            $table->dropColumn('fecha_entrega');
        });
    }
};