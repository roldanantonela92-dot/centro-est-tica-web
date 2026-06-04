-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2026 a las 19:38:19
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
-- Base de datos: `esteticadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `id_negocio`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(6, 2, 'Capping', 'Servicios esenciales de uñas', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(7, 2, 'Capping en Poly gel', 'Servicios esenciales de uñas', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(8, 2, 'Esmaltado semi permanente', 'Servicios esenciales de uñas', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(9, 2, 'Soft gel', 'Diseños artísticos y personalizados', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(10, 1, 'Tratamientos Corporales', 'Terapias para el cuerpo', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(11, 1, 'Tratamientos Faciales', 'Cuidado especializado para el rostro', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(12, 1, 'Masajes', 'Diversos tipos de masajes terapéuticos', '2025-08-15 21:00:12', '2025-08-15 21:00:12'),
(14, 1, 'Combos', NULL, '2025-10-11 20:19:35', '2025-10-11 20:19:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha_hora_inicio` datetime NOT NULL,
  `fecha_hora_fin` datetime NOT NULL,
  `estado` varchar(20) DEFAULT 'pendiente',
  `notas` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_servicios`
--

CREATE TABLE `cita_servicios` (
  `id` int(11) NOT NULL,
  `cita_id` int(11) NOT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `combo_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combos`
--

CREATE TABLE `combos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_negocio` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `duracion_minutos` int(11) DEFAULT 105
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `combos`
--

INSERT INTO `combos` (`id`, `nombre`, `precio`, `descuento`, `imagen_url`, `fecha_inicio`, `fecha_fin`, `descripcion`, `id_negocio`, `activo`, `created_at`, `updated_at`, `duracion_minutos`) VALUES
(1, 'Sesión Booty Up', 24650.00, NULL, 'https://dermativa.es/wp-content/uploads/2020/07/radiofrecuenciacelulitis.jpg', NULL, NULL, 'Vacumterapia + electrodos + masaje de levantamiento', 1, 1, '2025-08-15 22:20:40', '2025-12-15 17:10:22', 105),
(2, 'Reducción Intensiva', 21600.00, NULL, 'https://www.clinicadermavita.com/images/reduccion.jpg', NULL, NULL, 'Masajes reductores + electrodos + radiofrecuencia', 1, 1, '2025-08-15 22:20:40', '2025-12-15 17:10:22', 105),
(3, 'Jornadas Antiarrugas', 31450.00, NULL, 'https://stronglify-1.s3.sa-east-1.amazonaws.com/farmadodo/Como-eliminar-las-arrugas-en-la-cara.png', NULL, NULL, '1 sesión dermapen + 3 sesiones radiofrecuencia', 1, 1, '2025-08-15 22:20:40', '2025-12-15 17:10:22', 105),
(4, 'Electrodos + Masajes reductores', 15300.00, NULL, 'https://www.tens.es/blog/wp-content/uploads/2021/09/aplicacion-electrodos-750x480-1.jpg', NULL, NULL, 'Combo de electrodos con masajes', 1, 1, '2025-08-15 22:20:40', '2025-12-15 17:10:22', 105),
(5, 'Sesión Intensiva de piernas', 20000.00, NULL, 'https://saucsalut.com/wp-content/uploads/2023/12/Masaje-terapeutico-de-piernas-con-aceites-esenciales-scaled.jpeg', NULL, NULL, 'Presoterapia + masajes reductores + radiofrecuencia', 1, 1, '2025-08-15 22:20:40', '2025-12-15 17:10:22', 105),
(13, 'PRUEBA COMBO', 68000.00, NULL, 'https://i.pinimg.com/236x/4e/05/4f/4e054f8ada4c864028501818e4dfddf5.jpg', NULL, NULL, 'pruebita', 1, 1, '2025-12-18 14:33:41', '2025-12-18 14:35:12', 105),
(14, 'PRUEBA', 88888.00, NULL, '', NULL, NULL, 'iuhiuh', 1, 1, '2025-12-18 18:42:07', '2025-12-18 18:42:07', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combo_servicios`
--

