-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-09-2025 a las 05:17:39
-- Versión del servidor: 8.4.3
-- Versión de PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ysji_crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add imagen producto', 6, 'add_imagenproducto'),
(22, 'Can change imagen producto', 6, 'change_imagenproducto'),
(23, 'Can delete imagen producto', 6, 'delete_imagenproducto'),
(24, 'Can view imagen producto', 6, 'view_imagenproducto'),
(25, 'Can add Categoría', 7, 'add_categoria'),
(26, 'Can change Categoría', 7, 'change_categoria'),
(27, 'Can delete Categoría', 7, 'delete_categoria'),
(28, 'Can view Categoría', 7, 'view_categoria'),
(29, 'Can add marca', 8, 'add_marca'),
(30, 'Can change marca', 8, 'change_marca'),
(31, 'Can delete marca', 8, 'delete_marca'),
(32, 'Can view marca', 8, 'view_marca'),
(33, 'Can add proveedor', 9, 'add_proveedor'),
(34, 'Can change proveedor', 9, 'change_proveedor'),
(35, 'Can delete proveedor', 9, 'delete_proveedor'),
(36, 'Can view proveedor', 9, 'view_proveedor'),
(37, 'Can add usuario', 10, 'add_usuario'),
(38, 'Can change usuario', 10, 'change_usuario'),
(39, 'Can delete usuario', 10, 'delete_usuario'),
(40, 'Can view usuario', 10, 'view_usuario'),
(41, 'Can add producto', 11, 'add_producto'),
(42, 'Can change producto', 11, 'change_producto'),
(43, 'Can delete producto', 11, 'delete_producto'),
(44, 'Can view producto', 11, 'view_producto'),
(45, 'Can add pedido', 12, 'add_pedido'),
(46, 'Can change pedido', 12, 'change_pedido'),
(47, 'Can delete pedido', 12, 'delete_pedido'),
(48, 'Can view pedido', 12, 'view_pedido'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session'),
(53, 'Can add blog', 14, 'add_blog'),
(54, 'Can change blog', 14, 'change_blog'),
(55, 'Can delete blog', 14, 'delete_blog'),
(56, 'Can view blog', 14, 'view_blog'),
(57, 'Can add mensaje', 15, 'add_mensaje'),
(58, 'Can change mensaje', 15, 'change_mensaje'),
(59, 'Can delete mensaje', 15, 'delete_mensaje'),
(60, 'Can view mensaje', 15, 'view_mensaje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_blog`
--

CREATE TABLE `core_blog` (
  `id` int NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `cuerpo` text NOT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `core_blog`
--

INSERT INTO `core_blog` (`id`, `titulo`, `cuerpo`, `foto`) VALUES
(5, 'Color del Año 2025', 'La espera ha terminado oficialmente: el Color del Año 2025 de Pantone es Mocha Mousse, un marrón achocolatado, decadente y acogedor. Ampliando el legado de la elección de 2024, Peach Fuzz, y su énfasis en la tactilidad, Mocha Mousse sirve un festín multisensorial para los cinco sentidos.\r\n\"Para el Color Pantone del Año 2025, buscamos un tono marrón suave cuya riqueza inherente y calidez sensorial y reconfortante se extienden más allá de nuestro deseo de comodidad y la indulgencia de los placeres simples que podemos regalar y compartir con los demás.\"\r\nLaurie Pressman\r\nVicepresidente del Pantone Color Institute', 'blogs/b1_64Av0eP.jpg'),
(12, 'Un complemento este 2025: el cinturón', 'Cuando comience la temporada de festivales, este accesorio se convertirá en la estrella de todos los estilismos. Por ejemplo, Miu Miu recrea en versión ‘glam’ el icónico ‘look’ de Kate Moss en Canterbury.\r\nAdemás, este complemento varía en función de los diferentes estilos. Las cadenas y los abalorios, como en el caso de Isabel Marant, también serán los grandes favoritos.', 'blogs/b2_ZHdMyU1.jpg'),
(13, 'Collar de perlas', 'Collar con múltiples hileras de perlas, de Zara. \r\nEs una de las tendencias top, con origen en la estética Old Money, que ha enamorado a las influencers para darle un extra de elegancia y lujo a todo tipo de looks.\r\nEsta tendencia se puede llevar sola para conseguir una estética más limpia, sobretodo cuando se quiera ir más sencilla, o combinada con cualquiera de las otras tendencias para aportarle al resultado un estilo más casual y cool.', 'blogs/pe.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_mensaje`
--

CREATE TABLE `core_mensaje` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `core_mensaje`
--

INSERT INTO `core_mensaje` (`id`, `nombre`, `correo`, `telefono`, `mensaje`, `fecha`) VALUES
(9, 'Donkan', 'dhdz12@gmail.com', '3432345456', 'Lo que pasa es que ultimamente Ysji esta recibiendo grandes actualizaciones y me encanta este sitio 100% recomendado', '2025-09-28 05:12:00.974083');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

CREATE TABLE `core_producto` (
  `id` bigint NOT NULL,
  `codigo_producto` varchar(50) DEFAULT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `descripcion_producto` longtext,
  `valor_producto` decimal(10,2) DEFAULT NULL,
  `cantidad_producto` int DEFAULT NULL,
  `categoria_producto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuario`
--

CREATE TABLE `core_usuario` (
  `id` bigint NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `clave` varchar(16) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `perfil` varchar(10) NOT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'core', 'blog'),
(7, 'core', 'categoria'),
(6, 'core', 'imagenproducto'),
(8, 'core', 'marca'),
(15, 'core', 'mensaje'),
(12, 'core', 'pedido'),
(11, 'core', 'producto'),
(9, 'core', 'proveedor'),
(10, 'core', 'usuario'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-09-17 23:47:48.328270'),
(2, 'auth', '0001_initial', '2025-09-17 23:47:49.356234'),
(3, 'admin', '0001_initial', '2025-09-17 23:47:49.667694'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-09-17 23:47:49.678224'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-09-17 23:47:49.690655'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-09-17 23:47:49.854944'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-09-17 23:47:49.995489'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-09-17 23:47:50.058652'),
(9, 'auth', '0004_alter_user_username_opts', '2025-09-17 23:47:50.072450'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-09-17 23:47:50.196704'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-09-17 23:47:50.200871'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-09-17 23:47:50.212751'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-09-17 23:47:50.355990'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-09-17 23:47:50.520465'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-09-17 23:47:50.570424'),
(16, 'auth', '0011_update_proxy_permissions', '2025-09-17 23:47:50.597744'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-09-17 23:47:50.731074'),
(18, 'core', '0001_initial', '2025-09-17 23:47:50.810688'),
(19, 'sessions', '0001_initial', '2025-09-18 00:58:12.782901'),
(20, 'core', '0002_mensaje', '2025-09-28 03:34:04.058966');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3o2x3x5st346g6639ihcjl1w25iq1sv9', '.eJx9zMsKAjEMheFXCVkXqQ5u5g3cuZ8MpUzjELENNC0I4rur4GXn8vwcvht267GKBkk4bgf33VUvOGJMWQo6DJnN4sr2bNNEGMLZtHwqoQPvYLd3QHgosohCYjA2Ieren4YCfJWmppvXl5BwdvDfOVZNfWkKlVexVmPSNxIzl8Y_acb7AwzXQc4:1uEcHv:SRAaV7P7nGmrkyqC4pTUwonoqK_wpzd1MROYoU0siko', '2025-05-26 23:10:23.425054'),
('4bjgq70ckt1uak8w9eez0rtmy7hv452t', '.eJx9zMsKAjEMheFXCVkXqQ5u5g3cuZ8MpUzjELENNC0I4rur4GXn8vwcvht267GKBkk4bgf33VUvOGJMWQo6DJnN4sr2bNNEGMLZtHwqoQPvYLd3QHgosohCYjA2Ieren4YCfJWmppvXl5BwdvDfOVZNfWkKlVexVmPSNxIzl8Y_acb7AwzXQc4:1uF2lp:B5xDN6Rza-oBWmPGTY5CeX-nxbN2qCtv7i-ZQg_jUyI', '2025-05-28 03:27:01.383369'),
('b43dmypyz5xdxl78w0c9gw09zwb2y6d7', '.eJw9ykEKwkAMRuGrhH8dihTc9BTumzIMTigjtoFkBgTx7tVFXb6P90aPnr1aqgXTyP90e2I6C4y0aUReNb46z4KUHmH7qQKmC9N4ZRLc3Eq_NyPXtUbzXIz0VZtF3nRvOvxugWBZ8DkAZG8sGw:1u6s3m:8EiimOAN4uZqhMMjsvNkjlKfrMt00h8ZjFESnmf6ddk', '2025-05-05 14:23:46.135586'),
('shql910ehohasdtq9nvvw1bmuhwqh6vq', 'eyJ1c3VhcmlvX2lkIjoxMywidXN1YXJpb19yb2wiOiJhZG1pbiJ9:1uHsNv:_gpQXQEHbXp_PB0TSkyS3U069cDICptKjkfSRVEYiXE', '2025-06-04 22:58:03.040683'),
('npumnpavzze1zg2u0jg2bedqf59tuf1r', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUchMrE5UQ0kX5OUC5xJTczDylWgBjuxiR:1uSJQm:lWY4h3QJYkb5y4Rba8IjIJaVt-qmIrV3uNnLFDpc2_c', '2025-07-03 17:52:08.325793'),
('drh2rwfyo2bg2kf4n82tn5t2quey3001', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUchMrE5UQ0kX5OUC5xJTczDylWgBjuxiR:1uSJRw:ZfD-SMC5KG6KLusm73jrLLRGIFknRR8-E_k2TWnUyXw', '2025-07-03 17:53:20.612107'),
('g9feanbj5f9ybh15liv5oebw3w4kfvwq', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uSacJ:CdySKM96pZtLmq6L9o4AZbkn7z9Xw6co4nNUuONJSZA', '2025-07-04 12:13:11.325225'),
('892yil6lpmcdsy60m4b0adelce6y3f78', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uSaet:T4B7AXIzoT5o-Cpuxy-s6h5D18lRhDbqoddw2jVBaRg', '2025-07-04 12:15:51.345763'),
('ogokvk8pu81az0dr0wv9kkc8hcjpi07p', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uSkRk:FFqfVLIWxQP-dADzeeuACNJH28jgJwKfWCaL_aq0VGw', '2025-07-04 22:42:56.425692'),
('5qggcnlp20ukunc364rnzlit7niiddkc', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uUmZS:eaJqQ36GnDpb7gOjdEserjw9b0-4w4VXR2ZXdZC4W5M', '2025-07-10 13:23:18.864375'),
('k2iflck5svo83m51u1jawraaljelxcfy', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uUn6J:TjLPLmDLEA5pNdqXImTuSYZifLZgAL5f0SleBKMO4cs', '2025-07-10 13:57:15.084889'),
('7mnz2fj5avvzl1hnzvxz65smr42sgqcf', '.eJyrViotLk0sysyPz0xRsjLXgXPz8nOTilKVrJQcizIT8xIV3IsS81JSlRAKivJzgLJQnlItAMbaGiE:1uUyf7:vllX1og_cmNctXSRwkjhzNgOROoKphaH3t3vW9Q-qJY', '2025-07-11 02:17:57.216830'),
('1oqylgs4ziqlekbayh57jxl1bj53zutg', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWI3B:gcGp-pnBSvJuyA555-Y-4BsiB2nLe6lbUGKWKgtvsmY', '2025-07-14 17:12:13.272503'),
('7ltecuy3vsqv7jgdedxkozxxxhnjttys', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWMpN:n-l0kgckfwJhTa8tDxwDEWtbvBcgK4Z0tkW8dKsD3RU', '2025-07-14 22:18:17.207661'),
('dp2j9hsimqicgtj77ze1j6lhc13tu9ka', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWN5l:9HM1BJYrwXquKRD2_IyFg6JJvwZuZ1G2wgOSyQAXoM4', '2025-07-14 22:35:13.130834'),
('d19a57lpz4zpwmj3bu7zyzxudjlppfzx', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWNRZ:8dsoM6HLk9sb-G8WfyNndLMaE7JoWlZbNFLx7t45DSg', '2025-07-14 22:57:45.078641'),
('h81utj683epz71pjqph7j47ma9xwut09', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWNYq:knThL3RBEKgmvtuuuYA1TXaV8SaV-ukLks40LzpffZU', '2025-07-14 23:05:16.504819'),
('ddcb5ys17g3h1vzw3siehz8a4snd1uge', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uWNcu:YfgvOnJPpYnxvVrq8jMcBSSmqJA4yNRyLy2ktCwXwYU', '2025-07-14 23:09:28.070975'),
('gxvq8riw6n1gywkr65bo6nmo9u901a5r', '.eJxFjL0KAjEQhF8lTB1EBC3uCWwE-8sRVrNI5JKF7AVOxHd3LdRu5pufJ7p2alliThgO_merlEtjDDjydZHmTvQg_OMms2WUSq5GY2FVurEaG8eAGO8q9UsDvNt6t9t7F3Bukro9Op6zjSmZWvMiSoXrwptPOSBgmvB6A9IYNYM:1uWweq:NEpDOLFBNgkTl7ybpPiiEDqGBacL2prvYzjthv7KMt0', '2025-07-16 12:33:48.140609'),
('ci3kvapn84w84rl8r31re2rfk1s38y8r', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1umGPL:JSd3QKYQTVOBezum_FVYtWmmpAzsheINQa7iXkWQpgE', '2025-08-27 18:41:07.228827'),
('edu0yhxl2x5x1vmkb6rxqiawhyp8niyv', '.eJztz8EKwjAMBuBXKTkXGaIedhe8CN7XUeIaRmVdJO1AEd_dTlCv4sFTb8mf8JHcYIoTimfrHdQb_W5HDkchqGFHXWJRe7wifMbCQ56hC37MqQ0UI_YUc9Y0Bqw9RR5fqQGtKq2Wa60MHITdlEUl1PuYBB0ruvjEEQONiRbztgEDrVZfSjT4fMYv0KqaV7Yi-UEc1Fm4o4iSxbl-6oUpTGEK83-mhfsDBnjOgg:1umKxD:51Go4Xmjx6RbL7rDxdGf27afiJcqlCTTvrQ5c4Ab8eE', '2025-08-27 23:32:23.562331'),
('xh678amq8yujufkzmlrwt6o5rfue8tit', '.eJytjrEKAjEQRH8lbB3kELW4XrAR7C9HWC-LRC5Z2dyBIv67G0Gt7OxmZ2Yfc4e5zCiRfQzQbuznzJyOQtDCjoaJxezxhvCNhUfNMKSY1fWJSsETFfW6zoH358L57TqwprFmubbGwUE4zEo0NEZ9xqDqGicumChPtKhlBw56a36BVk2tbEV0Fo7mIjxQQVFi1S_63zE9PJ4jhmK9:1umL14:leo5Cdeps5YBmkZV8QZ2bR5ZIiS5OJRnjtTUw-ByGAQ', '2025-08-27 23:36:22.856200'),
('btfswelx6lwqxkux5g1vjbtunql3obqe', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1umL39:DCmiz1tCsOmjOxeHvbzD043g0gQGAcACIMPuAosZq24', '2025-08-27 23:38:31.244049'),
('ydadv5ts6byrqr1b59hvktf1kksgq7ma', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uyIlv:PYzkAGnbW6KdrmpFY_7szifeA7Hs2Lg6qJaNSajMwtk', '2025-09-29 23:38:11.414827'),
('pdvrrd8fdqhpmvudhh4yfnclf8xkjn1i', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1uzJmu:nn5m7G7T_sCqsKRSCFBKpubO2gG5BIHi_lfNHmfPAME', '2025-10-02 18:55:24.960730'),
('uvv930esdmfrmnbj0cb0jqjwmcnj2rwp', '.eJyrViotLk0sysyPz0xRsjI00IHz8_Jzk4pSlayUXHMz81JzlRAyRfk5QGEoT6kWACldF-k:1uzLPD:E53h-9EnTnm-98h_EVln7zd4loEbiiyGDSggIXiZZ14', '2025-10-02 20:39:03.051934'),
('vw1zdf7n08b51jl2egyml0g4h8am5upd', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1v2imk:lsDm941bzKqzCZJyP9OUgBeuOoTAcbkhd6tiNcIZuMU', '2025-10-12 04:13:18.368355'),
('t23b75r8l8sx27kdev0sa0xb07mwjeiz', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1v2jYc:MXWCW4NXdoEuYBNaMzg2kkcIgQihPsMmFiLUd0svk4o', '2025-10-12 05:02:46.499833'),
('bmlyx7tgsvh1oe85hfmu4xsataiydutl', '.eJyrViotLk0sysyPz0xRsjLTgXPz8nOTilKVrJQ8UpNL8osUfBMrE5UQ0kX5OUC5xJTczDylWgBgOxhx:1v2jhp:fYwfybFs3dzd90YPbSOClV187eb0X6GTNA78f4nI6Ow', '2025-10-12 05:12:17.589126');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenproducto`
--

CREATE TABLE `imagenproducto` (
  `id` int NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `producto_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `imagenproducto`
--

INSERT INTO `imagenproducto` (`id`, `imagen`, `producto_id`) VALUES
(15, 'productos/1a_C5CeaM8.jpg', 22),
(16, 'productos/1b_WdJZLfj.jpg', 22),
(17, 'productos/1c_I4PYWr3.jpg', 22),
(18, 'productos/1d_MQjZCx5.jpg', 22),
(19, 'productos/1e_tTK8LDs.jpg', 22),
(20, 'productos/1f_rSfjgCD.jpg', 22),
(21, 'productos/1g_7V2Ll5Y.jpg', 22),
(22, 'productos/1h_sStBe2b.jpg', 22),
(37, 'productos/2a_LHPwCvx.jpg', 24),
(38, 'productos/2b_PmPLXra.jpg', 24),
(39, 'productos/2c_KtgIIe4.jpg', 24),
(40, 'productos/2d_2gTLtCE.jpg', 24),
(41, 'productos/2e_lQRajW9.jpg', 24),
(42, 'productos/3a_xKqehRx.jpg', 25),
(43, 'productos/3b.jpg', 25),
(44, 'productos/3c.jpg', 25),
(45, 'productos/3d.jpg', 25),
(46, 'productos/3e.jpg', 25),
(47, 'productos/3f.jpg', 25),
(48, 'productos/3g.jpg', 25),
(49, 'productos/3h.jpg', 25),
(50, 'productos/4a_DKRQj89.jpg', 26),
(51, 'productos/4b.jpg', 26),
(52, 'productos/4c.jpg', 26),
(53, 'productos/4d.jpg', 26),
(54, 'productos/5a_3xPefn0.jpg', 27),
(55, 'productos/5b.jpg', 27),
(56, 'productos/5c.jpg', 27),
(57, 'productos/5d.jpg', 27),
(58, 'productos/5e.jpg', 27),
(59, 'productos/5f.jpg', 27),
(60, 'productos/61.jpg', 28),
(61, 'productos/6b.jpg', 28),
(62, 'productos/6c.jpg', 28),
(63, 'productos/6d.jpg', 28),
(64, 'productos/6e.jpg', 28),
(65, 'productos/6f.jpg', 28),
(66, 'productos/6g.jpg', 28),
(67, 'productos/6h.jpg', 28),
(68, 'productos/7a.jpg', 29),
(69, 'productos/7b.jpg', 29),
(70, 'productos/7c.jpg', 29),
(71, 'productos/7d.jpg', 29),
(72, 'productos/8a.jpg', 30),
(73, 'productos/8b.jpg', 30),
(74, 'productos/8c.jpg', 30),
(75, 'productos/8d.jpg', 30),
(76, 'productos/8e.jpg', 30),
(77, 'productos/8f.jpg', 30),
(78, 'productos/9a.jpg', 31),
(79, 'productos/9b.jpg', 31),
(80, 'productos/9c.jpg', 31),
(81, 'productos/10a.jpg', 32),
(82, 'productos/10b.jpg', 32),
(83, 'productos/10c.jpg', 32),
(84, 'productos/10d.jpg', 32),
(85, 'productos/11a.png', 34),
(86, 'productos/11b.png', 34),
(87, 'productos/11c.png', 34),
(88, 'productos/12a.jpg', 35),
(89, 'productos/12b.jpg', 35),
(90, 'productos/12c.jpg', 35),
(91, 'productos/12d.jpg', 35),
(92, 'productos/12e.jpg', 35),
(93, 'productos/12f.jpg', 35),
(94, 'productos/12g.png', 35),
(105, 'productos/14a_gCU5wtX.jpg', 37),
(106, 'productos/14b_dsUvIgY.jpg', 37),
(107, 'productos/14c_x6STJjo.jpg', 37),
(108, 'productos/13a.avif', 38),
(109, 'productos/13b.avif', 38),
(110, 'productos/13c.avif', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`) VALUES
(2, 'zara'),
(3, 'Bershka'),
(4, 'Pandora'),
(5, 'Nike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `productos` json NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `productos`, `estado`, `fecha`, `valor_total`) VALUES
(13, 7, '[{\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/4a_DKRQj89.jpg\", \"nombre\": \"Vestido Mini  Satinado\", \"precio\": 150000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 1}]', 'Enviado', '2025-06-27 07:14:30', NULL),
(14, 29, '[{\"imagen\": \"/media/productos/1a_C5CeaM8.jpg\", \"nombre\": \"Abrigo Largo\", \"precio\": 699000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 1}]', 'Cancelado', '2025-06-27 07:19:59', NULL),
(16, 30, '[{\"imagen\": \"/media/productos/13a.avif\", \"nombre\": \"Collar de plata y perlas\", \"precio\": 120000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/7a.jpg\", \"nombre\": \"Polo Bordado Print\", \"precio\": 149900, \"cantidad\": 1}]', 'Cancelado', '2025-06-27 16:40:36', NULL),
(17, 10, '[{\"imagen\": \"/media/productos/1a_C5CeaM8.jpg\", \"nombre\": \"Abrigo Largo\", \"precio\": 699000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 1}]', 'Cancelado', '2025-07-01 02:36:03', NULL),
(18, 10, '[{\"imagen\": \"/media/productos/61.jpg\", \"nombre\": \"Saco Cremallera Cuello\", \"precio\": 110000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/7a.jpg\", \"nombre\": \"Polo Bordado Print\", \"precio\": 149900, \"cantidad\": 1}, {\"imagen\": \"/media/productos/11a.png\", \"nombre\": \"Collar Estrella Polar\", \"precio\": 380000, \"cantidad\": 2}]', 'Enviado', '2025-07-01 02:39:42', NULL),
(19, 32, '[{\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 2}, {\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 2}, {\"imagen\": \"/media/productos/4a_DKRQj89.jpg\", \"nombre\": \"Vestido Mini  Satinado\", \"precio\": 150000, \"cantidad\": 1}]', 'Pendiente', '2025-08-12 20:22:04', NULL),
(20, 32, '[{\"imagen\": \"/media/productos/4a_DKRQj89.jpg\", \"nombre\": \"Vestido Mini  Satinado\", \"precio\": 150000, \"cantidad\": 1}]', 'Pendiente', '2025-08-12 20:26:16', NULL),
(21, 32, '[{\"imagen\": \"/media/productos/4a_DKRQj89.jpg\", \"nombre\": \"Vestido Mini  Satinado\", \"precio\": 150000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/1a_C5CeaM8.jpg\", \"nombre\": \"Abrigo Largo\", \"precio\": 699000, \"cantidad\": 1}]', 'Pendiente', '2025-08-12 20:29:23', NULL),
(23, 32, '[{\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 2}, {\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 1}]', 'Pendiente', '2025-09-11 18:48:38', NULL),
(26, 32, '[{\"imagen\": \"/media/productos/3a_xKqehRx.jpg\", \"nombre\": \"Pantalón Flare\", \"precio\": 200000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/2a_LHPwCvx.jpg\", \"nombre\": \"Chaqueta Volantes\", \"precio\": 80000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/4a_DKRQj89.jpg\", \"nombre\": \"Vestido Mini  Satinado\", \"precio\": 150000, \"cantidad\": 1}]', 'Pendiente', '2025-09-16 04:39:21', NULL),
(33, 59, '[{\"imagen\": \"/media/productos/7a.jpg\", \"nombre\": \"Polo Bordado Print\", \"precio\": 149900, \"cantidad\": 1}, {\"imagen\": \"/media/productos/61.jpg\", \"nombre\": \"Saco Cremallera Cuello\", \"precio\": 110000, \"cantidad\": 1}, {\"imagen\": \"/media/productos/5a_3xPefn0.jpg\", \"nombre\": \"Bolso Shopper\", \"precio\": 190000, \"cantidad\": 1}]', 'Pendiente', '2025-09-16 16:36:19', NULL),
(34, 10, '[{\"imagen\": \"/media/productos/61.jpg\", \"nombre\": \"Saco Cremallera Cuello\", \"precio\": 110000, \"cantidad\": 1}]', 'Entregado', '2025-09-19 01:39:53', NULL),
(35, 7, '[{\"imagen\": \"/media/productos/9a.jpg\", \"nombre\": \"Falda Mini Lentejuelas\", \"precio\": 199900, \"cantidad\": 21}]', 'Entregado', '2025-09-19 07:12:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `codigo_producto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_producto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion_producto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `valor_producto` float(10,2) DEFAULT NULL,
  `cantidad_producto` int DEFAULT NULL,
  `categoria_producto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen_producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tallas_disponibles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `colores_disponibles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marca_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo_producto`, `nombre_producto`, `descripcion_producto`, `valor_producto`, `cantidad_producto`, `categoria_producto`, `imagen_producto`, `tallas_disponibles`, `colores_disponibles`, `marca_id`, `proveedor_id`) VALUES
(22, '01001', 'Abrigo Largo', 'Abrigo confeccionado con lana. \r\nCuello solapa y manga larga. Bolsillos delanteros de vivo. \r\nBajo con abertura en espalda. Cierre con cinturón del mismo tejido.\r\n\r\nEXTERIOR\r\n50% lana\r\n30% poliéster\r\n10% acrílico\r\n5% otras fibras\r\n5% poliamida\r\n\r\nFORRO\r\n100% acetato\r\nQue contiene al menos:\r\n\r\nEXTERIOR\r\n5% poliamida reciclada certificada RCS\r\n50% lana reciclada certificada RCS\r\n30% poliéster reciclado certificado RCS\r\n10% acrílico reciclado certificado RCS\r\n\r\nMATERIALES CERTIFICADOS\r\nPOLIAMIDA RECICLADA CERTIFICADA RCS\r\nEsta fibra se fabrica a partir de residuos de poliamida y otros productos de desecho, como las redes de pesca. Transformar los residuos en nuevos materiales ayuda a limitar la extracción de materias primas. Está certificada conforme al Recycled Claim Standard  (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nLANA RECICLADA CERTIFICADA RCS\r\nEste material se fabrica a partir de residuos textiles reciclados y prendas usadas. Transformar los residuos en nuevos materiales ayuda a limitar la extracción de materias primas. Cuenta con la certificación Recycled Claim Standard (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nPOLIÉSTER RECICLADO CERTIFICADO RCS\r\nActualmente, el poliéster reciclado se fabrica principalmente a partir de residuos de plástico PET. Se trata de un tipo de plástico muy utilizado en diversos artículos, como las botellas de plástico. El uso de materiales reciclados ayuda a limitar la producción de fibra de poliéster virgen. Está certificado según el Recycled Claim Standard  (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nACRÍLICO RECICLADO CERTIFICADO RCS\r\nEste material se fabrica a partir de residuos acrílicos reciclados procedentes de otros procesos de producción. Transformar los residuos en nuevos materiales ayuda a limitar la extracción de materias primas. Cuenta con la certificación Recycled Claim Standard (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente.\r\nPara mantener limpias tus chaquetas y abrigos sólo tienes que ventilarlas y pasarles un paño o un cepillo para la ropa. Si la limpieza en seco es necesaria intenta buscar tintorerías que utilicen tecnologías respetuosas con el medioambiente. \r\n\r\nGuía para el cuidado de la ropa\r\nNo lavar\r\nNo usar lejía / blanqueador\r\nPlanchar máximo 110ºC \r\nLim.Seco tetracloroetileno\r\nNo usar secadora', 699000.00, 79, 'abrigos', '', 'S,M,L,XL', 'Gris,Café,Negro', 3, 1),
(24, '02002', 'Chaqueta Volantes', 'Chaqueta de escote pico y manga larga. Detalle de volantes a tono. Cierre frontal con botones.\r\n\r\nTEJIDO PRINCIPAL\r\n 99% algodón,\r\n  1% elastano.\r\n                    \r\nADORNOS\r\n 56% poliéster,\r\n 44% algodón.\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente.\r\nPara mantener limpias tus chaquetas y abrigos sólo tienes que ventilarlas y pasarles un paño o un cepillo para la ropa. Este proceso es más delicado con los tejidos y además evita el consumo de agua y energía de los procesos de lavado. \r\n\r\nGuía para el cuidado de la ropa\r\n\r\nLavar a máquina max. 30ºC. Centrifugado corto\r\nNo usar lejía / blanqueador\r\nPlanchar máximo 150 º C\r\nLim.Seco tetracloroetileno\r\nSe puede usar secadora temperatura reducida', 80000.00, 78, 'chaquetas', '', 'XS,   S,   M,    L,  XL', 'Crudo', 2, 1),
(25, '03003', 'Pantalón Flare', 'Pantalón de tiro alto confeccionado en tejido de punto elástico y flexible con trama compacta, mullida y opaca. Cintura elástica ajustable con cordones. Detalle de costura marcada en delantero. Bajo acabado flare.\r\n                 \r\nEXTERIOR\r\n75% algodón\r\n17% poliéster\r\n8% elastano\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente\r\nLos lavados a bajas temperaturas y los programas de centrifugado suaves son más delicados con las prendas, ayudando a mantener el color, la forma y la estructura del tejido. Al mismo tiempo, reduce el consumo de energía que se utiliza en los procesos de cuidado. \r\n\r\nGuía para el cuidado de la ropa\r\n\r\nLavar a máquina max. 30ºC. Centrifugado corto\r\nNo usar lejía / blanqueador\r\nPlanchar máximo 110ºC \r\nNo limpieza en seco\r\nNo usar secadora', 200000.00, 65, 'pantalones', '', 'XS,   S,   M,    L,  XL', 'Negro, Crudo, Azul medio, Marron', 2, 3),
(26, '04004', 'Vestido Mini  Satinado', 'Vestido de escote redondo y tirantes anchos. Detalle de abertura en espalda. Cierre lateral con\r\n cremallera oculta en costura\r\n\r\nEXTERIOR\r\n97% poliéster\r\n3% elastano\r\nQue contiene al menos:\r\n\r\nEXTERIOR\r\n97% poliéster reciclado certificado RCS\r\n\r\nMATERIALES CERTIFICADOS\r\nPOLIÉSTER RECICLADO CERTIFICADO RCS\r\nActualmente, el poliéster reciclado se fabrica principalmente a partir de residuos de plástico PET. Se trata de un tipo de plástico muy utilizado en diversos artículos, como las botellas de plástico. El uso de materiales reciclados ayuda a limitar la producción de fibra de poliéster virgen. Está certificado según el Recycled Claim Standard  (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\n\r\nCertificado por Intertek 193341', 150000.00, 150, 'vestidos', '', 'XS,   S,   M,    L', 'Rojo', 2, 1),
(27, '05005', 'Bolso Shopper', 'Bolso formato shopper, Asa de hombro, Detalle de colgador, Bolsillo interior maxi y Cierre mediante imán.\r\n\r\nAlto x Ancho x Fondo: 29,5 x 36,5 x 12.\r\n\r\nEXTERIOR\r\n100% poliuretano\r\n\r\n FORRO\r\n 65% poliéster,\r\n 35% algodón.\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente.\r\nAcciones simples como limpiar los artículos con un paño de algodón seco o un cepillo suave, según las características del producto, pueden ayudarnos a cuidarlos. Siempre que sea posible, intenta usar productos respetuosos con el medioambiente. \r\n\r\nGuía para el cuidado de la ropa\r\n\r\nNo lavar\r\nNo usar lejía / blanqueador\r\nNo planchar\r\nNo limpieza en seco\r\nNo usar secadora', 190000.00, 250, 'bolsos', '', 'Unica', 'Negro,  Cafe', 2, 1),
(28, '06006', 'Saco Cremallera Cuello', 'Saco de cuello subido con cierre frontal de cremallera, Manga larga y Acabados en rib.\r\n\r\nEXTERIOR\r\nTEJIDO PRINCIPAL\r\n78% algodón\r\n22% poliéster\r\n\r\nTEJIDO SECUNDARIO\r\n100% algodón\r\nQue contiene al menos:\r\nEXTERIOR\r\nTEJIDO PRINCIPAL\r\n78% algodón de cultivo orgánico certificado OCS\r\n22% poliéster reciclado certificado RCS\r\n\r\nTEJIDO SECUNDARIO\r\n100% algodón de cultivo orgánico certificado OCS\r\n\r\nMATERIALES CERTIFICADOS\r\nPOLIÉSTER RECICLADO CERTIFICADO RCS\r\nActualmente, el poliéster reciclado se fabrica principalmente a partir de residuos de plástico PET. Se trata de un tipo de plástico muy utilizado en diversos artículos, como las botellas de plástico. El uso de materiales reciclados ayuda a limitar la producción de fibra de poliéster virgen. Está certificado según el Recycled Claim Standard  (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nALGODÓN DE CULTIVO ORGÁNICO CERTIFICADO OCS\r\nEsta fibra se produce sin utilizar fertilizantes ni pesticidas artificiales y se cultiva a partir de semillas que no han sido modificadas genéticamente. Actualmente trabajamos con el Organic Content Standard (OCS) que supervisa el proceso desde el origen hasta el producto final.\r\nCertificado por Intertek 193341\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente\r\nLos lavados a bajas temperaturas y los programas de centrifugado suaves son más delicados con las prendas, ayudando a mantener el color, la forma y la estructura del tejido. Al mismo tiempo, reduce el consumo de energía que se utiliza en los procesos de cuidado. \r\n\r\nGuía para el cuidado de la ropa\r\n\r\nLavar a máquina max. 30ºC. Centrifugado corto\r\nNo usar lejía / blanqueador\r\nPlanchar máximo 110ºC \r\nNo limpieza en seco\r\nNo usar secadora', 110000.00, 100, 'sacos', '', 'XS,   S,   M,    L,  XL, XXL', 'Negro,  Blanco roto,  Gris,  Marron', 2, 1),
(29, '07007', 'Polo Bordado Print', 'Camiseta tipo polo con estampado \"class of 65-scholl Henitage\"\r\n\r\nEXTERIOR\r\n100% algodón\r\nQue contiene al menos:\r\n\r\nEXTERIOR\r\n20% ALGODÓN RECICLADO CERTIFICADO RCS\r\nMATERIALES CERTIFICADOS\r\nALGODÓN RECICLADO CERTIFICADO RCS\r\nEsta fibra se fabrica a partir de residuos textiles de algodón reciclado. El uso de materiales reciclados ayuda a limitar el consumo de materias primas. Está certificada conforme al Recycled Claim Standard (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\n\r\nCertificado por Intertek 193341.\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es una manera de alargar su vida útil. Sigue las instrucciones de cuidado y lava tus prendas solo cuando sea necesario. Reduciendo los lavados y los secados alargamos la vida de nuestras prendas y reducimos el consumo de agua y energía.\r\n\r\nLAVAR A MAQUINA MAX. 30ºC. CENTRIFUGADO CORTO\r\nNO USAR LEJÍA / BLANQUEADOR\r\nPLANCHAR MAXIMO 110 º C \r\nNO LIMPIEZA EN SECO\r\nNO USAR SECADORA\r\nLAVAR AL REVÉS\r\nPLANCHAR AL REVES', 149900.00, 120, 'camisetas', '', 'XS,   S,   M,    L,  XL', 'Azul Oscuro', 2, 1),
(30, '08008', 'Pantalón Baggy Cargo', 'Pantalon tipo cargo oversize\r\n\r\nEXTERIOR\r\n100% algodón\r\n\r\nQue contiene al menos:\r\n\r\nEXTERIOR\r\n25% ALGODÓN RECICLADO CERTIFICADO RCS\r\n25% ALGODÓN DE CULTIVO ORGÁNICO CERTIFICADO OCS\r\nMATERIALES CERTIFICADOS\r\nALGODÓN RECICLADO CERTIFICADO RCS\r\nEsta fibra se fabrica a partir de residuos textiles de algodón reciclado. El uso de materiales reciclados ayuda a limitar el consumo de materias primas. Está certificada conforme al Recycled Claim Standard (RCS), que verifica el contenido reciclado y hace un seguimiento desde el origen hasta el producto final.\r\n\r\nCertificado por Intertek 193341.\r\n\r\nALGODÓN DE CULTIVO ORGÁNICO CERTIFICADO OCS\r\nEsta fibra se produce sin utilizar fertilizantes ni pesticidas artificiales y se cultiva a partir de semillas que no han sido modificadas genéticamente. Actualmente trabajamos con el Organic Content Standard (OCS) que supervisa el proceso desde el origen hasta el producto final.\r\n\r\nCertificado por Intertek 193341.\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es una manera de alargar su vida útil. Sigue las instrucciones de cuidado y lava tus prendas solo cuando sea necesario. Reduciendo los lavados y los secados alargamos la vida de nuestras prendas y reducimos el consumo de agua y energía.\r\n\r\nLAVAR A MAQUINA MAX. 40ºC CENTRIFUGADO CORTO\r\nNO USAR LEJÍA / BLANQUEADOR\r\nPLANCHAR MAXIMO 150 º C\r\nSE PUEDE USAR SECADORA TEMPERATURA REDUCIDA\r\nLAVAR POR SEPARADO\r\nLIMPIEZA EN SECO TETRACLOROETILENO', 190000.00, 67, 'pantalones', '', '34,   36,  38,  40,   42,  44', 'Negro,  Gris,   Marron', 2, 1),
(31, '09009', 'Falda Mini Lentejuelas', 'Falda mini de tiro medio. Detalle aplicación lentejuelas. Forro interior combinado. Cierre lateral con cremallera oculta en costura.', 199900.00, 55, 'faldas', '', 'XS, S, M, L, XL', 'Plata', 2, 1),
(32, '0100010', 'Jeans  Wide Tiro Alto', 'Jeans de tiro alto con cinco bolsillos. Efecto lavado. Pernera ancha. Cierre frontal con cremallera y botón.\r\n\r\nCOMPOSICIÓN\r\n\r\nEXTERIOR\r\n100% algodón\r\n\r\nALGODÓN DE CULTIVO ORGÁNICO CERTIFICADO OCS\r\nEsta fibra se produce sin utilizar fertilizantes ni pesticidas artificiales y se cultiva a partir de semillas que no han sido modificadas genéticamente. Actualmente trabajamos con el Organic Content Standard (OCS) que supervisa el proceso desde el origen hasta el producto final.\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es cuidar del medioambiente\r\nLos lavados a bajas temperaturas y los programas de centrifugado suaves son más delicados con las prendas, ayudando a mantener el color, la forma y la estructura del tejido. Al mismo tiempo, reduce el consumo de energía que se utiliza en los procesos de cuidado. \r\n\r\nGuía para el cuidado de la ropa\r\n\r\nLavar a máquina max. 40ºC centrifugado corto\r\nNo usar lejía / blanqueador\r\nPlanchar máximo 200 º C\r\nNo limpieza en seco\r\nSe puede usar secadora temperatura reducida', 150000.00, 45, 'jeans', '', 'XS,   S,   M,    L,  XL', 'Azul medio', 3, 1),
(34, '0110011', 'Collar Estrella Polar', 'Ilumina tu look con nuestro Collar Estrella Polar en plata de primera ley. Este collar presenta el simbólico diseño de la estrella polar con brillantes circonitas cúbicas transparentes colgando de una cadena de cable y aportará un brillo celestial a tu look con un simbolismo significativo. \r\nLa cadena se puede ajustar a tres longitudes diferentes para adaptarla a tu estilo. \r\n\r\nLa Estrella Polar, que sirve de brújula en momentos de incertidumbre, nos guía hacia un futuro más brillante y representa nuestras esperanzas y anhelos. Póntelos para dar brillo a cualquier look festivo o regálaselo a esa estrella brillante de tu vida.\r\n\r\nAlto :   1,49\r\n\r\nMetal :  Plata Esterlina\r\n\r\nAncho :  1,22\r\n\r\nTema :  Símbolos y Naturaleza\r\n\r\nColor :  Plata\r\n\r\nPiedra : Zirconia cúbica\r\n\r\nProfundidad :  0,23', 380000.00, 56, 'accesorios', '', '45 cm', 'Plata', 4, 1),
(35, '0120012', 'Pantalón Pinzas Hebilla', 'Pantalón de talle pequeño con detalle de pinza en la cintura en color plata.\r\n\r\nComposición\r\nEXTERIOR\r\n\r\n70% poliéster\r\n24% viscosa\r\n6% elastano\r\n\r\nCUIDADOS\r\nCuidar de tus prendas es una manera de alargar su vida útil. Sigue las instrucciones de cuidado y lava tus prendas solo cuando sea necesario. Reduciendo los lavados y los secados alargamos la vida de nuestras prendas y reducimos el consumo de agua y energía.\r\n\r\nLAVAR A MAQUINA MAX. 30ºC. CENTRIFUGADO CORTO\r\n\r\nNO USAR LEJÍA / BLANQUEADOR\r\n\r\nPLANCHAR MAXIMO 110 º C \r\n\r\nNO LIMPIEZA EN SECO\r\n\r\nNO USAR SECADORA', 90000.00, 54, 'pantalones', '', 'XS, S, M, L', 'Negro, Gris', 3, 3),
(37, '0130013', 'Bolso Efecto Acharolado', 'Bolso de hombro alargado en efecto acharolado. Asa de hombro. Detalle de bordes en contraste de color. Bolsillo interior con cremallera. Cierre mediante solapa y botón imantado.\r\n\r\nCOMPOSICIÓN\r\n\r\nEXTERIOR\r\n100% poliuretano\r\n\r\nFORRO\r\n100% poliéster\r\nCUIDADOS\r\n\r\nCuidar de tus prendas es cuidar del medioambiente.\r\nAcciones simples como limpiar los artículos con un paño de algodón seco o un cepillo suave, según las características del producto, pueden ayudarnos a cuidarlos. Siempre que sea posible, intenta usar productos respetuosos con el medioambiente. \r\n\r\nGuía para el cuidado de la ropa\r\nNo lavar\r\n\r\nNo usar lejía / blanqueador\r\n\r\nNo planchar\r\n\r\nNo limpieza en seco\r\n\r\nNo usar secadora', 120000.00, 34, 'bolsos', '', 'U', 'Azul', 2, 3),
(38, '0140014', 'Collar de plata y perlas', 'Collar TOUS Basic de plata de primera ley y perlas cultivadas de agua dulce en distinto tamaño. Tamaño perlas cultivadas: 4,5 a 10 mm. Longitud collar: 42 cm. Cierre mosquetón con detalle oso.\r\n\r\nGuardar en su estuche original sin que entre en contacto con otras joyas para evitar roces o ralladuras. Evite el contacto con líquidos, productos químicos o cosméticos, así como los cambios de temperatura extremos y golpes.\r\n\r\nEs recomendable hacer una revisión periódica del engaste de las joyas con gema, especialmente las sortijas y pulseras, así como el enhebrado de collares de perlas o gemas.', 120000.00, 43, 'accesorios', '', '45 cm', 'Plata', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `correo`, `telefono`, `cedula`, `fecha_registro`, `activo`) VALUES
(1, 'Jose Manuel Alvarez', 'josemanuel@gmail.com', '3126576543', '1098765456', '2025-06-19 00:00:00', 1),
(3, 'Ian Hernandez', 'ianhernandez@gmail.com', '3215535953', '1023787654', '2025-06-26 00:00:00', 1),
(4, 'Cristina  López Herrera', 'cristina@gmail.com', '3126545698', '1087656543', '2025-06-30 00:00:00', 1),
(12, 'jesus', 'jesus4@gmail.com', '1234643456', '1087656543', '2025-08-12 00:00:00', 1),
(18, 'jose', 'jose67@gmail.com', '3215535953', '1087656549', '2025-08-13 00:00:00', 1),
(22, 'Cristian', 'cristian@gmail.com', '1234567890', '1087656543', '2025-09-15 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_marca`
--

CREATE TABLE `proveedor_marca` (
  `id` int NOT NULL,
  `proveedor_id` int NOT NULL,
  `marca_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor_marca`
--

INSERT INTO `proveedor_marca` (`id`, `proveedor_id`, `marca_id`) VALUES
(1, 1, 2),
(4, 1, 4),
(5, 3, 5),
(6, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('admin','usuario') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'usuario',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `imagen_perfil`, `contraseña`, `rol`, `fecha_creacion`) VALUES
(1, 'Dearx', 'dadmin@gmail.com', '', '$2y$10$/ROxBL7GIC1mNkSQ7HVyQePKnrdghovKmvHKRkz5XtWuo8HNoDnbe', 'admin', '2025-09-18 21:55:18'),
(2, 'fredy', 'fredy23@hotmail.com', '', 'pbkdf2_sha256$870000$1dQQTOGe7e3r2FoYWfBLJh$MHpeqcK5LmGJrKJeRkJz/jE50L+uWpQ1n2SZE1ccrtI=', 'usuario', '2025-09-18 21:55:18'),
(3, 'kitty', 'fresasconbotas@gmail.com', '', 'pbkdf2_sha256$870000$rl25w8bsX1zwL6Pi8RUIm9$NKrnbU2cStJfFDcQiNRRYskO3UpVx2cZ72M4Yt93jxk=', 'admin', '2025-09-18 21:55:18'),
(4, 'sebas', 'sebastiancarrillo@gmail.com', NULL, 'pbkdf2_sha256$870000$ISQjyivMyGBDMqWxNcM9li$tHnDBd4ot6HPt9TeC5Zobgng1jgvJGixwakZ4OkX42w=', 'usuario', '2025-09-18 21:55:18'),
(5, 'jennifer', 'jennifer@gmail.com', NULL, 'pbkdf2_sha256$870000$UkCNLOmIjh96c5ChMYwetU$8RVpZ8k2O47oNIxeUhvJrS/ce6gWkHMYAz0sDYl8W78=', 'usuario', '2025-09-18 21:55:18'),
(6, 'Hector Maya', 'hector@gmail.com', 'perfiles/space.jpg', 'pbkdf2_sha256$870000$vXXJlWFunTM2DBjoFPaI8g$vwMtPnZYLqUZX2bcCw2P0Pt1RYNk1N8wPsCIZF34pBo=', 'admin', '2025-09-18 21:55:18'),
(7, 'Ariana Grande', 'ariana@gmail.com', 'perfiles/hk.jpg', 'pbkdf2_sha256$870000$A7JQqNeufUwvw1ELePPnSB$5QSZGwiDTS3B4Gg+cVqjCFicmR9JY1iFdy+84ohkj+I=', 'usuario', '2025-09-18 21:55:18'),
(8, 'The Weeknd', 'weeknd@gmail.com', '', 'pbkdf2_sha256$870000$uZMhbH42pTdKCzkFfcxFno$zdGhh7hC4jWbnBCiFg5gi05uYmPxxJDPoEQVKMQPfV8=', 'usuario', '2025-09-18 21:55:18'),
(9, 'isabel sanmartin', 'isabelsanmartin@gmail.com', NULL, 'pbkdf2_sha256$870000$cJ3mEM17ZW2oZaZhjJrPWx$vilo3Un1A5CLTU/kcOQWePnrDyU6n+TIWnndi3BcGag=', 'usuario', '2025-09-18 21:55:18'),
(10, 'Eminem', 'eminem@gmail.com', 'perfiles/astro.jpg', 'pbkdf2_sha256$870000$6mb7Sdc8HOZPorES4eJL5y$y1qgPiDV00gFHA3GNNkUFxJwOJC9DMSkMV1fpmH/2EE=', 'usuario', '2025-09-18 21:55:18'),
(11, 'Billie Eilish', 'billie@gmail.com', 'perfiles/t.jpg', 'pbkdf2_sha256$870000$7OB4IspEHS5Q0mRk3eoK2k$TVtd1T1ZeJznKVmQsr6wHu3g2Ig1p1/wMibWivcGO2g=', 'usuario', '2025-09-18 21:55:18'),
(32, 'isa', 'isabel123@example.com', 'perfiles/t_Bl48fGT.jpg', 'pbkdf2_sha256$870000$F8NGjtMmY85MI2m7PBtlUC$9jN0MTHYHeAZIyKnjWFW2wo+8pzDGUB8dGLFad2wLEU=', 'usuario', '2025-09-18 21:55:18'),
(33, 'santiago', 'meza@example.com', NULL, 'pbkdf2_sha256$870000$WHZXEwjU7jdEa2pJZHfMbs$G0hjOrGhs2acPl/hCMzJm/Jbn6wAQRBwTIV+qo3YBoU=', 'usuario', '2025-09-18 21:55:18'),
(40, 'Maria angel', 'mariaa@gmail.com', '', 'pbkdf2_sha256$870000$b8vNr7lVZ0wCDZ8YyClOQ0$fah8h/vl4r39M+/KedrjFhjWk5OxSWxLXehF/dQUQN0=', 'usuario', '2025-09-18 21:55:18'),
(42, 'alexis', 'alfecora19@gmail.com', '', 'pbkdf2_sha256$870000$LE8qT6apTNxhLHq4L2cV01$q/jyIIlHJEyUgyeEkJwfoDwnq7w+SNduu7I7O2W95cg=', 'usuario', '2025-09-18 21:55:18'),
(44, 'Olivia rodrigo', 'olivia@gmail.com', '', 'pbkdf2_sha256$870000$tj1yW7C3LLDxxNrQsj4TlZ$7mPVC502BjPvI7GDDaEm3Dt6U0KSfe4kXMh/XwZZQA4=', 'usuario', '2025-09-18 21:55:18'),
(45, 'Maria Cristina', 'mariac@gmail.com', '', 'pbkdf2_sha256$870000$AoUjyTsaumh33i45ezlece$TtCQ9yL1NeU9NeouvF+95zbveL+XZw5QCNyGzx4d+ho=', 'usuario', '2025-09-18 21:55:18'),
(46, 'Andres', 'dresss@gmail.com', '', 'pbkdf2_sha256$870000$ygkN5yguQJhRSwkH3vfD53$A32V1JJbovhKNKRba/rIhu/rnaRBvmVAV3H5Nh3wc2A=', 'usuario', '2025-09-18 21:55:18'),
(47, 'Maria', 'marialove@gmail.com', '', 'pbkdf2_sha256$870000$EqaMZfQWyCCBllFUJOgr5R$d6hy3J2+AwRVn2YI4ORtlPajz3K4NC3afoD5Jl94/RE=', 'usuario', '2025-09-18 21:55:18'),
(48, 'Thomas', 'Tubebybi@gmail.com', '', 'pbkdf2_sha256$870000$dRZeO7elzcCNJnLDs7oNph$k9bHj5ZnbpzqZWEoKd19j7/0+nUhWnHKiTrw23RZAks=', 'usuario', '2025-09-18 21:55:18'),
(49, 'veronica', 'veroh@gmail.com', '', 'pbkdf2_sha256$870000$OOkJ40HbXpWXYa80JCuou5$RG1yMwj/xc/pBazkCHe4lo8zQOoRE7I2HCZiTqPmOgQ=', 'usuario', '2025-09-18 21:55:18'),
(58, 'Juan perez', 'juan22@gmail.com', '', 'pbkdf2_sha256$870000$wmxodn77lrjXer5KpFPFx0$NWFaJ36nGmlSpFEeUTnIB+Hq8Y3tUYn/tU7XjR57y8A=', 'admin', '2025-09-18 21:55:18'),
(59, 'Samuel Torres', 'samuel@gmail.com', 'perfiles/b_cxgm2XA.jpg', 'pbkdf2_sha256$870000$VYa6kqNpMjqPTGIrWCFkwV$ezkXSYTECAmTdJFO36jnkchhGz6+bXAydICRhPqju78=', 'usuario', '2025-09-18 21:55:18'),
(60, 'jose dias', 'jose67@gmail.com', '', 'pbkdf2_sha256$870000$EJ9E3K8YywAe2nTepjW5Hd$SrOpGOy1wBfXuURLo7FhdyVbrsWcm2R3ZDta/C+qVYI=', 'usuario', '2025-09-18 21:55:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_blog`
--
ALTER TABLE `core_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_mensaje`
--
ALTER TABLE `core_mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_usuario`
--
ALTER TABLE `core_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_marca` (`marca_id`),
  ADD KEY `fk_proveedor` (`proveedor_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor_marca`
--
ALTER TABLE `proveedor_marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_blog`
--
ALTER TABLE `core_blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `core_mensaje`
--
ALTER TABLE `core_mensaje`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_usuario`
--
ALTER TABLE `core_usuario`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proveedor_marca`
--
ALTER TABLE `proveedor_marca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `imagenproducto`
--
ALTER TABLE `imagenproducto`
  ADD CONSTRAINT `imagenproducto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `proveedor_marca`
--
ALTER TABLE `proveedor_marca`
  ADD CONSTRAINT `proveedor_marca_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `proveedor_marca_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
