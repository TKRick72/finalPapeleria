-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2025 a las 23:29:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `papeleria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(3, 'Electronica'),
(2, 'Oficina'),
(1, 'Papeleria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`, `created_at`, `updated_at`) VALUES
(6, 10, 7, 1, 249.00, '2025-10-13 14:11:31', '2025-10-13 14:11:31'),
(7, 10, 4, 4, 120.00, '2025-10-13 14:11:31', '2025-10-13 14:11:31'),
(8, 10, 6, 1, 25.00, '2025-10-13 14:11:31', '2025-10-13 14:11:31'),
(9, 10, 8, 1, 320.50, '2025-10-13 14:11:31', '2025-10-13 14:11:31'),
(10, 11, 9, 1, 199.00, '2025-10-13 14:26:12', '2025-10-13 14:26:12'),
(11, 12, 1, 1, 45.00, '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(12, 12, 2, 1, 89.90, '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(13, 12, 7, 1, 249.00, '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(14, 13, 7, 3, 249.00, '2025-10-16 05:08:07', '2025-10-16 05:08:07'),
(15, 13, 2, 1, 89.90, '2025-10-16 05:08:07', '2025-10-16 05:08:07'),
(16, 13, 1, 1, 45.00, '2025-10-16 05:08:07', '2025-10-16 05:08:07'),
(17, 14, 1, 1, 45.00, '2025-10-20 11:00:00', '2025-10-20 11:00:00'),
(18, 15, 2, 1, 89.90, '2025-10-20 11:05:00', '2025-10-20 11:05:00'),
(19, 16, 4, 1, 120.00, '2025-10-20 11:10:00', '2025-10-20 11:10:00'),
(20, 17, 5, 1, 159.99, '2025-10-20 11:15:00', '2025-10-20 11:15:00'),
(21, 18, 6, 1, 25.00, '2025-10-20 11:20:00', '2025-10-20 11:20:00'),
(22, 19, 7, 1, 249.00, '2025-10-20 11:25:00', '2025-10-20 11:25:00'),
(23, 20, 8, 1, 320.50, '2025-10-20 11:30:00', '2025-10-20 11:30:00'),
(24, 21, 9, 1, 199.00, '2025-10-20 11:35:00', '2025-10-20 11:35:00'),
(25, 22, 3, 1, 12.50, '2025-10-20 11:40:00', '2025-10-20 11:40:00'),
(26, 23, 7, 3, 249.00, '2025-10-20 11:45:00', '2025-10-20 11:45:00'),
(27, 24, 2, 1, 89.90, '2025-10-21 12:00:00', '2025-10-21 12:00:00'),
(28, 24, 4, 1, 45.00, '2025-10-21 12:00:00', '2025-10-21 12:00:00'),
(29, 25, 6, 1, 25.00, '2025-10-21 12:05:00', '2025-10-21 12:05:00'),
(30, 26, 7, 2, 249.00, '2025-10-21 12:10:00', '2025-10-21 12:10:00'),
(31, 26, 8, 1, 320.50, '2025-10-21 12:10:00', '2025-10-21 12:10:00'),
(32, 27, 3, 1, 12.50, '2025-10-21 12:15:00', '2025-10-21 12:15:00'),
(33, 28, 2, 1, 89.90, '2025-10-21 12:20:00', '2025-10-21 12:20:00'),
(34, 29, 8, 1, 320.50, '2025-10-21 12:25:00', '2025-10-21 12:25:00'),
(35, 30, 9, 1, 199.00, '2025-10-21 12:30:00', '2025-10-21 12:30:00'),
(36, 31, 1, 1, 45.00, '2025-10-21 12:35:00', '2025-10-21 12:35:00'),
(37, 32, 5, 1, 159.99, '2025-10-21 12:40:00', '2025-10-21 12:40:00'),
(38, 33, 4, 1, 120.00, '2025-10-21 12:45:00', '2025-10-21 12:45:00'),
(39, 34, 2, 7, 89.90, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(40, 34, 9, 6, 199.00, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(41, 34, 3, 3, 12.50, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(42, 34, 6, 5, 25.00, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(43, 35, 9, 1, 199.00, '2025-10-24 15:21:24', '2025-10-24 15:21:24'),
(44, 35, 3, 8, 12.50, '2025-10-24 15:21:24', '2025-10-24 15:21:24'),
(45, 35, 7, 14, 249.00, '2025-10-24 15:21:24', '2025-10-24 15:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `direccion_envio` text NOT NULL,
  `codigo_seguimiento` varchar(100) DEFAULT NULL,
  `estado_envio` enum('preparacion','transito','reparto','entregado') NOT NULL DEFAULT 'preparacion',
  `fecha_envio` date DEFAULT NULL,
  `fecha_entrega_estimada` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id`, `pedido_id`, `direccion_envio`, `codigo_seguimiento`, `estado_envio`, `fecha_envio`, `fecha_entrega_estimada`, `fecha_entrega`, `created_at`, `updated_at`) VALUES
(1, 10, 'circonia #102, Col. pedregal, C.P. 93826', NULL, 'entregado', NULL, NULL, NULL, '2025-10-13 14:11:31', '2025-10-13 23:52:34'),
(2, 11, 'circonia #102, Col. pedregal, C.P. 93826', NULL, 'entregado', NULL, NULL, NULL, '2025-10-13 14:26:12', '2025-10-13 23:52:15'),
(3, 12, 'circonia #102, Col. pedregal, C.P. 93826', NULL, 'preparacion', NULL, NULL, NULL, '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(4, 13, 'circonia #102, Col. pedregal, C.P. 93826', NULL, 'entregado', NULL, NULL, NULL, '2025-10-16 05:08:07', '2025-10-16 05:13:36'),
(5, 14, 'Av. Reforma #456, Centro, C.P. 93827', 'TRK123456789', 'preparacion', '2025-10-20', '2025-10-22', NULL, '2025-10-20 11:00:00', '2025-10-20 11:00:00'),
(6, 15, 'Calle Hidalgo #789, Jardines, C.P. 93828', 'TRK987654321', 'transito', '2025-10-20', '2025-10-23', NULL, '2025-10-20 11:05:00', '2025-10-20 11:05:00'),
(7, 16, 'Blvd. Juárez #101, Polanco, C.P. 93829', 'TRK456789123', 'reparto', '2025-10-20', '2025-10-24', NULL, '2025-10-20 11:10:00', '2025-10-20 11:10:00'),
(8, 17, 'Paseo de la Reforma #202, Condesa, C.P. 93830', 'TRK789123456', 'entregado', '2025-10-20', '2025-10-25', NULL, '2025-10-20 11:15:00', '2025-10-20 11:15:00'),
(9, 18, 'Insurgentes #303, Roma, C.P. 93831', 'TRK321654987', 'preparacion', '2025-10-20', '2025-10-26', NULL, '2025-10-20 11:20:00', '2025-10-20 11:20:00'),
(10, 19, 'Av. Universidad #404, Coyoacan, C.P. 93832', 'TRK654987321', 'transito', '2025-10-20', '2025-10-27', NULL, '2025-10-20 11:25:00', '2025-10-20 11:25:00'),
(11, 20, 'Calle 5 de Mayo #505, Centro Historico, C.P. 93833', 'TRK987321654', 'reparto', '2025-10-20', '2025-10-28', NULL, '2025-10-20 11:30:00', '2025-10-20 11:30:00'),
(12, 21, 'Plaza Mayor #606, Tlalpan, C.P. 93834', 'TRK147258369', 'entregado', '2025-10-20', '2025-10-29', NULL, '2025-10-20 11:35:00', '2025-10-20 11:35:00'),
(13, 22, 'Av. Chapultepec #707, Polanco, C.P. 93835', 'TRK369258147', 'preparacion', '2025-10-20', '2025-10-30', NULL, '2025-10-20 11:40:00', '2025-10-20 11:40:00'),
(14, 23, 'Calle Morelos #808, Del Valle, C.P. 93836', 'TRK258369147', 'transito', '2025-10-20', '2025-10-31', NULL, '2025-10-20 11:45:00', '2025-10-20 11:45:00'),
(15, 24, 'Av. Reforma #456, Centro, C.P. 93827', 'TRK741852963', 'reparto', '2025-10-21', '2025-11-01', NULL, '2025-10-21 12:00:00', '2025-10-21 12:00:00'),
(16, 25, 'Calle Hidalgo #789, Jardines, C.P. 93828', 'TRK852963741', 'entregado', '2025-10-21', '2025-11-02', NULL, '2025-10-21 12:05:00', '2025-10-21 12:05:00'),
(17, 26, 'Blvd. Juárez #101, Polanco, C.P. 93829', 'TRK963741852', 'preparacion', '2025-10-21', '2025-11-03', NULL, '2025-10-21 12:10:00', '2025-10-21 12:10:00'),
(18, 27, 'Paseo de la Reforma #202, Condesa, C.P. 93830', 'TRK159753468', 'entregado', '2025-10-21', '2025-11-04', NULL, '2025-10-21 12:15:00', '2025-10-24 15:12:36'),
(19, 28, 'Insurgentes #303, Roma, C.P. 93831', 'TRK357951468', 'preparacion', '2025-10-21', '2025-11-05', NULL, '2025-10-21 12:20:00', '2025-10-24 15:12:30'),
(20, 29, 'Av. Universidad #404, Coyoacan, C.P. 93832', 'TRK468951357', 'entregado', '2025-10-21', '2025-11-06', NULL, '2025-10-21 12:25:00', '2025-10-21 12:25:00'),
(21, 30, 'Calle 5 de Mayo #505, Centro Historico, C.P. 93833', 'TRK579468135', 'preparacion', '2025-10-21', '2025-11-07', NULL, '2025-10-21 12:30:00', '2025-10-21 12:30:00'),
(22, 31, 'Plaza Mayor #606, Tlalpan, C.P. 93834', 'TRK681357924', 'entregado', '2025-10-21', '2025-11-08', NULL, '2025-10-21 12:35:00', '2025-10-24 15:12:13'),
(23, 32, 'Av. Chapultepec #707, Polanco, C.P. 93835', 'TRK792468135', 'entregado', '2025-10-21', '2025-11-09', NULL, '2025-10-21 12:40:00', '2025-10-24 15:11:59'),
(24, 33, 'Calle Morelos #808, Del Valle, C.P. 93836', 'TRK813579246', 'entregado', '2025-10-21', '2025-11-10', NULL, '2025-10-21 12:45:00', '2025-10-21 12:45:00'),
(25, 34, '2282195973 #32, Col. misantla, C.P. 93960', NULL, 'preparacion', NULL, NULL, NULL, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(26, 35, '2282195973 #32, Col. misantla, C.P. 93960', NULL, 'preparacion', NULL, NULL, NULL, '2025-10-24 15:21:24', '2025-10-24 15:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_01_085710_create_personal_access_tokens_table', 1),
(5, '2025_10_13_065120_add_timestamps_to_pedidos_table', 2),
(6, '2025_10_13_073855_add_timestamps_to_detalle_pedido_table', 3),
(7, '2025_10_13_075335_add_timestamps_to_envios_table', 4),
(8, '2025_10_13_075357_add_timestamps_to_pagos_table', 4),
(9, '2025_10_13_080051_add_timestamps_to_productos_table', 5),
(10, '2025_10_13_081056_add_timestamps_to_envios_table', 6),
(11, '2025_10_26_220539_modify_proveedores_and_envios_tables', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','completado','fallido') NOT NULL DEFAULT 'completado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `pedido_id`, `metodo_pago`, `monto`, `fecha_pago`, `estado`, `created_at`, `updated_at`) VALUES
(2, 10, 'Tarjeta', 1074.50, '2025-10-13 08:11:31', 'completado', '2025-10-13 14:11:31', '2025-10-13 14:11:31'),
(3, 11, 'Transferencia', 199.00, '2025-10-13 08:26:12', 'completado', '2025-10-13 14:26:12', '2025-10-13 14:26:12'),
(4, 12, 'Transferencia', 383.90, '2025-10-13 17:55:14', 'completado', '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(5, 13, 'MercadoPago', 881.90, '2025-10-15 23:08:07', 'completado', '2025-10-16 05:08:07', '2025-10-16 05:08:07'),
(6, 14, 'Tarjeta', 45.00, '2025-10-20 11:00:00', 'pendiente', '2025-10-20 11:00:00', '2025-10-20 11:00:00'),
(7, 15, 'Transferencia', 89.90, '2025-10-20 11:05:00', 'completado', '2025-10-20 11:05:00', '2025-10-20 11:05:00'),
(8, 16, 'MercadoPago', 120.00, '2025-10-20 11:10:00', 'completado', '2025-10-20 11:10:00', '2025-10-20 11:10:00'),
(9, 17, 'Tarjeta', 159.99, '2025-10-20 11:15:00', 'completado', '2025-10-20 11:15:00', '2025-10-20 11:15:00'),
(10, 18, 'Transferencia', 25.00, '2025-10-20 11:20:00', 'pendiente', '2025-10-20 11:20:00', '2025-10-20 11:20:00'),
(11, 19, 'MercadoPago', 249.00, '2025-10-20 11:25:00', 'completado', '2025-10-20 11:25:00', '2025-10-20 11:25:00'),
(12, 20, 'Tarjeta', 320.50, '2025-10-20 11:30:00', 'completado', '2025-10-20 11:30:00', '2025-10-20 11:30:00'),
(13, 21, 'Transferencia', 199.00, '2025-10-20 11:35:00', 'completado', '2025-10-20 11:35:00', '2025-10-20 11:35:00'),
(14, 22, 'MercadoPago', 12.50, '2025-10-20 11:40:00', 'pendiente', '2025-10-20 11:40:00', '2025-10-20 11:40:00'),
(15, 23, 'Tarjeta', 747.00, '2025-10-20 11:45:00', 'completado', '2025-10-20 11:45:00', '2025-10-20 11:45:00'),
(16, 24, 'Transferencia', 134.90, '2025-10-21 12:00:00', 'completado', '2025-10-21 12:00:00', '2025-10-21 12:00:00'),
(17, 25, 'MercadoPago', 25.00, '2025-10-21 12:05:00', 'completado', '2025-10-21 12:05:00', '2025-10-21 12:05:00'),
(18, 26, 'Tarjeta', 519.00, '2025-10-21 12:10:00', 'pendiente', '2025-10-21 12:10:00', '2025-10-21 12:10:00'),
(19, 27, 'Transferencia', 12.50, '2025-10-21 12:15:00', 'completado', '2025-10-21 12:15:00', '2025-10-21 12:15:00'),
(20, 28, 'MercadoPago', 89.90, '2025-10-21 12:20:00', 'completado', '2025-10-21 12:20:00', '2025-10-21 12:20:00'),
(21, 29, 'Tarjeta', 320.50, '2025-10-21 12:25:00', 'completado', '2025-10-21 12:25:00', '2025-10-21 12:25:00'),
(22, 30, 'Transferencia', 199.00, '2025-10-21 12:30:00', 'pendiente', '2025-10-21 12:30:00', '2025-10-21 12:30:00'),
(23, 31, 'MercadoPago', 45.00, '2025-10-21 12:35:00', 'completado', '2025-10-21 12:35:00', '2025-10-21 12:35:00'),
(24, 32, 'Tarjeta', 159.99, '2025-10-21 12:40:00', 'completado', '2025-10-21 12:40:00', '2025-10-21 12:40:00'),
(25, 33, 'Transferencia', 120.00, '2025-10-21 12:45:00', 'completado', '2025-10-21 12:45:00', '2025-10-21 12:45:00'),
(26, 34, 'MercadoPago', 1985.80, '2025-10-24 08:59:33', 'completado', '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(27, 35, 'Tarjeta', 3785.00, '2025-10-24 09:21:24', 'completado', '2025-10-24 15:21:24', '2025-10-24 15:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','procesando','enviado','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `fecha_pedido`, `estado`, `total`, `created_at`, `updated_at`) VALUES
(10, 1, '2025-10-13 08:11:31', 'entregado', 1074.50, '2025-10-13 14:11:31', '2025-10-13 23:52:34'),
(11, 1, '2025-10-13 08:26:12', 'entregado', 199.00, '2025-10-13 14:26:12', '2025-10-13 23:52:15'),
(12, 1, '2025-10-13 17:55:14', 'procesando', 383.90, '2025-10-13 23:55:14', '2025-10-13 23:55:14'),
(13, 1, '2025-10-15 23:08:07', 'entregado', 881.90, '2025-10-16 05:08:07', '2025-10-16 05:13:36'),
(14, 4, '2025-10-20 11:00:00', 'pendiente', 45.00, '2025-10-20 11:00:00', '2025-10-20 11:00:00'),
(15, 5, '2025-10-20 11:05:00', 'procesando', 89.90, '2025-10-20 11:05:00', '2025-10-20 11:05:00'),
(16, 6, '2025-10-20 11:10:00', 'enviado', 120.00, '2025-10-20 11:10:00', '2025-10-20 11:10:00'),
(17, 7, '2025-10-20 11:15:00', 'entregado', 159.99, '2025-10-20 11:15:00', '2025-10-20 11:15:00'),
(18, 8, '2025-10-20 11:20:00', 'pendiente', 25.00, '2025-10-20 11:20:00', '2025-10-20 11:20:00'),
(19, 9, '2025-10-20 11:25:00', 'procesando', 249.00, '2025-10-20 11:25:00', '2025-10-20 11:25:00'),
(20, 10, '2025-10-20 11:30:00', 'enviado', 320.50, '2025-10-20 11:30:00', '2025-10-20 11:30:00'),
(21, 11, '2025-10-20 11:35:00', 'entregado', 199.00, '2025-10-20 11:35:00', '2025-10-20 11:35:00'),
(22, 12, '2025-10-20 11:40:00', 'pendiente', 12.50, '2025-10-20 11:40:00', '2025-10-20 11:40:00'),
(23, 13, '2025-10-20 11:45:00', 'procesando', 747.00, '2025-10-20 11:45:00', '2025-10-20 11:45:00'),
(24, 4, '2025-10-21 12:00:00', 'enviado', 134.90, '2025-10-21 12:00:00', '2025-10-21 12:00:00'),
(25, 5, '2025-10-21 12:05:00', 'entregado', 25.00, '2025-10-21 12:05:00', '2025-10-21 12:05:00'),
(26, 6, '2025-10-21 12:10:00', 'pendiente', 519.00, '2025-10-21 12:10:00', '2025-10-21 12:10:00'),
(27, 7, '2025-10-21 12:15:00', 'entregado', 12.50, '2025-10-21 12:15:00', '2025-10-24 15:12:36'),
(28, 8, '2025-10-21 12:20:00', 'enviado', 89.90, '2025-10-21 12:20:00', '2025-10-21 12:20:00'),
(29, 9, '2025-10-21 12:25:00', 'entregado', 320.50, '2025-10-21 12:25:00', '2025-10-21 12:25:00'),
(30, 10, '2025-10-21 12:30:00', 'pendiente', 199.00, '2025-10-21 12:30:00', '2025-10-21 12:30:00'),
(31, 11, '2025-10-21 12:35:00', 'entregado', 45.00, '2025-10-21 12:35:00', '2025-10-24 15:12:13'),
(32, 12, '2025-10-21 12:40:00', 'entregado', 159.99, '2025-10-21 12:40:00', '2025-10-24 15:11:59'),
(33, 13, '2025-10-21 12:45:00', 'entregado', 120.00, '2025-10-21 12:45:00', '2025-10-21 12:45:00'),
(34, 2, '2025-10-24 08:59:33', 'procesando', 1985.80, '2025-10-24 14:59:33', '2025-10-24 14:59:33'),
(35, 2, '2025-10-24 09:21:24', 'procesando', 3785.00, '2025-10-24 15:21:24', '2025-10-24 15:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Usuario', 1, 'myapptoken', '22693689730f4590217c5e4a99bdeff43379d905495e0c0cee9534a900e132bb', '[\"*\"]', '2025-10-06 16:27:10', NULL, '2025-10-06 16:22:22', '2025-10-06 16:27:10'),
(2, 'App\\Models\\Usuario', 1, 'myapptoken', 'df51f43ecca043c73ffcd796f6f3fc5411f958a4af94b5b3549d959fca4a1603', '[\"*\"]', NULL, NULL, '2025-10-06 16:33:40', '2025-10-06 16:33:40'),
(4, 'App\\Models\\Usuario', 2, 'myapptoken', '043debdad8974b5da25da72595c2e596dfa0c3210f2e500ea86f22c5bb621d33', '[\"*\"]', '2025-10-07 05:57:01', NULL, '2025-10-06 16:53:14', '2025-10-07 05:57:01'),
(6, 'App\\Models\\Usuario', 3, 'myapptoken', '4d65116f0a6aa569e3b7d8e099908195923a8fabe17eebdca5baf89a1ccf1e61', '[\"*\"]', NULL, NULL, '2025-10-07 07:27:47', '2025-10-07 07:27:47'),
(7, 'App\\Models\\Usuario', 1, 'myapptoken', 'f0c058168b83f8894f41c1396ec7adfa663b1ab301bb80d84dbf2293ad0bda1d', '[\"*\"]', NULL, NULL, '2025-10-07 15:05:32', '2025-10-07 15:05:32'),
(8, 'App\\Models\\Usuario', 1, 'myapptoken', '4ceba1a5085675d7922ee2c0132b380cca5da18a6f19f31f180a48c78d1362a5', '[\"*\"]', NULL, NULL, '2025-10-07 15:07:20', '2025-10-07 15:07:20'),
(9, 'App\\Models\\Usuario', 1, 'myapptoken', 'd88b0a2a56d54342cd75dd81b44759aa5c59fd9efd51d9f3fd1eb01020867831', '[\"*\"]', NULL, NULL, '2025-10-07 15:07:38', '2025-10-07 15:07:38'),
(10, 'App\\Models\\Usuario', 1, 'myapptoken', 'f11a0df8256e4182da0b74ee08e2220cc42e108dc247a6e86e792e8949b955a6', '[\"*\"]', NULL, NULL, '2025-10-07 15:09:30', '2025-10-07 15:09:30'),
(11, 'App\\Models\\Usuario', 1, 'myapptoken', '456c9049bae8bdac640f2e6750839e7327abb2c295a0939f5066df278c685e5b', '[\"*\"]', NULL, NULL, '2025-10-07 15:23:16', '2025-10-07 15:23:16'),
(12, 'App\\Models\\Usuario', 1, 'myapptoken', 'f3d374ed441f3c52690298c9b397a26cd79e8415c057f888ceec4de3524a7d23', '[\"*\"]', NULL, NULL, '2025-10-07 15:28:01', '2025-10-07 15:28:01'),
(13, 'App\\Models\\Usuario', 1, 'myapptoken', '4b6f5dc96e83fff9f748d9d05b021b37d4cf30f4dae0fdb878b42a818e23baa6', '[\"*\"]', NULL, NULL, '2025-10-07 15:36:17', '2025-10-07 15:36:17'),
(14, 'App\\Models\\Usuario', 1, 'myapptoken', '442bce025cbb31e995d57f0a085b9801adbd2151b6591b1786c8ee2b7634d3fc', '[\"*\"]', NULL, NULL, '2025-10-07 15:39:10', '2025-10-07 15:39:10'),
(15, 'App\\Models\\Usuario', 1, 'myapptoken', '26ae8cb34f79cc363c88cb5db96c3f7408f506f7f3d473fd6d8b75a62c9205cc', '[\"*\"]', NULL, NULL, '2025-10-07 15:42:04', '2025-10-07 15:42:04'),
(16, 'App\\Models\\Usuario', 1, 'myapptoken', 'd256c3ab853d23c016667737579b155c6ba9fc107e5411ee959ff1e7629f72ba', '[\"*\"]', NULL, NULL, '2025-10-07 15:48:58', '2025-10-07 15:48:58'),
(17, 'App\\Models\\Usuario', 1, 'myapptoken', '0f37e7d8b3a0b690d82a934b59bb5096380e3d9b1a0c30e4b8b97868b8a88b0b', '[\"*\"]', NULL, NULL, '2025-10-07 15:54:17', '2025-10-07 15:54:17'),
(34, 'App\\Models\\Usuario', 1, 'myapptoken', 'a6e3c09464b80892c59c0ebde561306c79560f457294b308ce7360c5457fb43b', '[\"*\"]', NULL, NULL, '2025-10-11 03:16:09', '2025-10-11 03:16:09'),
(35, 'App\\Models\\Usuario', 1, 'myapptoken', 'a717670501fe219469e7455161ea2eb0f9b1c03289dd1bf869daae4c397e3ed2', '[\"*\"]', NULL, NULL, '2025-10-11 03:25:09', '2025-10-11 03:25:09'),
(39, 'App\\Models\\Usuario', 1, 'myapptoken', '3e7044683adeb94d034b81080e01a8504b11d3fee972503f2e274e9614d361d8', '[\"*\"]', '2025-10-15 05:05:23', NULL, '2025-10-13 11:51:14', '2025-10-15 05:05:23'),
(41, 'App\\Models\\Usuario', 1, 'myapptoken', '719eff46e3c64744ec7a911fc1b3d0da1038607be37473bd88373efa98df16bd', '[\"*\"]', '2025-10-13 12:47:55', NULL, '2025-10-13 12:46:52', '2025-10-13 12:47:55'),
(42, 'App\\Models\\Usuario', 1, 'myapptoken', '6a12700189ddfaf223d699f5fd2b2c5b62109dca7017354db1cb547e4ca29611', '[\"*\"]', '2025-10-13 13:29:36', NULL, '2025-10-13 13:28:31', '2025-10-13 13:29:36'),
(43, 'App\\Models\\Usuario', 1, 'myapptoken', '927b36cb0f95b18da5323c53b40b26bf180d0dc877f53720afa6f3f207572217', '[\"*\"]', '2025-10-13 13:37:33', NULL, '2025-10-13 13:36:54', '2025-10-13 13:37:33'),
(44, 'App\\Models\\Usuario', 1, 'myapptoken', 'e79a8081a7bfb3652ec212d5ba8c6b4acc818a6b1a74a1a0c2177563ebb9f08c', '[\"*\"]', '2025-10-13 13:57:08', NULL, '2025-10-13 13:56:46', '2025-10-13 13:57:08'),
(48, 'App\\Models\\Usuario', 1, 'myapptoken', 'fde3a5b5d4c7dceaeb07dc4476b863ab7f105f82642489321b551a7d4455e02d', '[\"*\"]', '2025-10-13 23:55:24', NULL, '2025-10-13 23:54:24', '2025-10-13 23:55:24'),
(49, 'App\\Models\\Usuario', 1, 'myapptoken', '5d4e74a7a97653f69ec49d15b2ef8361354d2e454101245eab40fdee5a491f71', '[\"*\"]', '2025-10-16 05:13:49', NULL, '2025-10-16 05:06:24', '2025-10-16 05:13:49'),
(53, 'App\\Models\\Usuario', 1, 'myapptoken', '3fabd4726fbd52ffe7ef36629f29601234cb68e1323825b1681f33e1793cea62', '[\"*\"]', '2025-10-21 11:22:35', NULL, '2025-10-21 11:22:27', '2025-10-21 11:22:35'),
(63, 'App\\Models\\Usuario', 2, 'myapptoken', '7ab9ec20d43aec5c29054e0997b664375ff58a18d861af14b315df08ff7e831e', '[\"*\"]', '2025-10-24 14:59:33', NULL, '2025-10-24 14:58:19', '2025-10-24 14:59:33'),
(74, 'App\\Models\\Usuario', 1, 'myapptoken', '54499ed36d092cc813d73831cb08385c5a46aaf24f01b3f349123004f0ece26e', '[\"*\"]', '2025-10-27 04:27:50', NULL, '2025-10-27 02:35:01', '2025-10-27 04:27:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL,
  `costo` decimal(8,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen_url` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `costo`, `stock`, `imagen_url`, `categoria_id`, `proveedor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cuaderno Pasta Dura A4', '150 hojas rayadas, ideal para estudiantes.', 45.00, 38.80, 178, 'imagenes/libreta.png', 1, 4, NULL, '2025-10-16 05:08:07'),
(2, 'Set de 12 Lápices de Colores', 'Colores vivos, mina resistente, perfecto para dibujo escolar.', 89.90, 77.50, 291, 'imagenes/colores.png', 1, 1, NULL, '2025-10-24 14:59:33'),
(3, 'Borrador de Migajón Grande', 'Borrador suave que no daña el papel, para lápiz.', 12.50, 10.78, 439, 'imagenes/goma.png', 1, 3, NULL, '2025-10-24 15:21:24'),
(4, 'Paquete de Hojas Carta (500)', 'Papel bond blanco de 75g, ideal para impresoras.', 120.00, 103.50, 106, 'imagenes/hojas.png', 2, 2, NULL, '2025-10-13 14:11:31'),
(5, 'Grapadora de Escritorio', 'Capacidad para 20 hojas, cuerpo metálico.', 159.99, 137.92, 75, 'imagenes/grapadora.png', 2, 1, NULL, NULL),
(6, 'Cinta Adhesiva Transparente', 'Cinta de 18mm x 30m, para uso general de oficina.', 25.00, 21.55, 214, 'imagenes/cinta.png', 2, 2, NULL, '2025-10-24 14:59:33'),
(7, 'Mouse Óptico Inalámbrico', 'Diseño ergonómico, conexión USB 2.4Ghz.', 249.00, 214.65, 31, 'imagenes/mouse.png', 3, 4, NULL, '2025-10-24 15:21:24'),
(8, 'Calculadora Científica', '10+2 dígitos, 240 funciones, ideal para nivel medio superior.', 320.50, 276.30, 34, 'imagenes/calculadora.png', 3, 2, NULL, '2025-10-13 14:11:31'),
(9, 'USB Flash Drive 32GB', 'USB 3.0 de alta velocidad, ideal para transferencia de archivos.', 199.00, 171.55, 82, 'imagenes/usb.png', 3, 3, NULL, '2025-10-24 15:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `email`, `telefono`, `ciudad`) VALUES
(1, 'Distribuidora El Lápiz', 'contacto@ellapiz.com', '5512345678', NULL),
(2, 'Papeles del Futuro S.A.', 'ventas@papelfuturo.net', '5587654321', NULL),
(3, 'Tecnología de Oficina Global', 'soporte@tog.com', '5555551122', NULL),
(4, 'Mayorista de Material Escolar', 'info@materialescolar.com', '5522334455', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('X4XU8dAriIq938OChTfTvYMFKby3bRs4SdoGhIBc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFlGTjdDVnNwbWJmMnZzeTFNQXJHOXJRSU8xbzUzWExXdUpNMWRLdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760909051);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('usuario','administrador') NOT NULL DEFAULT 'usuario',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `created_at`, `updated_at`) VALUES
(1, 'Ricardo Hernandez', 'admin@papeleria.com', '$2y$12$Ms5hFq3Saa6dOAyv5eazq.waU1VlljMIPEcr4BltKV0ndnogLcaCW', 'administrador', '2025-10-06 07:43:43', '2025-10-06 10:17:31'),
(2, 'Angel Zapata', 'cliente@prueba.com', '$2y$12$FgU1trBzL30JpAIA19t4ReOJp4uHAZMFA3bDuJqi0Bo6XqQ3pdAMm', 'usuario', '2025-10-06 07:43:43', '2025-10-06 10:52:37'),
(3, 'Jesus', 'cliente@pape.com', '$2y$12$0JwcwjjcmbzfxOYkxBL8HOjggIFwkf3h1lNfGyy5LC7FakvfpVwiG', 'usuario', '2025-10-07 07:27:46', '2025-10-07 07:27:46'),
(4, 'Maria Lopez', 'usuario4@papeleria.com', '$2y$12$samplehashforuser4', 'usuario', '2025-10-20 10:00:00', '2025-10-20 10:00:00'),
(5, 'Carlos Ramirez', 'usuario5@papeleria.com', '$2y$12$samplehashforuser5', 'usuario', '2025-10-20 10:05:00', '2025-10-20 10:05:00'),
(6, 'Ana Torres', 'usuario6@papeleria.com', '$2y$12$samplehashforuser6', 'usuario', '2025-10-20 10:10:00', '2025-10-20 10:10:00'),
(7, 'Luis Gomez', 'usuario7@papeleria.com', '$2y$12$samplehashforuser7', 'usuario', '2025-10-20 10:15:00', '2025-10-20 10:15:00'),
(8, 'Sofia Martinez', 'usuario8@papeleria.com', '$2y$12$samplehashforuser8', 'usuario', '2025-10-20 10:20:00', '2025-10-20 10:20:00'),
(9, 'Diego Sanchez', 'usuario9@papeleria.com', '$2y$12$samplehashforuser9', 'usuario', '2025-10-20 10:25:00', '2025-10-20 10:25:00'),
(10, 'Elena Ruiz', 'usuario10@papeleria.com', '$2y$12$samplehashforuser10', 'usuario', '2025-10-20 10:30:00', '2025-10-20 10:30:00'),
(11, 'Pablo Fernandez', 'usuario11@papeleria.com', '$2y$12$samplehashforuser11', 'usuario', '2025-10-20 10:35:00', '2025-10-20 10:35:00'),
(12, 'Laura Jimenez', 'usuario12@papeleria.com', '$2y$12$samplehashforuser12', 'usuario', '2025-10-20 10:40:00', '2025-10-20 10:40:00'),
(13, 'Miguel Castro', 'usuario13@papeleria.com', '$2y$12$samplehashforuser13', 'usuario', '2025-10-20 10:45:00', '2025-10-20 10:45:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