CREATE TABLE `combo_servicios` (
  `id` int(11) NOT NULL,
  `combo_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `combo_servicios`
--

INSERT INTO `combo_servicios` (`id`, `combo_id`, `servicio_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 30, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(2, 1, 39, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(3, 1, 34, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(4, 2, 34, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(5, 2, 39, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(6, 2, 29, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(7, 3, 31, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(8, 3, 32, 3, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(9, 4, 39, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(10, 4, 34, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(11, 5, 26, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(12, 5, 34, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27'),
(13, 5, 29, 1, '2025-08-15 22:36:27', '2025-08-15 22:36:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `dia_semana` int(11) NOT NULL,
  `hora_apertura` time DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_feriados`
--

CREATE TABLE `dias_feriados` (
  `id` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_combo` int(11) DEFAULT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_realizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_cancelacion` datetime DEFAULT NULL,
  `cancelada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `id_usuario`, `nombre`, `apellido`, `id_categoria`, `id_servicio`, `id_combo`, `id_negocio`, `id_cita`, `id_venta`, `precio`, `fecha_realizacion`, `created_at`, `updated_at`, `fecha_cancelacion`, `cancelada`) VALUES
(106, 20, 'Ari', 'Roldan', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-11-19 11:00:00', '2025-11-18 01:57:59', '2025-12-14 20:07:25', '2025-12-14 17:07:25', 1),
(107, 20, 'Ari', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-11-19 13:00:00', '2025-11-18 03:00:20', '2025-12-14 20:18:26', '2025-12-14 17:18:26', 1),
(108, 20, 'Ari', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 16000.00, '2025-11-20 13:00:00', '2025-11-18 03:30:17', '2025-11-18 03:30:17', NULL, 0),
(110, 21, 'noelia', 'noelia', 14, NULL, 3, 1, NULL, NULL, 16000.00, '2025-11-20 19:00:00', '2025-11-18 03:45:58', '2025-11-18 03:45:58', NULL, 0),
(111, 21, 'noelia', 'noelia', 11, 33, NULL, 1, NULL, NULL, 8000.00, '2025-11-21 20:00:00', '2025-11-18 03:46:21', '2025-11-18 03:46:21', NULL, 0),
(112, 18, 'Anto', 'Roldan', 11, 32, NULL, 1, NULL, NULL, 9000.00, '2025-11-28 21:00:00', '2025-11-18 04:14:04', '2025-11-18 04:14:04', NULL, 0),
(113, 20, 'Ari', 'Roldan', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-11-27 12:00:00', '2025-11-19 02:22:24', '2025-11-19 02:22:24', NULL, 0),
(114, 18, 'Anto', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-11-26 12:00:00', '2025-11-19 02:49:50', '2025-11-19 02:49:50', NULL, 0),
(115, 18, 'Anto', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-12-17 14:00:00', '2025-12-12 00:48:13', '2025-12-14 19:59:59', '2025-12-14 16:59:59', 1),
(116, 21, 'noelia', 'noelia', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-12-19 12:00:00', '2025-12-13 18:54:43', '2025-12-15 17:29:36', '2025-12-15 14:29:36', 1),
(117, 21, 'noelia', 'noelia', 14, NULL, 5, 1, NULL, NULL, 12000.00, '2025-12-16 19:00:00', '2025-12-13 19:23:13', '2025-12-14 19:59:51', '2025-12-14 16:59:51', 1),
(119, 21, 'noelia', 'noelia', 14, NULL, 3, 1, NULL, NULL, 16000.00, '2025-12-19 19:00:00', '2025-12-13 19:26:56', '2025-12-15 17:29:17', '2025-12-15 14:29:17', 1),
(120, 21, 'noelia', 'noelia', 14, NULL, 1, 1, NULL, NULL, 8200.00, '2025-12-30 11:00:00', '2025-12-13 19:32:17', '2025-12-14 19:59:16', '2025-12-14 16:59:16', 1),
(121, 21, 'noelia', 'noelia', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-12-31 13:00:00', '2025-12-13 19:40:46', '2025-12-15 17:22:29', '2025-12-15 14:22:29', 1),
(122, 21, 'noelia', 'noelia', 14, NULL, 3, 1, NULL, NULL, 16000.00, '2025-12-29 19:00:00', '2025-12-15 00:12:19', '2025-12-14 20:13:57', '2025-12-14 17:13:57', 1),
(123, 18, 'Antonela', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-12-17 20:00:00', '2025-12-15 21:34:08', '2025-12-15 17:36:13', '2025-12-15 14:36:13', 1),
(124, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-18 20:00:00', '2025-12-15 21:41:06', '2025-12-15 17:50:48', '2025-12-15 14:50:48', 1),
(125, 18, 'Antonela', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2025-12-25 19:00:00', '2025-12-15 21:41:19', '2025-12-15 17:42:09', '2025-12-15 14:42:09', 1),
(126, 18, 'Antonela', 'Roldan', 11, 33, NULL, 1, NULL, NULL, 8000.00, '2025-12-30 21:00:00', '2025-12-15 21:41:42', '2025-12-15 17:42:02', '2025-12-15 14:42:02', 1),
(127, 21, 'noelia', 'noelia', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-12-25 14:00:00', '2025-12-15 21:54:21', '2025-12-15 22:15:14', '2025-12-15 19:15:14', 1),
(128, 21, 'noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-18 21:00:00', '2025-12-16 02:11:04', '2025-12-15 22:17:51', '2025-12-15 19:17:51', 1),
(129, 21, 'Noelia', 'Martinez', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-12-26 21:00:00', '2025-12-16 02:27:04', '2025-12-15 22:50:37', '2025-12-15 19:50:37', 1),
(130, 21, 'Noelia', 'Martinez', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-30 13:00:00', '2025-12-16 02:33:25', '2025-12-15 22:45:46', '2025-12-15 19:45:46', 1),
(131, 21, 'Noelia', 'Martinez', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-23 11:00:00', '2025-12-16 02:36:16', '2025-12-15 22:49:03', '2025-12-15 19:49:03', 1),
(132, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-29 11:00:00', '2025-12-16 02:52:26', '2025-12-15 23:01:47', '2025-12-15 20:01:47', 1),
(133, 21, 'Noelia', 'Martinez', 10, 43, NULL, 1, NULL, NULL, 10000.00, '2025-12-26 22:00:00', '2025-12-16 02:52:35', '2025-12-15 23:04:25', '2025-12-15 20:04:25', 1),
(134, 21, 'Noelia', 'Martinez', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-12-30 19:00:00', '2025-12-16 02:52:46', '2025-12-15 22:53:00', '2025-12-15 19:53:00', 1),
(135, 21, 'Noelia', 'Martinez', 11, 33, NULL, 1, NULL, NULL, 8000.00, '2025-12-25 22:00:00', '2025-12-16 03:03:03', '2025-12-15 23:07:51', '2025-12-15 20:07:51', 1),
(137, 21, 'Noelia', 'Martinez', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2025-12-22 13:00:00', '2025-12-16 03:11:39', '2025-12-15 23:23:08', '2025-12-15 20:23:08', 1),
(138, 21, 'Noelia', 'Martinez', 12, 35, NULL, 1, NULL, NULL, 9000.00, '2025-12-26 20:00:00', '2025-12-16 03:11:51', '2025-12-15 23:12:07', '2025-12-15 20:12:07', 1),
(139, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-18 12:00:00', '2025-12-16 03:22:00', '2025-12-16 00:52:32', '2025-12-15 21:52:32', 1),
(140, 21, 'Noelia', 'Martinez', 11, 32, NULL, 1, NULL, NULL, 9000.00, '2026-01-06 14:00:00', '2025-12-16 03:39:37', '2025-12-15 23:45:44', '2025-12-15 20:45:44', 1),
(141, 21, 'Noelia', 'Martinez', 11, 31, NULL, 1, NULL, NULL, 10000.00, '2026-01-07 20:00:00', '2025-12-16 03:39:50', '2025-12-15 23:40:08', '2025-12-15 20:40:08', 1),
(142, 21, 'Noelia', 'Martinez', 7, 18, NULL, 2, NULL, NULL, 15500.00, '2025-12-26 14:00:00', '2025-12-16 00:40:43', '2025-12-18 00:57:22', '2025-12-17 21:57:22', 1),
(143, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-31 20:00:00', '2025-12-16 04:41:39', '2025-12-16 00:54:08', '2025-12-15 21:54:08', 1),
(144, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-23 13:00:00', '2025-12-16 04:45:26', '2025-12-16 03:14:10', '2025-12-16 00:14:10', 1),
(145, 21, 'Noelia', 'Martinez', 10, 39, NULL, 1, NULL, NULL, 8500.00, '2025-12-23 14:00:00', '2025-12-16 04:45:35', '2025-12-16 00:45:57', '2025-12-15 21:45:57', 1),
(146, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-25 12:00:00', '2025-12-16 04:45:43', '2025-12-16 02:20:13', '2025-12-15 23:20:13', 1),
(148, 18, 'Antonela', 'Roldan', 14, NULL, 2, 1, NULL, NULL, 21600.00, '2025-12-31 11:00:00', '2025-12-16 07:31:01', '2025-12-16 03:31:20', '2025-12-16 00:31:20', 1),
(150, 18, 'Antonela', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2025-12-25 19:00:00', '2025-12-17 01:42:17', '2025-12-17 17:18:00', '2025-12-17 14:18:00', 1),
(151, 20, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-11-20 14:00:00', '2025-11-18 03:30:17', '2025-11-18 03:30:17', NULL, 0),
(152, 21, 'Bloqueo por combo', 'noelia', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-11-20 20:00:00', '2025-11-18 03:45:58', '2025-11-18 03:45:58', NULL, 0),
(153, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 0.00, '2025-12-25 20:00:00', '2025-12-17 01:42:17', '2025-12-17 17:17:47', '2025-12-17 14:17:47', 1),
(155, 18, 'Antonela', 'Roldan', 10, 39, NULL, 1, NULL, NULL, 8500.00, '2025-12-31 13:00:00', '2025-12-17 02:31:34', '2025-12-17 17:17:20', '2025-12-17 14:17:20', 1),
(156, 18, 'Antonela', 'Roldan', 12, 37, NULL, 1, NULL, NULL, 12000.00, '2025-12-26 11:00:00', '2025-12-17 02:33:35', '2025-12-17 17:17:56', '2025-12-17 14:17:56', 1),
(157, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-26 13:00:00', '2025-12-17 02:33:53', '2025-12-17 17:17:52', '2025-12-17 14:17:52', 1),
(158, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-12-26 14:00:00', '2025-12-17 02:33:53', '2025-12-17 17:17:41', '2025-12-17 14:17:41', 1),
(159, 18, 'Antonela', 'Roldan', 11, 32, NULL, 1, NULL, NULL, 9000.00, '2025-12-31 13:00:00', '2025-12-17 21:18:20', '2025-12-17 21:18:20', NULL, 0),
(160, 18, 'Antonela', 'Roldan', 14, NULL, 5, 1, NULL, NULL, 20000.00, '2025-12-31 20:00:00', '2025-12-17 21:19:05', '2025-12-18 02:45:35', '2025-12-17 23:45:35', 1),
(161, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 5, 1, NULL, NULL, 0.00, '2025-12-31 21:00:00', '2025-12-17 21:19:05', '2025-12-17 21:19:05', NULL, 0),
(168, 18, 'Antonela', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2025-12-31 11:00:00', '2025-12-17 21:39:13', '2025-12-18 00:41:56', '2025-12-17 21:41:56', 1),
(169, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 0.00, '2025-12-31 12:00:00', '2025-12-17 21:39:13', '2025-12-17 21:39:13', NULL, 0),
(170, 18, 'Antonela', 'Roldan', 10, 38, NULL, 1, NULL, NULL, 8000.00, '2025-12-19 19:00:00', '2025-12-17 21:39:54', '2025-12-17 23:57:16', '2025-12-17 20:57:16', 1),
(172, 18, 'Antonela', 'Roldan', 14, NULL, 4, 1, NULL, NULL, 15300.00, '2025-12-23 13:00:00', '2025-12-17 21:54:45', '2025-12-17 18:06:14', '2025-12-17 15:06:14', 1),
(173, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 4, 1, NULL, NULL, 0.00, '2025-12-23 14:00:00', '2025-12-17 21:54:45', '2025-12-17 21:54:45', NULL, 0),
(176, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-18 21:00:00', '2025-12-17 22:10:52', '2025-12-17 23:51:50', '2025-12-17 20:51:50', 1),
(177, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-12-18 22:00:00', '2025-12-17 22:10:52', '2025-12-17 22:10:52', NULL, 0),
(178, 18, 'Antonela', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2025-12-26 13:00:00', '2025-12-18 01:36:04', '2025-12-17 23:57:02', '2025-12-17 20:57:02', 1),
(179, 18, 'Antonela', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2025-12-26 21:00:00', '2025-12-18 01:36:33', '2025-12-17 23:51:23', '2025-12-17 20:51:23', 1),
(180, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 1, 1, NULL, NULL, 0.00, '2025-12-26 22:00:00', '2025-12-18 01:36:33', '2025-12-18 01:36:33', NULL, 0),
(186, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 14500.00, '2025-12-25 19:00:00', '2025-12-17 23:13:53', '2025-12-18 01:02:02', '2025-12-17 22:02:02', 1),
(187, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 0.00, '2025-12-25 20:00:00', '2025-12-17 23:13:53', '2025-12-18 00:56:07', '2025-12-17 21:56:07', 1),
(188, 23, 'Camila', 'Sanchez', 7, 18, NULL, 2, NULL, NULL, 15500.00, '2025-12-25 22:00:00', '2025-12-17 23:19:30', '2025-12-18 00:55:19', '2025-12-17 21:55:19', 1),
(189, 23, 'Camila', 'Sanchez', 7, 16, NULL, 2, NULL, NULL, 10500.00, '2025-12-31 13:00:00', '2025-12-17 23:19:43', '2025-12-17 23:46:55', NULL, 1),
(196, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 14500.00, '2025-12-25 21:00:00', '2025-12-18 02:28:18', '2025-12-18 02:29:06', '2025-12-17 23:29:06', 1),
(197, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 11500.00, '2025-12-25 19:00:00', '2025-12-18 02:41:50', '2025-12-18 15:19:51', '2025-12-18 12:19:51', 1),
(198, 23, 'Camila', 'Sanchez', 7, 17, NULL, 2, NULL, NULL, 14500.00, '2025-12-25 22:00:00', '2025-12-18 02:42:07', '2025-12-18 15:24:14', '2025-12-18 12:24:14', 1),
(199, 21, 'Noelia', 'Martinez', 8, 9, NULL, 2, NULL, NULL, 15500.00, '2025-12-25 20:00:00', '2025-12-18 02:43:14', '2025-12-18 15:25:35', '2025-12-18 12:25:35', 1),
(200, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-30 11:00:00', '2025-12-18 06:52:45', '2025-12-18 04:22:05', '2025-12-18 01:22:05', 1),
(201, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-12-30 12:00:00', '2025-12-18 06:52:45', '2025-12-18 04:22:05', '2025-12-18 01:22:05', 1),
(202, 18, 'Antonela', 'Roldan', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-12-30 14:00:00', '2025-12-18 06:58:19', '2025-12-18 06:58:19', NULL, 0),
(203, 18, 'Antonela', 'Roldan', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-31 19:00:00', '2025-12-18 07:04:08', '2025-12-18 07:04:08', NULL, 0),
(206, 18, 'Antonela', 'Roldan', 10, 39, NULL, 1, NULL, NULL, 8500.00, '2025-12-19 21:00:00', '2025-12-18 07:05:32', '2025-12-18 03:56:57', '2025-12-18 00:56:57', 1),
(207, 18, 'Antonela', 'Roldan', 10, 39, NULL, 1, NULL, NULL, 8500.00, '2025-12-19 13:00:00', '2025-12-18 07:13:13', '2025-12-18 03:18:51', '2025-12-18 00:18:51', 1),
(208, 18, 'Antonela', 'Roldan', 10, 43, NULL, 1, NULL, NULL, 10000.00, '2025-12-24 11:00:00', '2025-12-18 07:19:17', '2025-12-18 03:54:20', '2025-12-18 00:54:20', 1),
(212, 18, 'Antonela', 'Roldan', 11, 31, NULL, 1, NULL, NULL, 10000.00, '2025-12-22 19:00:00', '2025-12-18 07:27:57', '2025-12-18 03:33:11', '2025-12-18 00:33:11', 1),
(215, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-22 20:00:00', '2025-12-18 07:29:06', '2025-12-18 03:29:32', '2025-12-18 00:29:32', 1),
(216, 18, 'Antonela', 'Roldan', 10, 39, NULL, 1, NULL, NULL, 8500.00, '2025-12-22 19:00:00', '2025-12-18 07:33:31', '2025-12-18 03:51:30', '2025-12-18 00:51:30', 1),
(217, 18, 'Antonela', 'Roldan', 14, NULL, 4, 1, NULL, NULL, 15300.00, '2025-12-23 19:00:00', '2025-12-18 07:38:10', '2025-12-18 03:38:44', '2025-12-18 00:38:44', 1),
(218, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 4, 1, NULL, NULL, 0.00, '2025-12-23 20:00:00', '2025-12-18 07:38:10', '2025-12-18 07:38:10', NULL, 0),
(219, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2025-12-26 19:00:00', '2025-12-18 07:58:11', '2025-12-18 03:58:56', '2025-12-18 00:58:56', 1),
(220, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2025-12-26 20:00:00', '2025-12-18 07:58:11', '2025-12-18 03:58:56', '2025-12-18 00:58:56', 1),
(221, 18, 'Antonela', 'Roldan', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2025-12-26 20:00:00', '2025-12-18 07:59:17', '2025-12-18 07:59:17', NULL, 0),
(222, 18, 'Antonela', 'Roldan', 11, 32, NULL, 1, NULL, NULL, 9000.00, '2025-12-24 19:00:00', '2025-12-18 08:00:59', '2025-12-18 04:20:36', '2025-12-18 01:20:36', 1),
(223, 18, 'Antonela', 'Roldan', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-30 12:00:00', '2025-12-18 08:22:36', '2025-12-18 08:22:36', NULL, 0),
(224, 21, 'Noelia', 'Martinez', 8, 9, NULL, 2, NULL, NULL, 12500.00, '2025-12-25 11:00:00', '2025-12-18 04:25:52', '2025-12-18 04:26:16', '2025-12-18 01:26:16', 1),
(225, 21, 'Noelia', 'Martinez', 8, 7, NULL, 2, NULL, NULL, 10000.00, '2025-12-25 11:00:00', '2025-12-18 04:26:36', '2025-12-18 15:30:37', '2025-12-18 12:30:37', 1),
(227, 18, 'Antonela', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2026-01-01 19:00:00', '2025-12-18 08:45:57', '2025-12-18 04:47:04', '2025-12-18 01:47:04', 1),
(228, 18, 'Antonela', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 31450.00, '2026-01-01 21:00:00', '2025-12-18 08:46:15', '2025-12-18 04:47:00', '2025-12-18 01:47:00', 1),
(229, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 3, 1, NULL, NULL, 0.00, '2026-01-01 22:00:00', '2025-12-18 08:46:15', '2025-12-18 04:47:00', '2025-12-18 01:47:00', 1),
(230, 18, 'Antonela', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2026-01-01 22:00:00', '2025-12-18 08:47:32', '2025-12-18 14:27:32', '2025-12-18 11:27:32', 1),
(231, 18, 'Antonela', 'Roldan', 10, 26, NULL, 1, NULL, NULL, 8000.00, '2026-01-01 22:00:00', '2025-12-18 18:27:54', '2025-12-18 18:27:54', NULL, 0),
(234, 18, 'Antonela', 'Roldan', 10, 28, NULL, 1, NULL, NULL, 12000.00, '2026-01-01 14:00:00', '2025-12-18 18:29:46', '2025-12-18 18:29:46', NULL, 0),
(235, 21, 'Noelia', 'Martinez', 10, 38, NULL, 1, NULL, NULL, 8000.00, '2026-01-02 19:00:00', '2025-12-18 18:39:41', '2025-12-18 14:41:42', '2025-12-18 11:41:42', 1),
(236, 21, 'Noelia', 'Martinez', 10, 43, NULL, 1, NULL, NULL, 10000.00, '2026-01-02 20:00:00', '2025-12-18 18:39:49', '2025-12-18 19:26:23', '2025-12-18 16:26:23', 1),
(237, 21, 'Noelia', 'Martinez', 14, NULL, 1, 1, NULL, NULL, 24650.00, '2026-01-02 21:00:00', '2025-12-18 18:39:59', '2025-12-18 14:41:52', '2025-12-18 11:41:52', 1),
(238, 21, 'Bloqueo por combo', 'Martinez', 14, NULL, 1, 1, NULL, NULL, 0.00, '2026-01-02 22:00:00', '2025-12-18 18:39:59', '2025-12-18 14:41:52', '2025-12-18 11:41:52', 1),
(239, 23, 'Camila', 'Sanchez', 8, 9, NULL, 2, NULL, NULL, 12500.00, '2025-12-27 20:00:00', '2025-12-18 15:20:24', '2025-12-18 15:41:48', '2025-12-18 12:41:48', 1),
(240, 23, 'Camila', 'Sanchez', 11, 32, NULL, 1, NULL, NULL, 9000.00, '2025-12-19 21:00:00', '2025-12-18 19:24:45', '2025-12-18 19:24:45', NULL, 0),
(241, 21, 'Noelia', 'Martinezzzz', 8, 8, NULL, 2, NULL, NULL, 14500.00, '2025-12-27 22:00:00', '2025-12-18 15:28:06', '2025-12-18 15:28:24', '2025-12-18 12:28:24', 1),
(242, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 11500.00, '2025-12-26 21:00:00', '2025-12-18 16:32:20', '2025-12-18 17:53:22', '2025-12-18 14:53:22', 1),
(243, 23, 'Camila', 'Sanchez', 7, 18, NULL, 2, NULL, NULL, 15500.00, '2025-12-27 22:00:00', '2025-12-18 17:53:02', '2025-12-18 18:06:51', '2025-12-18 15:06:51', 1),
(244, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 11500.00, '2025-12-27 22:00:00', '2025-12-18 18:07:43', '2025-12-18 18:07:43', NULL, 0),
(245, 23, 'Camila', 'Sanchez', 8, 7, NULL, 2, NULL, NULL, 13000.00, '2025-12-25 13:00:00', '2025-12-18 18:15:10', '2025-12-18 18:15:10', NULL, 0),
(247, 21, 'Noelia', 'Martinezzzz', 8, 6, NULL, 2, NULL, NULL, 12000.00, '2025-12-25 19:00:00', '2025-12-18 18:24:45', '2025-12-18 18:25:19', '2025-12-18 15:25:19', 1),
(248, 18, 'Antonela', 'Roldan', 11, 31, NULL, 1, NULL, NULL, 10000.00, '2025-12-25 19:00:00', '2025-12-18 22:29:54', '2025-12-18 19:23:41', '2025-12-18 16:23:41', 1),
(249, 18, 'Antonela', 'Roldan', 14, NULL, 13, 1, NULL, NULL, 68000.00, '2025-12-25 21:00:00', '2025-12-18 22:30:15', '2025-12-18 18:40:14', '2025-12-18 15:40:14', 1),
(250, 18, 'Bloqueo por combo', 'Roldan', 14, NULL, 13, 1, NULL, NULL, 0.00, '2025-12-25 22:00:00', '2025-12-18 22:30:15', '2025-12-18 18:39:56', '2025-12-18 15:39:56', 1),
(251, 21, 'Noelia', 'Martinez', 10, 29, NULL, 1, NULL, NULL, 9000.00, '2025-12-25 20:00:00', '2025-12-18 22:33:29', '2025-12-18 18:34:24', '2025-12-18 15:34:24', 1),
(252, 23, 'Camila', 'Sanchez', 8, 8, NULL, 2, NULL, NULL, 14500.00, '2025-12-25 19:00:00', '2025-12-18 19:27:23', '2025-12-18 19:27:42', '2025-12-18 16:27:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio`
--

CREATE TABLE `negocio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `negocio`
--

INSERT INTO `negocio` (`id`, `nombre`, `direccion`, `telefono`, `email`, `logo_url`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Kore Estética Corporal', ' Juan Diaz de Solís 2766, San Fco', '3564-618278', 'susanaschavez92@gmail.com', 'logo.png', 'Centro de estética integral de servicios y productos corporales', '2025-08-14 23:50:36', '2025-08-14 23:50:36'),
(2, 'Juliette Nails', 'Suipacha 1153, San Fco', '3564- 627188', 'Julietagudino24@gmail.com', 'logo.png', 'Centro de belleza de uñas', '2025-08-14 23:50:36', '2025-08-14 23:50:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `id_usuario_destino` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  `url_destino` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `id_usuario_destino`, `id_negocio`, `mensaje`, `leida`, `url_destino`, `fecha_creacion`) VALUES
(1, 17, 1, 'Nueva reserva de Ari Roldan para \'Sesión intensiva en piernas\' el 19/11/2025 a las 10:00', 0, NULL, '2025-11-17 23:00:20'),
(3, 17, 1, 'Nueva reserva de Ari Roldan para \'Jornadas Antiarrugas\' el 20/11/2025 a las 10:00', 0, NULL, '2025-11-17 23:30:17'),
(5, 17, 1, 'Nueva reserva de Ari Roldan para \'PRUEBA COMBO\' el 21/11/2025 a las 16:00', 1, NULL, '2025-11-17 23:30:31'),
(7, 17, 1, 'Nueva reserva de noelia noelia para \'Jornadas Antiarrugas\' el 20/11/2025 a las 16:00', 0, NULL, '2025-11-17 23:45:58'),
(9, 17, 1, 'Nueva reserva de noelia noelia para \'Máscara LED\' el 21/11/2025 a las 17:00', 0, NULL, '2025-11-17 23:46:21'),
(11, 17, 1, 'Nueva reserva de Anto Roldan para \'Radiofrecuencia facial\' el 28/11/2025 a las 18:00', 0, NULL, '2025-11-18 00:14:04'),
(13, 17, 1, 'Nueva reserva de Ari Roldan para \'Presoterapia para piernas cansadas\' el 27/11/2025 a las 09:00', 0, NULL, '2025-11-18 22:22:24'),
(15, 17, 1, 'Nueva reserva de Anto Roldan para \'Sesión intensiva en piernas\' el 26/11/2025 a las 09:00', 0, NULL, '2025-11-18 22:49:50'),
(17, 17, 1, 'Nueva reserva de Anto Roldan para \'Sesión intensiva en piernas\' el 17/12/2025 a las 11:00', 0, NULL, '2025-12-11 20:48:13'),
(19, 17, 1, 'Nueva reserva de noelia noelia para \'Sesión intensiva en piernas\' el 19/12/2025 a las 09:00', 0, NULL, '2025-12-13 14:54:43'),
(21, 17, 1, 'Nueva reserva de noelia noelia para \'Sesión Intensiva de piernas\' el 16/12/2025 a las 16:00', 0, NULL, '2025-12-13 15:23:14'),
(23, 17, 1, 'Nueva reserva de noelia noelia para \'PRUEBA COMBO\' el 19/12/2025 a las 18:00', 0, NULL, '2025-12-13 15:26:14'),
(25, 17, 1, 'Nueva reserva de noelia noelia para \'Jornadas Antiarrugas\' el 19/12/2025 a las 16:00', 0, NULL, '2025-12-13 15:26:56'),
(27, 17, 1, 'Nueva reserva de noelia noelia para \'Sesión Booty Up\' el 30/12/2025 a las 08:00', 0, NULL, '2025-12-13 15:32:17'),
(29, 17, 1, 'Nueva reserva de noelia noelia para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00', 0, NULL, '2025-12-13 15:40:46'),
(31, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:43:04'),
(32, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:45:20'),
(33, 21, 1, 'Tu reserva para \'Sesión Booty Up\' el 30/12/2025 a las 08:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:45:35'),
(34, 21, 1, 'Tu reserva para \'Sesión Intensiva de piernas\' el 16/12/2025 a las 16:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:53:13'),
(37, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:59:04'),
(38, 21, 1, 'Tu reserva para \'Sesión Booty Up\' el 30/12/2025 a las 08:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:59:16'),
(39, 21, 1, 'Tu reserva para \'Sesión Intensiva de piernas\' el 16/12/2025 a las 16:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 19:59:51'),
(41, 21, 1, 'Tu reserva para \'PRUEBA COMBO\' el 19/12/2025 a las 18:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 20:08:47'),
(42, 21, 1, 'Tu reserva para \'PRUEBA COMBO\' el 19/12/2025 a las 18:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 20:10:01'),
(43, 17, 1, 'Nueva reserva de noelia noelia para \'Jornadas Antiarrugas\' el 29/12/2025 a las 16:00', 0, NULL, '2025-12-14 20:12:19'),
(45, 21, 1, 'Tu reserva para \'Jornadas Antiarrugas\' el 29/12/2025 a las 16:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 20:13:57'),
(46, 21, 1, 'Tu reserva para \'PRUEBA COMBO\' el 19/12/2025 a las 18:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 20:22:06'),
(47, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-14 21:25:14'),
(48, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 17:22:22'),
(49, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 31/12/2025 a las 10:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 17:22:29'),
(50, 21, 1, 'Tu reserva para \'Jornadas Antiarrugas\' el 19/12/2025 a las 16:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 17:29:17'),
(51, 21, 1, 'Tu reserva para \'Sesión intensiva en piernas\' el 19/12/2025 a las 09:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 17:29:36'),
(52, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 17/12/2025 a las 17:00', 0, NULL, '2025-12-15 17:34:08'),
(55, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 18/12/2025 a las 17:00', 0, NULL, '2025-12-15 17:41:06'),
(57, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Booty Up\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-15 17:41:19'),
(59, 17, 1, 'Nueva reserva de Antonela Roldan para \'Máscara LED\' el 30/12/2025 a las 18:00', 0, NULL, '2025-12-15 17:41:42'),
(64, 17, 1, 'Nueva reserva de noelia noelia para \'Presoterapia para piernas cansadas\' el 25/12/2025 a las 11:00', 0, NULL, '2025-12-15 17:54:21'),
(66, 17, 1, 'Nueva reserva de noelia Martinez para \'Radiofrecuencia corporal\' el 18/12/2025 a las 18:00', 0, NULL, '2025-12-15 22:11:04'),
(68, 21, 1, 'Tu reserva para \'Presoterapia para piernas cansadas\' el 25/12/2025 a las 11:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 22:15:14'),
(69, 21, 1, 'Tu reserva para \'Radiofrecuencia corporal\' el 18/12/2025 a las 18:00 ha sido cancelada por el estético. Puedes agendar una nueva cita.', 1, NULL, '2025-12-15 22:17:51'),
(70, 17, 1, 'Nueva reserva de Noelia Martinez para \'Presoterapia para piernas cansadas\' el 26/12/2025 a las 18:00', 0, NULL, '2025-12-15 22:27:04'),
(72, 17, 1, 'Nueva reserva de Noelia Martinez para \'Jornadas Antiarrugas\' el 30/12/2025 a las 10:00', 0, NULL, '2025-12-15 22:33:25'),
(74, 17, 1, 'Nueva reserva de Noelia Martinez para \'Jornadas Antiarrugas\' el 23/12/2025 a las 08:00', 0, NULL, '2025-12-15 22:36:16'),
(76, 13, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Jornadas Antiarrugas\' el 23/12/2025 a las 08:00.', 0, NULL, '2025-12-15 22:49:03'),
(77, 13, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Presoterapia para piernas cansadas\' el 26/12/2025 a las 18:00.', 0, NULL, '2025-12-15 22:50:37'),
(78, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 29/12/2025 a las 08:00', 0, NULL, '2025-12-15 22:52:26'),
(80, 17, 1, 'Nueva reserva de Noelia Martinez para \'Electrodos\' el 26/12/2025 a las 19:00', 0, NULL, '2025-12-15 22:52:35'),
(82, 17, 1, 'Nueva reserva de Noelia Martinez para \'Sesión intensiva en piernas\' el 30/12/2025 a las 16:00', 0, NULL, '2025-12-15 22:52:46'),
(84, 13, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Sesión intensiva en piernas\' el 30/12/2025 a las 16:00.', 0, NULL, '2025-12-15 22:53:00'),
(85, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Radiofrecuencia corporal\' el 29/12/2025 a las 08:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-15 23:01:47'),
(86, 17, 1, 'Nueva reserva de Noelia Martinez para \'Máscara LED\' el 25/12/2025 a las 19:00', 0, NULL, '2025-12-15 23:03:03'),
(88, 13, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Electrodos\' el 26/12/2025 a las 19:00.', 0, NULL, '2025-12-15 23:04:25'),
(89, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Máscara LED\' el 25/12/2025 a las 19:00.', 0, NULL, '2025-12-15 23:07:51'),
(90, 17, 1, 'Nueva reserva de Noelia Martinez para \'PRUEBA COMBO\' el 22/12/2025 a las 08:00', 0, NULL, '2025-12-15 23:11:29'),
(92, 17, 1, 'Nueva reserva de Noelia Martinez para \'Sesión Booty Up\' el 22/12/2025 a las 10:00', 0, NULL, '2025-12-15 23:11:39'),
(94, 17, 1, 'Nueva reserva de Noelia Martinez para \'Masajes relajantes espalda/brazos/cuello\' el 26/12/2025 a las 17:00', 0, NULL, '2025-12-15 23:11:51'),
(96, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Masajes relajantes espalda/brazos/cuello\' el 26/12/2025 a las 17:00.', 0, NULL, '2025-12-15 23:12:08'),
(97, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'PRUEBA COMBO\' el 22/12/2025 a las 08:00.', 0, NULL, '2025-12-15 23:16:55'),
(98, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 18/12/2025 a las 09:00', 0, NULL, '2025-12-15 23:22:00'),
(100, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión Booty Up\' el 22/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-15 23:23:08'),
(101, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia facial\' el 06/01/2026 a las 11:00', 0, NULL, '2025-12-15 23:39:37'),
(103, 17, 1, 'Nueva reserva de Noelia Martinez para \'Tratamiento facial dermapen\' el 07/01/2026 a las 17:00', 0, NULL, '2025-12-15 23:39:50'),
(105, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Tratamiento facial dermapen\' el 07/01/2026 a las 17:00.', 0, NULL, '2025-12-15 23:40:08'),
(106, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia facial\' el 06/01/2026 a las 11:00.', 0, NULL, '2025-12-15 23:45:44'),
(108, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 31/12/2025 a las 17:00', 0, NULL, '2025-12-16 00:41:39'),
(110, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 23/12/2025 a las 10:00', 0, NULL, '2025-12-16 00:45:26'),
(112, 17, 1, 'Nueva reserva de Noelia Martinez para \'Aparatología\' el 23/12/2025 a las 11:00', 0, NULL, '2025-12-16 00:45:35'),
(114, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 25/12/2025 a las 09:00', 0, NULL, '2025-12-16 00:45:43'),
(116, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Aparatología\' el 23/12/2025 a las 11:00.', 0, NULL, '2025-12-16 00:45:57'),
(119, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Radiofrecuencia corporal\' el 31/12/2025 a las 17:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-16 00:54:08'),
(120, 17, 1, 'Nueva reserva de Noelia Martinez para \'PRUEBA\' el 19/12/2025 a las 10:00', 0, NULL, '2025-12-16 02:18:51'),
(122, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia corporal\' el 25/12/2025 a las 09:00.', 0, NULL, '2025-12-16 02:20:13'),
(124, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA\' el 19/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-16 02:21:24'),
(125, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Radiofrecuencia corporal\' el 23/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-16 03:14:10'),
(126, 17, 1, 'Nueva reserva de Antonela Roldan para \'Reducción Intensiva\' el 31/12/2025 a las 08:00', 0, NULL, '2025-12-16 03:31:01'),
(129, 17, 1, 'Nueva reserva de Antonela Roldan para \'124567\' el 25/12/2025 a las 18:00', 0, NULL, '2025-12-16 17:00:27'),
(131, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Booty Up\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-16 21:42:18'),
(133, 17, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 31/12/2025 a las 10:00', 0, NULL, '2025-12-16 22:31:34'),
(135, 17, 1, 'Nueva reserva de Antonela Roldan para \'Masajes cuerpo completo\' el 26/12/2025 a las 08:00', 0, NULL, '2025-12-16 22:33:35'),
(137, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 26/12/2025 a las 10:00', 0, NULL, '2025-12-16 22:33:53'),
(145, 17, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia facial\' el 31/12/2025 a las 10:00', 0, NULL, '2025-12-17 17:18:20'),
(147, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Intensiva de piernas\' el 31/12/2025 a las 17:00', 0, NULL, '2025-12-17 17:19:05'),
(149, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 25/12/2025 a las 18:00', 0, NULL, '2025-12-17 17:25:33'),
(151, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-17 17:29:38'),
(153, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 25/12/2025 a las 10:00', 0, NULL, '2025-12-17 17:30:52'),
(155, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Booty Up\' el 31/12/2025 a las 08:00', 0, NULL, '2025-12-17 17:39:13'),
(157, 17, 1, 'Nueva reserva de Antonela Roldan para \'Vacumterapia\' el 19/12/2025 a las 16:00', 0, NULL, '2025-12-17 17:39:54'),
(159, 17, 1, 'Nueva reserva de Antonela Roldan para \'NUEVA PRUEBA\' el 18/12/2025 a las 16:00', 0, NULL, '2025-12-17 17:41:50'),
(161, 17, 1, 'Nueva reserva de Antonela Roldan para \'Electrodos + Masajes reductores\' el 23/12/2025 a las 10:00', 0, NULL, '2025-12-17 17:54:45'),
(164, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 19/12/2025 a las 18:00', 0, NULL, '2025-12-17 18:06:52'),
(166, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 18/12/2025 a las 18:00', 0, NULL, '2025-12-17 18:10:52'),
(168, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 26/12/2025 a las 10:00', 0, NULL, '2025-12-17 21:36:04'),
(169, 18, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 26/12/2025 a las 10:00', 1, NULL, '2025-12-17 21:36:04'),
(170, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Booty Up\' el 26/12/2025 a las 18:00', 0, NULL, '2025-12-17 21:36:33'),
(171, 18, 1, 'Nueva reserva de Antonela Roldan para \'Sesión Booty Up\' el 26/12/2025 a las 18:00', 1, NULL, '2025-12-17 21:36:33'),
(172, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-17 23:13:53'),
(173, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita Capping\' el 25/12/2025 a las 19:00', 0, NULL, '2025-12-17 23:19:30'),
(174, 23, 2, 'Nueva reserva de Camila Sanchez para \'Liso Capping\' el 31/12/2025 a las 10:00', 0, NULL, '2025-12-17 23:19:43'),
(175, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 19/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:51:15'),
(176, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión Booty Up\' el 26/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:51:23'),
(177, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Jornadas Antiarrugas\' el 18/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:51:50'),
(178, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 25/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:52:09'),
(179, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'NUEVA PRUEBA\' el 18/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:56:51'),
(180, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión intensiva en piernas\' el 26/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:57:02'),
(181, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Vacumterapia\' el 19/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-17 23:57:16'),
(182, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión Booty Up\' el 31/12/2025 a las 08:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 00:41:56'),
(183, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita Capping\' el 25/12/2025 a las 19:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 00:55:19'),
(184, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 25/12/2025 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 00:56:07'),
(185, 21, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita Capping\' el 26/12/2025 a las 11:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 00:57:22'),
(186, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 25/12/2025 a las 16:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 01:02:02'),
(187, 23, 2, 'Nueva reserva de Camila Sanchez para \'NUEVA PRUEBA\' el 25/12/2025 a las 17:00', 0, NULL, '2025-12-18 02:23:10'),
(188, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 25/12/2025 a las 18:00', 0, NULL, '2025-12-18 02:28:18'),
(189, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 25/12/2025 a las 18:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 02:29:06'),
(190, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'NUEVA PRUEBA\' el 25/12/2025 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 02:29:21'),
(191, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-18 02:41:50'),
(192, 23, 2, 'Nueva reserva de Camila Sanchez para \'Diseño Capping\' el 25/12/2025 a las 19:00', 0, NULL, '2025-12-18 02:42:07'),
(193, 23, 2, 'Nueva reserva de Noelia Martinez para \'Full Nail Art\' el 25/12/2025 a las 17:00', 0, NULL, '2025-12-18 02:43:14'),
(194, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 25/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 02:45:14'),
(195, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión Intensiva de piernas\' el 31/12/2025 a las 17:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 02:45:36'),
(196, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 30/12/2025 a las 08:00', 0, NULL, '2025-12-18 02:52:45'),
(197, 18, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 30/12/2025 a las 08:00', 1, NULL, '2025-12-18 02:52:45'),
(198, 17, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 30/12/2025 a las 11:00', 0, NULL, '2025-12-18 02:58:19'),
(199, 18, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 30/12/2025 a las 11:00', 1, NULL, '2025-12-18 02:58:20'),
(200, 17, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia corporal\' el 31/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:04:08'),
(201, 18, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia corporal\' el 31/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:04:08'),
(202, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 19/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:04:52'),
(203, 18, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 19/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:04:52'),
(204, 17, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 19/12/2025 a las 18:00', 0, NULL, '2025-12-18 03:05:32'),
(205, 18, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 19/12/2025 a las 18:00', 1, NULL, '2025-12-18 03:05:32'),
(206, 17, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 19/12/2025 a las 10:00', 0, NULL, '2025-12-18 03:13:13'),
(207, 18, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 19/12/2025 a las 10:00', 1, NULL, '2025-12-18 03:13:13'),
(208, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Aparatología\' el 19/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:18:51'),
(209, 17, 1, 'Nueva reserva de Antonela Roldan para \'Electrodos\' el 24/12/2025 a las 08:00', 0, NULL, '2025-12-18 03:19:17'),
(210, 18, 1, 'Nueva reserva de Antonela Roldan para \'Electrodos\' el 24/12/2025 a las 08:00', 1, NULL, '2025-12-18 03:19:17'),
(211, 17, 1, 'Nueva reserva de Antonela Roldan para \'NUEVA PRUEBA\' el 24/12/2025 a las 09:00', 0, NULL, '2025-12-18 03:19:56'),
(212, 18, 1, 'Nueva reserva de Antonela Roldan para \'NUEVA PRUEBA\' el 24/12/2025 a las 09:00', 1, NULL, '2025-12-18 03:19:56'),
(213, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 24/12/2025 a las 10:00', 0, NULL, '2025-12-18 03:20:07'),
(214, 18, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 24/12/2025 a las 10:00', 1, NULL, '2025-12-18 03:20:07'),
(215, 17, 1, 'Nueva reserva de Antonela Roldan para \'Tratamiento facial dermapen\' el 22/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:27:57'),
(216, 18, 1, 'Nueva reserva de Antonela Roldan para \'Tratamiento facial dermapen\' el 22/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:27:57'),
(217, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 22/12/2025 a las 18:00', 0, NULL, '2025-12-18 03:28:10'),
(218, 18, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 22/12/2025 a las 18:00', 1, NULL, '2025-12-18 03:28:10'),
(219, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 22/12/2025 a las 17:00', 0, NULL, '2025-12-18 03:29:06'),
(220, 18, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 22/12/2025 a las 17:00', 1, NULL, '2025-12-18 03:29:06'),
(221, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia corporal\' el 22/12/2025 a las 17:00.', 0, NULL, '2025-12-18 03:29:32'),
(222, 18, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia corporal\' el 22/12/2025 a las 17:00.', 1, NULL, '2025-12-18 03:29:32'),
(223, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 22/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:31:38'),
(224, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Tratamiento facial dermapen\' el 22/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:33:11'),
(225, 17, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 22/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:33:31'),
(226, 18, 1, 'Nueva reserva de Antonela Roldan para \'Aparatología\' el 22/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:33:31'),
(227, 17, 1, 'Nueva reserva de Antonela Roldan para \'Electrodos + Masajes reductores\' el 23/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:38:10'),
(228, 18, 1, 'Nueva reserva de Antonela Roldan para \'Electrodos + Masajes reductores\' el 23/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:38:10'),
(229, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 24/12/2025 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:39:24'),
(230, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Aparatología\' el 19/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:56:57'),
(231, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 19/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:57:01'),
(232, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 26/12/2025 a las 16:00', 0, NULL, '2025-12-18 03:58:11'),
(233, 18, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 26/12/2025 a las 16:00', 1, NULL, '2025-12-18 03:58:11'),
(234, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Jornadas Antiarrugas\' el 26/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 03:58:56'),
(235, 17, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 26/12/2025 a las 17:00', 0, NULL, '2025-12-18 03:59:17'),
(236, 18, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 26/12/2025 a las 17:00', 1, NULL, '2025-12-18 03:59:17'),
(237, 17, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia facial\' el 24/12/2025 a las 16:00', 0, NULL, '2025-12-18 04:00:59'),
(238, 18, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia facial\' el 24/12/2025 a las 16:00', 1, NULL, '2025-12-18 04:00:59'),
(239, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Radiofrecuencia facial\' el 24/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 04:20:36'),
(240, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Jornadas Antiarrugas\' el 30/12/2025 a las 08:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 04:22:05'),
(241, 17, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia corporal\' el 30/12/2025 a las 09:00', 0, NULL, '2025-12-18 04:22:36'),
(242, 18, 1, 'Nueva reserva de Antonela Roldan para \'Radiofrecuencia corporal\' el 30/12/2025 a las 09:00', 1, NULL, '2025-12-18 04:22:36'),
(243, 23, 2, 'Nueva reserva de Noelia Martinez para \'Full Nail Art\' el 25/12/2025 a las 08:00', 0, NULL, '2025-12-18 04:25:52'),
(244, 23, 2, 'El cliente Noelia Martinez ha cancelado su reserva para \'Full Nail Art\' el 25/12/2025 a las 08:00.', 0, NULL, '2025-12-18 04:26:16'),
(245, 23, 2, 'Nueva reserva de Noelia Martinez para \'Diseño\' el 25/12/2025 a las 08:00', 0, NULL, '2025-12-18 04:26:36'),
(246, 23, 2, 'Nueva reserva de Camila Sanchez para \'AAAAAAAAAAAAAA\' el 27/12/2025 a las 17:00', 0, NULL, '2025-12-18 04:29:23'),
(247, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 16:00', 0, NULL, '2025-12-18 04:45:57'),
(248, 18, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 16:00', 1, NULL, '2025-12-18 04:45:57'),
(249, 17, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 01/01/2026 a las 18:00', 0, NULL, '2025-12-18 04:46:15'),
(250, 18, 1, 'Nueva reserva de Antonela Roldan para \'Jornadas Antiarrugas\' el 01/01/2026 a las 18:00', 1, NULL, '2025-12-18 04:46:15'),
(251, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Jornadas Antiarrugas\' el 01/01/2026 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 04:47:00'),
(252, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión intensiva en piernas\' el 01/01/2026 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 04:47:04'),
(253, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 19:00', 0, NULL, '2025-12-18 04:47:32'),
(254, 18, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 19:00', 1, NULL, '2025-12-18 04:47:32'),
(255, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión intensiva en piernas\' el 01/01/2026 a las 19:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 14:27:32'),
(256, 17, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 01/01/2026 a las 19:00', 0, NULL, '2025-12-18 14:27:54'),
(257, 18, 1, 'Nueva reserva de Antonela Roldan para \'Presoterapia para piernas cansadas\' el 01/01/2026 a las 19:00', 1, NULL, '2025-12-18 14:27:54'),
(258, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 01/01/2026 a las 10:00', 0, NULL, '2025-12-18 14:28:39'),
(259, 18, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 01/01/2026 a las 10:00', 1, NULL, '2025-12-18 14:28:39'),
(260, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 01/01/2026 a las 10:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 14:29:28'),
(261, 17, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 11:00', 0, NULL, '2025-12-18 14:29:46'),
(262, 18, 1, 'Nueva reserva de Antonela Roldan para \'Sesión intensiva en piernas\' el 01/01/2026 a las 11:00', 1, NULL, '2025-12-18 14:29:46'),
(263, 17, 1, 'Nueva reserva de Noelia Martinez para \'Vacumterapia\' el 02/01/2026 a las 16:00', 0, NULL, '2025-12-18 14:39:41'),
(264, 18, 1, 'Nueva reserva de Noelia Martinez para \'Vacumterapia\' el 02/01/2026 a las 16:00', 1, NULL, '2025-12-18 14:39:41'),
(265, 17, 1, 'Nueva reserva de Noelia Martinez para \'Electrodos\' el 02/01/2026 a las 17:00', 0, NULL, '2025-12-18 14:39:49'),
(266, 18, 1, 'Nueva reserva de Noelia Martinez para \'Electrodos\' el 02/01/2026 a las 17:00', 1, NULL, '2025-12-18 14:39:49'),
(267, 17, 1, 'Nueva reserva de Noelia Martinez para \'Sesión Booty Up\' el 02/01/2026 a las 18:00', 0, NULL, '2025-12-18 14:39:59'),
(268, 18, 1, 'Nueva reserva de Noelia Martinez para \'Sesión Booty Up\' el 02/01/2026 a las 18:00', 1, NULL, '2025-12-18 14:39:59'),
(269, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Vacumterapia\' el 02/01/2026 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 14:41:42'),
(270, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Sesión Booty Up\' el 02/01/2026 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 14:41:52'),
(271, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 25/12/2025 a las 16:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 15:19:51'),
(272, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'AAAAAAAAAAAAAA\' el 27/12/2025 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 15:20:01'),
(273, 23, 2, 'Nueva reserva de Camila Sanchez para \'Full Nail Art\' el 27/12/2025 a las 17:00', 0, NULL, '2025-12-18 15:20:24'),
(274, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Diseño Capping\' el 25/12/2025 a las 19:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 15:24:14'),
(275, 17, 1, 'Nueva reserva de Camila Sanchez para \'Radiofrecuencia facial\' el 19/12/2025 a las 18:00', 0, NULL, '2025-12-18 15:24:45'),
(276, 18, 1, 'Nueva reserva de Camila Sanchez para \'Radiofrecuencia facial\' el 19/12/2025 a las 18:00', 1, NULL, '2025-12-18 15:24:45'),
(277, 21, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Full Nail Art\' el 25/12/2025 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 15:25:35'),
(278, 23, 2, 'Nueva reserva de Noelia Martinezzzz para \'Francesita\' el 27/12/2025 a las 19:00', 0, NULL, '2025-12-18 15:28:06'),
(279, 23, 2, 'El cliente Noelia Martinezzzz ha cancelado su reserva para \'Francesita\' el 27/12/2025 a las 19:00.', 0, NULL, '2025-12-18 15:28:24'),
(280, 23, 2, 'El cliente Noelia Martinezzzz ha cancelado su reserva para \'Diseño\' el 25/12/2025 a las 08:00.', 0, NULL, '2025-12-18 15:30:37'),
(281, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Full Nail Art\' el 27/12/2025 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 15:41:48'),
(282, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 26/12/2025 a las 18:00', 0, NULL, '2025-12-18 16:32:20'),
(283, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita Capping\' el 27/12/2025 a las 19:00', 0, NULL, '2025-12-18 17:53:02'),
(284, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 26/12/2025 a las 18:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 17:53:22'),
(285, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita Capping\' el 27/12/2025 a las 19:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 18:06:51'),
(286, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 27/12/2025 a las 19:00', 0, NULL, '2025-12-18 18:07:43'),
(287, 23, 2, 'Nueva reserva de Camila Sanchez para \'Diseño\' el 25/12/2025 a las 10:00', 0, NULL, '2025-12-18 18:15:10'),
(288, 23, 2, 'Nueva reserva de Camila Sanchez para \'NUEVA PRUEBA\' el 25/12/2025 a las 11:00', 0, NULL, '2025-12-18 18:15:44'),
(289, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'NUEVA PRUEBA\' el 25/12/2025 a las 11:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 18:16:58'),
(290, 23, 2, 'Nueva reserva de Noelia Martinezzzz para \'Liso\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-18 18:24:46'),
(291, 23, 2, 'El cliente Noelia Martinezzzz ha cancelado su reserva para \'Liso\' el 25/12/2025 a las 16:00.', 0, NULL, '2025-12-18 18:25:19'),
(292, 17, 1, 'Nueva reserva de Antonela Roldan para \'Tratamiento facial dermapen\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-18 18:29:54'),
(293, 18, 1, 'Nueva reserva de Antonela Roldan para \'Tratamiento facial dermapen\' el 25/12/2025 a las 16:00', 1, NULL, '2025-12-18 18:29:54'),
(294, 17, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 25/12/2025 a las 18:00', 0, NULL, '2025-12-18 18:30:16'),
(295, 18, 1, 'Nueva reserva de Antonela Roldan para \'PRUEBA COMBO\' el 25/12/2025 a las 18:00', 1, NULL, '2025-12-18 18:30:16'),
(296, 17, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 25/12/2025 a las 17:00', 0, NULL, '2025-12-18 18:33:30'),
(297, 18, 1, 'Nueva reserva de Noelia Martinez para \'Radiofrecuencia corporal\' el 25/12/2025 a las 17:00', 1, NULL, '2025-12-18 18:33:30'),
(298, 17, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia corporal\' el 25/12/2025 a las 17:00.', 0, NULL, '2025-12-18 18:34:24'),
(299, 18, 1, 'El cliente Noelia Martinez ha cancelado su reserva para \'Radiofrecuencia corporal\' el 25/12/2025 a las 17:00.', 1, NULL, '2025-12-18 18:34:24'),
(300, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 25/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 18:39:56'),
(301, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'PRUEBA COMBO\' el 25/12/2025 a las 18:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 18:40:14'),
(302, 18, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Tratamiento facial dermapen\' el 25/12/2025 a las 16:00. Por favor agenda una nueva cita.', 1, NULL, '2025-12-18 19:23:41'),
(303, 21, 1, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Electrodos\' el 02/01/2026 a las 17:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 19:26:23'),
(304, 23, 2, 'Nueva reserva de Camila Sanchez para \'Francesita\' el 25/12/2025 a las 16:00', 0, NULL, '2025-12-18 19:27:23'),
(305, 23, 2, 'Lo siento, por motivos de fuerza mayor debo cancelar tu cita de \'Francesita\' el 25/12/2025 a las 16:00. Por favor agenda una nueva cita.', 0, NULL, '2025-12-18 19:27:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `estado` varchar(20) DEFAULT 'completado',
  `transaccion_id` varchar(100) DEFAULT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `duracion_minutos` int(11) DEFAULT NULL,
  `id_negocio` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `presentacion` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `es_producto` tinyint(1) DEFAULT 0,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`, `categoria_id`, `duracion_minutos`, `id_negocio`, `marca`, `imagen_url`, `presentacion`, `descripcion`, `stock`, `es_producto`, `activo`, `created_at`, `updated_at`) VALUES
(6, 'Liso', 9000.00, 8, 50, 2, NULL, '', NULL, 'Esmaltado semipermanente color liso', 0, 0, 1, '2025-08-15 22:04:09', '2025-12-18 02:36:16'),
(7, 'Diseño', 10000.00, 8, 50, 2, NULL, '', NULL, 'Diseños artísticos en hasta 4 uñas', 0, 0, 1, '2025-08-15 22:04:09', '2025-12-18 02:36:16'),
(8, 'Francesita', 11500.00, 8, 50, 2, NULL, '', NULL, 'Diseño clásico francesa', 0, 0, 1, '2025-08-15 22:04:09', '2025-12-18 02:36:16'),
(9, 'Full Nail Art', 12500.00, 8, 50, 2, NULL, '', NULL, 'Diseño completo en todas las uñas', 0, 0, 1, '2025-08-15 22:04:09', '2025-12-18 02:36:16'),
(11, 'Liso Soft Gel', 11500.00, 9, 50, 2, NULL, '', NULL, 'Uñas esculpidas con gel suave color liso', 0, 0, 1, '2025-08-15 22:05:27', '2025-12-18 02:36:16'),
(12, 'Diseño Soft Gel', 13000.00, 9, 50, 2, NULL, '', NULL, 'Diseños artísticos en gel suave', 0, 0, 1, '2025-08-15 22:05:27', '2025-12-18 02:36:16'),
(13, 'Francesita Soft Gel', 14500.00, 9, 50, 2, NULL, '', NULL, 'Diseño francesa en gel suave', 0, 0, 1, '2025-08-15 22:05:27', '2025-12-18 02:36:16'),
(14, 'Full Nail Art Soft Gel', 15500.00, 9, 50, 2, NULL, '', NULL, 'Diseño completo en gel suave', 0, 0, 1, '2025-08-15 22:05:27', '2025-12-18 02:36:16'),
(16, 'Liso Capping', 10500.00, 7, 50, 2, NULL, '', NULL, 'Capping en poly gel color liso', 0, 0, 1, '2025-08-15 22:07:10', '2025-12-18 02:36:16'),
(17, 'Diseño Capping', 11500.00, 7, 50, 2, NULL, '', NULL, 'Diseños artísticos en poly gel', 0, 0, 1, '2025-08-15 22:07:10', '2025-12-18 02:36:16'),
(18, 'Francesita Capping', 12500.00, 7, 50, 2, NULL, '', NULL, 'Diseño francesa en poly gel', 0, 0, 1, '2025-08-15 22:07:10', '2025-12-18 02:36:16'),
(19, 'Full Nail Art Capping', 14500.00, 7, 50, 2, NULL, '', NULL, 'Diseño completo en poly gel', 0, 0, 1, '2025-08-15 22:07:10', '2025-12-18 02:36:16'),
(21, 'Liso Acrílicas', 10000.00, 6, 50, 2, NULL, '', NULL, 'Capping acrílico color liso', 0, 0, 1, '2025-08-15 22:07:49', '2025-12-18 02:36:16'),
(22, 'Diseño Acrílicas', 11500.00, 6, 50, 2, NULL, '', NULL, 'Diseños artísticos en acrílico', 0, 0, 1, '2025-08-15 22:07:49', '2025-12-18 02:36:16'),
(23, 'Francesita Acrílicas', 12500.00, 6, 50, 2, NULL, '', NULL, 'Diseño francesa en acrílico', 0, 0, 1, '2025-08-15 22:07:49', '2025-12-18 02:36:16'),
(24, 'Full Nail Art Acrílicas', 14000.00, 6, 50, 2, NULL, '', NULL, 'Diseño completo en acrílico', 0, 0, 1, '2025-08-15 22:07:49', '2025-12-18 02:36:16'),
(26, 'Presoterapia para piernas cansadas', 8000.00, 10, 45, 1, NULL, 'https://www.fisioterapiaheredia.com/wp-content/uploads/2018/10/clinica-salva-presoterapia-mv.jpg', NULL, 'Tratamiento para piernas cansadas', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(27, 'Masaje para embarazadas', 9000.00, 12, 45, 1, NULL, 'https://www.bodymindmasajes.com/wp-content/uploads/2022/01/embarazada.jpg', NULL, 'Masaje especial para embarazadas', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(28, 'Sesión intensiva en piernas', 12000.00, 10, 45, 1, NULL, 'https://www.cimformacion.com/blog/wp-content/uploads/2020/09/drenaje-linfatico.manual-manipulaciones.jpg', NULL, 'Tratamiento intensivo para piernas', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(29, 'Radiofrecuencia corporal', 9000.00, 10, 45, 1, NULL, 'https://www.shutterstock.com/image-photo/close-doctor-cosmetologist-using-ultrasound-600nw-2313195237.jpg', NULL, 'Tratamiento con radiofrecuencia corporal', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(30, 'Masaje de vacuum', 8500.00, 10, 45, 1, NULL, 'https://static.wixstatic.com/media/bd0161_1a8d8de65067460b9a657eeab032e674~mv2.jpg/v1/fill/w_286,h_173,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/bd0161_1a8d8de65067460b9a657eeab032e674~mv2.jpg', NULL, 'Masaje con técnica de vacuum', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(31, 'Tratamiento facial dermapen', 10000.00, 11, 45, 1, NULL, 'https://www.bienestetic.com/wp-content/uploads/dermapen-bienestetic.jpg', NULL, 'Tratamiento facial con dermapen', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(32, 'Radiofrecuencia facial', 9000.00, 11, 45, 1, NULL, 'https://www.cimformacion.com/blog/wp-content/uploads/2016/11/radiofrecuencia-estetica-min.jpg', NULL, 'Tratamiento facial con radiofrecuencia', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(33, 'Máscara LED', 8000.00, 11, 45, 1, NULL, 'https://www.quercusmedical.com/wp-content/uploads/2023/03/Mascara-LED.jpg', NULL, 'Terapia con luz LED', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 18:38:12'),
(34, 'Masajes reductores', 8000.00, 12, 45, 1, NULL, 'https://static.vecteezy.com/system/resources/thumbnails/073/298/639/small/indulge-in-a-relaxing-massage-session-with-a-professional-therapist-for-ultimate-comfort-photo.jpg', NULL, 'Masajes para reducción de medidas', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(35, 'Masajes relajantes espalda/brazos/cuello', 9000.00, 12, 45, 1, NULL, 'https://xoamspa.com/wp-content/uploads/2022/07/masaje-1024x480.jpeg', NULL, 'Masaje relajante superior', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(36, 'Masajes relajantes piernas/pies', 9000.00, 12, 45, 1, NULL, 'https://cdn.shopify.com/s/files/1/0761/9521/files/iStock-Foot_Massage_160115765_480x480.jpg?v=1661351359', NULL, 'Masaje relajante inferior', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(37, 'Masajes cuerpo completo', 12000.00, 12, 45, 1, NULL, 'https://depilprof.com/wp-content/uploads/2023/03/masaje_descontracturante.jpg', NULL, 'Masaje completo de cuerpo', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(38, 'Vacumterapia', 8000.00, 10, 45, 1, NULL, 'https://cifes.edu.co/image/files/7(10).jpg', NULL, 'Tratamiento con vacumterapia', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(39, 'Aparatología', 8500.00, 10, 45, 1, NULL, 'https://asomedes.com/wp-content/uploads/2021/05/m5-aparatologia-870x440.jpg', NULL, 'Tratamiento con aparatología especializada', 0, 0, 1, '2025-08-15 22:12:27', '2025-11-16 20:48:50'),
(43, 'Electrodos', 10000.00, 10, 45, 1, NULL, 'https://cosmetologas.com/wp-content/uploads/2025/07/aparatologia_ondas_rusas_02.jpg', NULL, '', 0, 0, 1, '2025-12-15 16:43:20', '2025-12-15 16:43:20'),
(44, 'Masajes de levantamiento', 11000.00, 12, 45, 1, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVCi1m0yKpvUdlmIz3hDcvnvCmggJenfNjMQ&s', NULL, 'Masaje para levantamiento de glúteos', 0, 0, 1, '2025-12-15 16:46:00', '2025-12-15 16:47:43'),
(60, 'NUEVA PRUEBA', 55000.00, 11, 45, 1, NULL, 'https://i.pinimg.com/236x/4e/05/4f/4e054f8ada4c864028501818e4dfddf5.jpg', NULL, 'pruebita', 0, 0, 1, '2025-12-18 14:33:19', '2025-12-18 14:34:55'),
(62, 'PRUEBA', 66666.00, 12, 45, 1, NULL, '', NULL, 'uyguy', 0, 0, 1, '2025-12-18 18:41:35', '2025-12-18 18:41:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL DEFAULT 'cliente',
  `id_negocio_admin` int(11) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `celular`, `foto_perfil`, `tipo`, `id_negocio_admin`, `contrasena`, `created_at`, `updated_at`) VALUES
(11, 'Brenda', 'Gomez', 'brengomez0907@gmail.com', '3564365301', NULL, 'cliente', 0, '$2y$10$IvNLAb3ExLp6iSb.4aF/sOLe021xxxtu.38/FGknPH9k5vBzsFnEi', '2025-09-27 03:14:01', '2025-09-30 00:05:15'),
(13, 'Joaquin', 'Santillan', 'Fabiansantillan2000@gmail.com', '3564594069', NULL, 'admin', 0, '$2y$10$x6bDuqN.WXd6D9GXntwWJuvUzz9vE9xDlpAWo8dVWZLocdrd3Bflu', '2025-09-30 00:11:34', '2025-09-30 00:33:04'),
(17, 'Fabian', 'Santillan', 'joaquinsantillan1@outlook.com', '3564594069', NULL, 'admin', 1, '$2y$10$.9ddPf7MO308x/I/CiUMluKXRN0TjoOBL4UDNt/IgGs1.nTeTt2kq', '2025-10-21 23:11:09', '2025-10-21 23:53:48'),
(18, 'Antonela', 'Roldan', 'roldanantonela92@gmail.com', '3564777799', 'fotos_perfil/usuario_18_1765581452.jpg', 'admin', 1, '$2y$10$m7HwO.2crOH7qbOQEs.TDe20HuINZF4HwqOra6hUWXqjrD7A/EV4i', '2025-10-23 00:57:19', '2025-12-18 14:39:02'),
(20, 'Ariannita', 'Roldan', 'ari@gmail.com', '3564225533', NULL, 'cliente', 0, '$2y$10$gfAjKwVnCDnccyb3KfZjSOqhWBraw/hkTK6WPg219igloCIQtWy.2', '2025-11-04 23:32:24', '2025-12-18 02:40:57'),
(21, 'Noelia', 'Martinez', 'noe@gmail.com', '3564777725', 'fotos_perfil/usuario_21_1765637653.png', 'cliente', 0, '$2y$10$SCNol6SMLJ02buMuqIB1QefsU6XM4LftzMDSWka0ZuB6h88/MQTP2', '2025-11-17 23:44:38', '2025-12-18 18:26:03'),
(23, 'Camila', 'Sanchez', 'camila@gmail.com', '3564777334', NULL, 'admin', 2, '$2y$10$FkeZF8Ep/ra0Yn2GhcJequ3MZloT.kSW42XdFw7.Xh1ILR5TlAUkK', '2025-12-17 22:21:37', '2025-12-18 14:44:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(20) DEFAULT 'completado',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citas_ibfk_1` (`id_usuario`);

--
-- Indices de la tabla `cita_servicios`
--
ALTER TABLE `cita_servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cita_id` (`cita_id`),
  ADD KEY `servicio_id` (`servicio_id`),
  ADD KEY `combo_id` (`combo_id`);

--
-- Indices de la tabla `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `combo_servicios`
--
ALTER TABLE `combo_servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `combo_id` (`combo_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `dias_feriados`
--
ALTER TABLE `dias_feriados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_negocio` (`id_negocio`),
  ADD KEY `id_combo` (`id_combo`),
  ADD KEY `historial_ibfk_4` (`id_cita`),
  ADD KEY `historial_ibfk_5` (`id_venta`);

--
-- Indices de la tabla `negocio`
--
ALTER TABLE `negocio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario_destino` (`id_usuario_destino`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `cita_id` (`cita_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cita_servicios`
--
ALTER TABLE `cita_servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `combos`
--
ALTER TABLE `combos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `combo_servicios`
--
ALTER TABLE `combo_servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dias_feriados`
--
ALTER TABLE `dias_feriados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT de la tabla `negocio`
--
ALTER TABLE `negocio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `cita_servicios`
--
ALTER TABLE `cita_servicios`
  ADD CONSTRAINT `cita_servicios_ibfk_1` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`),
  ADD CONSTRAINT `cita_servicios_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  ADD CONSTRAINT `cita_servicios_ibfk_3` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`);

--
-- Filtros para la tabla `combos`
--
ALTER TABLE `combos`
  ADD CONSTRAINT `combos_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);

--
-- Filtros para la tabla `combo_servicios`
--
ALTER TABLE `combo_servicios`
  ADD CONSTRAINT `combo_servicios_ibfk_1` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`),
  ADD CONSTRAINT `combo_servicios_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `configuracion_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);

--
-- Filtros para la tabla `dias_feriados`
--
ALTER TABLE `dias_feriados`
  ADD CONSTRAINT `dias_feriados_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `historial_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id`),
  ADD CONSTRAINT `historial_ibfk_4` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id`),
  ADD CONSTRAINT `historial_ibfk_5` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario_destino`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_negocio`) REFERENCES `negocio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
