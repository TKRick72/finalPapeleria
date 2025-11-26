<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        
        // --- CONFIGURACIÓN CORS NUEVA ---
        $middleware->validateCsrfTokens(except: [
            'api/*', // Excluir rutas API de la protección CSRF si es necesario
        ]);

        $middleware->append(\Illuminate\Http\Middleware\HandleCors::class); // Asegurar que CORS corra

        // Configuración explícita de los headers
        // Esto le dice a Laravel: "Confía en estas reglas de CORS"
        // Nota: En Laravel 11 a veces es mejor dejar que el framework lo maneje
        // pero si falla, podemos forzarlo aquí o usar el archivo de config publicado.
        
        $middleware->alias([
            'admin' => \App\Http\Middleware\AdminRoleMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();