<?php

return [
    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    'allowed_methods' => ['*'],

    // EL CAMBIO ESTÁ AQUÍ: El asterisco significa "Cualquiera puede entrar"
    'allowed_origins' => ['*'],

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => false, // IMPORTANTE: Pon esto en false si usas '*'
];