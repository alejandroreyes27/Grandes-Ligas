-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 31-05-2025 a las 22:03:02
-- Versión del servidor: 9.3.0
-- Versión de PHP: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alejandrobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `idUser` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `talla` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL,
  `nombreCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`) VALUES
(2, 'Adidas Dama'),
(20, 'Alexander Mcqueen Dama'),
(23, 'Asics Dama'),
(16, 'Fila Dama'),
(4, 'Guayos Adidas Predator '),
(6, 'Guayos Nike'),
(1, 'Guayos Nike de bota '),
(17, 'New Balance Dama'),
(25, 'Nike Caballero'),
(3, 'Nike Dama'),
(15, 'Puma Dama'),
(19, 'Reebok Dama'),
(22, 'Skechers Dama'),
(10, 'Tenis Nike basketball y volleyball'),
(14, 'Tenis On Running '),
(13, 'Tenis Running Adidas '),
(11, 'Tenis Running New Balance '),
(12, 'Tenis Running Nike'),
(21, 'Valentino Garavani Dama'),
(18, 'Veja Dama'),
(24, 'Versace Dama'),
(9, 'Zapatillas Adidas para Sintética '),
(8, 'Zapatillas Nike Futbol Sala'),
(7, 'Zapatillas Nike para Sintética '),
(5, 'Zapatillas Nike Total 90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `id` int NOT NULL,
  `factura_id` int NOT NULL,
  `product_id` int NOT NULL,
  `talla` float DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalles_factura`
--

INSERT INTO `detalles_factura` (`id`, `factura_id`, `product_id`, `talla`, `quantity`, `price`, `total`) VALUES
(8, 8, 34, 42, 1, 175000, 175000),
(10, 10, 5, 42, 2, 190000, 380000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `subtotal` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL,
  `revisada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id`, `user_id`, `date_created`, `subtotal`, `iva`, `total`, `revisada`) VALUES
(8, 1, '2025-05-29 21:34:41', 175000, 0, 175000, 1),
(10, 5, '2025-06-01 02:27:32', 380000, 0, 380000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `nombreProducto` varchar(255) NOT NULL,
  `descripcionProducto` text NOT NULL,
  `precioProducto` float NOT NULL,
  `stock` int NOT NULL,
  `imagenProducto` varchar(255) DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `stock`, `imagenProducto`, `talla`, `idCategoria`, `fechaCreacion`, `activo`) VALUES
(1, 'Nike', 'Nike Excelente producto en tendencia y en el mercado', 170000, 15, 'IMG/Zapatillas_Puma_Palermo_Sportstyle.jpg', NULL, 1, '2025-05-27 03:02:48', 0),
(2, 'Nike Mujer', 'Zapatillas Urbano Mujer Nike W Nike Air Max Portal', 170000, 20, 'IMG/Zapatillas_Urbano_Mujer_Nike_W_Nike_Air_Max_Portal.webp', NULL, 1, '2025-05-27 03:04:24', 0),
(3, 'New Balance ', 'New Balance Blancas excelente producto en tendencia', 170000, 20, 'IMG/WTMORAG3Q44_1.webp', NULL, 3, '2025-05-27 23:38:50', 0),
(4, 'Guayos Adidas Predator', ' Guayos Adidas Predator Elite FT, diseñados para los jugadores que dominan el campo. ', 190000, 10, 'IMG/GUAYOS-ADIDAS-PREDATOR-ELITE-FT-16.webp', NULL, 4, '2025-05-28 16:10:05', 1),
(5, 'Guayos Adidas Predator', 'Guayos Adidas Predator Elite FT, diseñados para los jugadores que dominan el campo', 190000, 10, 'IMG/02d573d5.webp', NULL, 4, '2025-05-28 16:13:35', 1),
(6, 'Guayos Adidas Predator', 'Guayos Adidas Predator Elite FT, diseñados para los jugadores que dominan el campo. ', 190000, 10, 'IMG/8abd701c-e85a-4c6a-930e-796aabc9f7c1.png', NULL, 4, '2025-05-28 16:20:34', 1),
(7, 'Guayos Adidas Predator', ' Guayos Adidas Predator Elite FT, diseñados para los jugadores que dominan el campo. ', 190000, 10, 'IMG/ChuteiraInfantilCampoAdidasPredator30EliteComLinguaAzulClaroeRosa4.webp', NULL, 4, '2025-05-28 16:27:13', 1),
(8, 'Guayos nike phantom', 'Guayos nike phantom esta bota de fútbol es perfecta para jugadores que buscan un toque de balón excepcional.', 190000, 10, 'IMG/image00001_4_b8406fb1-b5d5-4fe9-903a-10b1eff8662a.png', NULL, 1, '2025-05-28 16:46:17', 1),
(9, 'Guayos nike phantom', 'Guayos nike phantom esta bota de fútbol es perfecta para jugadores que buscan un toque de balón excepcional.', 190000, 10, 'IMG/images_2.jpeg', NULL, 1, '2025-05-28 16:49:09', 1),
(10, 'Guayos nike phantom', 'Guayos nike phantom esta bota de fútbol es perfecta para jugadores que buscan un toque de balón excepcional', 190000, 10, 'IMG/botas-de-futbol-nike-phantom-gx-elite-df-fg-rosa-negro.jpg', NULL, 1, '2025-05-28 17:03:09', 1),
(11, 'Guayos nike phantom', 'Guayos nike phantom esta bota de fútbol es perfecta para jugadores que buscan un toque de balón excepcional', 190000, 10, 'IMG/ad41e568.webp', NULL, 1, '2025-05-29 15:15:14', 1),
(12, 'Guayos nike phantom', 'Guayos nike phantom esta bota de fútbol es perfecta para jugadores que buscan un toque de balón excepcional', 190000, 10, 'IMG/nike-luna-onca-2976983c739767d55b17249627594069-480-0.jpg', NULL, 1, '2025-05-29 15:18:09', 1),
(13, 'zapatillas total 90', 'Las Total 90 son una versión de la icónica bota de fútbol de Nike, conocida por su diseño clásico y atemporal', 180000, 10, 'IMG/Number-Shoe2526-158.jpg', NULL, 5, '2025-05-29 15:29:32', 1),
(14, 'zapatillas total 90', 'Las Total 90  son una versión de la icónica bota de fútbol de Nike, conocida por su diseño clásico y atemporal', 180000, 10, 'IMG/hj9351-700-1.avif', NULL, 5, '2025-05-29 15:32:34', 1),
(15, 'zapatillas total 90', 'Las Total 90 son una versión de la icónica bota de fútbol de Nike, conocida por su diseño clásico y atemporal', 180000, 10, 'IMG/Z9002-1-298x298.png', NULL, 5, '2025-05-29 15:38:21', 1),
(16, 'Adidas Ventador Climacool ', 'Adidas Ventador Climacool . Estas zapatillas te brindan una excelente tracción sin agobiarte', 165000, 1, 'IMG/ADIDAS-VENTADOR-CLIMACOOL-SHOES-FOR-MEN-CORE-BLACK-GZ9458_2.webp', NULL, 2, '2025-05-29 15:46:29', 1),
(17, 'Adidas Gazelle Indoor Pink Sand', 'Adidas Gazelle Indoor Pink Sand. son la combinación entre comodidad, estilo y calidad; excelente opción para quienes buscan añadir una pieza icónica en su armario', 170000, 1, 'IMG/Adidas_gazelle.jpg', NULL, 2, '2025-05-29 16:02:27', 1),
(18, 'Guayos nike ', 'Los Guayos Nike Confeccionados con tacos Academy con una unidad Air Zoom mejorada en el talón. ', 190000, 90, 'IMG/s-l1200.jpg', NULL, 6, '2025-05-29 16:07:57', 1),
(19, 'Guayos nike ', 'Los Guayos Nike Confeccionados con tacos Academy con una unidad Air Zoom mejorada en el talón. ', 190000, 10, 'IMG/images_3.jpeg', NULL, 6, '2025-05-29 16:10:40', 1),
(20, 'Guayos nike ', 'Los Guayos Nike Confeccionados con tacos Academy con una unidad Air Zoom mejorada en el talón. ', 190000, 10, 'IMG/images_4.jpeg', NULL, 6, '2025-05-29 16:12:38', 1),
(21, 'Adidas Samba XLG', 'Adidas Samba XLG. Lleva tu estilo a otro nivel con estas zapatillas ya que son un icónico modelo deportivo de corte bajo rediseñado para las calles', 170000, 2, 'IMG/Tenis_Samba_XLG_Blanco_IE1377_01_standard.avif', NULL, 2, '2025-05-29 16:33:20', 1),
(22, 'Zapatillas Sintetica Tiempo', 'Creados para quienes se toman en serio su juego, la última versión de estos tacos Pro cuentan con el nuevo cuero con diseño avanzado FlyTouch Pro.', 180000, 10, 'IMG/LEGEND10PROTF.jpg', NULL, 7, '2025-05-29 16:55:07', 1),
(23, 'Zapatillas Sintetica Tiempo', 'Creados para quienes se toman en serio su juego, la última versión de estos tacos Pro cuentan con el nuevo cuero con diseño avanzado FlyTouch Pro.', 180000, 10, 'IMG/02d573d5.png', NULL, 7, '2025-05-29 17:00:07', 1),
(24, 'Zapatillas Sintetica ', 'Creados para quienes se toman en serio su juego, la última versión de estos tacos Pro cuentan con el nuevo cuero con diseño avanzado FlyTouch Pro.', 180000, 10, 'IMG/ChuteiraSocietyNikePhantomGX2AcademyTFSafariPack1_2f7a1877-7ea9-4663-88e4-b0a7c15255e9.png', NULL, 7, '2025-05-29 17:03:24', 1),
(25, 'Zapatillas Nike Lunar Gato', 'zapatillas Nike Lunar Gato Con su tecnología Lunarlon, disfruta de una amortiguación suave y reactiva para un juego más rápido y preciso.', 180000, 10, 'IMG/f2c1f07a_1.jpg', NULL, 8, '2025-05-29 19:43:15', 1),
(26, 'zapatillas Nike Lunar Gato', 'zapatillas Nike Lunar Gato Con su tecnología Lunarlon, disfruta de una amortiguación suave y reactiva para un juego más rápido y preciso.', 180000, 10, 'IMG/FUTSAL_JR_LUNAR_GATO_II_BLANCO_AZUL.webp', NULL, 8, '2025-05-29 19:45:59', 1),
(27, 'Zapatillas Nike Lunar Gato', 'zapatillas Nike Lunar Gato Con su tecnología Lunarlon, disfruta de una amortiguación suave y reactiva para un juego más rápido y preciso.', 180000, 10, 'IMG/images_5.jpeg', NULL, 8, '2025-05-29 19:50:10', 1),
(28, 'Zapatillas Nike Tiempo', 'El Nike React Tiempo Legend 9 Pro te permite ir a la ofensiva con un diseño de perfil bajo que se reinventa para los atacantes.', 180000, 10, 'IMG/7f716c02.webp', NULL, 8, '2025-05-29 19:54:56', 1),
(29, 'Zapatillas Adidas  Messi F50', 'Las Zapatillas Adidas  Messi F50 incluye una lengüeta sintética para una comodidad ligera. La suela de caucho con taches te permite moverte con fluidez en pasto sintético.\r\n', 180000, 10, 'IMG/Guayos_Messi_F50_League_Pasto_Sintetico_Dorado_IG9277_22_model.avif', NULL, 9, '2025-05-29 20:01:17', 1),
(30, 'Zapatillas Adidas Predador ', 'Las Zapatillas Adidas Predador tienen una  mediasuela Lightstrike de perfil bajo y la suela de caucho estriada te ayudan a dominar a tus rivales en canchas de pasto sintético.', 180000, 10, 'IMG/Guayos_Predator_Elite_Pasto_Sintetico_Azul_IF6372_22_model.avif', NULL, 9, '2025-05-29 20:05:22', 1),
(31, 'Tenis Nike basketball y volleyball', 'Tenis Nike basketball y volleyball Diseñado para la próxima generación de retorno de energía, control y velocidad.', 180000, 10, 'IMG/9cc936320765791b7d23985ed9d001a4.jpg', NULL, 10, '2025-05-29 20:14:04', 1),
(32, 'Tenis Nike basketball y volleyball ', 'Tenis Nike basketball y volleyball Diseñado para la próxima generación de retorno de energía, control y velocidad.', 180000, 10, 'IMG/nike-ao4436-009-kyrie-flytrap-ii_3.jpg', NULL, 10, '2025-05-29 20:16:11', 1),
(33, 'Tenis Nike basketball y volleyball ', 'Tenis Nike basketball y volleyball Diseñado para la próxima generación de retorno de energía, control y velocidad.', 180000, 10, 'IMG/Nike-Kyrie-3-2.webp', NULL, 10, '2025-05-29 20:20:30', 1),
(34, 'Adidas Campus x Bad Bunny Blancas', 'Adidas Campus x Bad Bunny Blancas. Un ícono renovado con elegancia minimalista, perfectas para toda ocasión', 175000, 1, 'IMG/BAD-BUNNY-CAMPUS-WHITE-BLACK.webp', NULL, 2, '2025-05-29 20:36:16', 1),
(35, 'Adidas Ozmillen', 'Adidas Ozmillen. Son zapatillas inspiradas en diseños icónicos de los años 90, con un estilo clásico y elegante', 170000, 1, 'IMG/Tenis_OZMILLEN_Blanco_IE5841_01_standard.avif', NULL, 2, '2025-05-29 20:45:18', 1),
(36, 'Adidas X_PLR negro', 'Adidas X_PLR. Estas zapatillas ofrecen la mejor amortiguación y comodidad para el día a día ', 175000, 1, 'IMG/Tenis_X_PLR_Phase_Negro_IG4768_01_standard.avif', NULL, 2, '2025-05-29 20:51:58', 1),
(37, 'Adidas Ultraboost 5x negra', 'Adidas Ultraboost 5x negra. Comodidad, equilibrio y la mejor amortiguación en una sola zapatilla', 150000, 4, 'IMG/8bc78388-e562-4410-a95e-06756cb60e9c_540x.webp', NULL, 2, '2025-05-29 21:30:24', 1),
(38, 'Adidas Pureboost 5 blanco', 'Adidas Pureboost 5 blanco. Perfectas para salir a correr, proporcionan impulso y comodidad a tu pisada', 155000, 1, 'IMG/Tenis_de_Running_Pureboost_5_Blanco_IE8463_01_standard.avif', NULL, 2, '2025-05-29 21:39:35', 1),
(39, 'Adidas Ultraboost 5x gris', 'Adidas Ultraboost 5x gris. Comodidad, equilibrio y la mejor amortiguación en una sola zapatilla', 155000, 3, 'IMG/adidas-Ultra-Boost-5X-Grey-Cloud-White-Product.avif', NULL, 2, '2025-05-29 22:09:03', 1),
(40, 'Adidas Ozmillen negro', 'Adidas Ozmillen negro. Son zapatillas inspiradas en diseños icónicos de los años 90, con un estilo clásico y elegante', 170000, 1, 'IMG/51ivQC1VnWL._AC_UY900_.jpg', NULL, 2, '2025-05-29 22:12:15', 1),
(41, 'Adidas Duramo Speed Core Black', 'Adidas Duramo Speed Core Black. Estas zapatillas son especiales para quienes están empezando en el running', 170000, 4, 'IMG/Tenis_Duramo_Speed_Negro_IE4036_01_standard.avif', NULL, 2, '2025-05-29 22:18:13', 1),
(42, 'Adidas Campus 00s negro', 'Adidas Campus 00s negro. Presentan una silueta clásica de baloncesto combinada con un estilo vintage ', 165000, 2, 'IMG/Tenis_Campus_00s_Negro_HQ8708_01_standard.avif', NULL, 2, '2025-05-29 22:26:27', 1),
(43, 'Adidas Dama', 'Adidas Forum Low blanco. La combinación perfecta entr4e un estilo informal y retro', 170000, 1, 'IMG/Tenis_Forum_Low_CL_Blanco_IH7828_01_standard.avif', NULL, 2, '2025-05-29 22:31:30', 1),
(44, 'Adidas Samba OG', 'Adidas Samba OG. Son un ícono atemporal de la moda urbana, un par indispensable en cualquier armario', 170000, 8, 'IMG/Tenis_Samba_OG_Blanco_B75806_01_00_standard.avif', NULL, 2, '2025-05-29 22:35:14', 1),
(45, 'Adidas Samba OG floral blanco', 'Adidas Samba OG floral. Son un ícono atemporal de la moda urbana, un par indispensable en cualquier armario', 170000, 3, 'IMG/Tenis_Samba_OG_Blanco_IF4398_01_standard.avif', NULL, 2, '2025-05-29 22:39:11', 1),
(46, 'Adidas Samba OG floral negro', 'Adidas Samba OG floral negro. Son un ícono atemporal de la moda urbana, un par indispensable en cualquier armario', 170000, 3, 'IMG/Tenis_Samba_OG_Negro_IF4397_01_standard.avif', NULL, 2, '2025-05-29 22:40:11', 1),
(47, 'Adidas Superstar blanco', 'Adidas Superstar blanco. Un ícono para la eternidad; estas zapatillas te brindan la comodidad que buscas en tu día a día ', 165000, 2, 'IMG/Tenis_Superstar_Blanco_EG4958_01_00_standard.avif', NULL, 2, '2025-05-29 22:43:15', 1),
(48, 'Nike Air Force 1 blanco', 'Nike Air Force 1 blanco. Esta zapatilla ofrece amortiguación y comodidad junto con un estilo legendario y refinado', 170000, 3, 'IMG/AF1.webp', NULL, 3, '2025-05-29 22:58:53', 1),
(49, 'Nike Dama', 'Nike Pegasus Trail 5. Este modelo combina lo mejor de la moda y la funcionalidad', 160000, 1, 'IMG/img01.avif', NULL, 3, '2025-05-29 23:10:40', 0),
(50, 'Guayos nike ', 'Los Guayos Nike Confeccionados con tacos Academy con una unidad Air Zoom mejorada en el talón. ', 190000, 10, 'IMG/d435e2d2.webp', NULL, 6, '2025-05-29 23:22:05', 1),
(51, 'Nike Air Max Dn blanco-morado', 'Nike Air Max Dn . Diseño deportivo y contemporáneo, con icónica burbuja de aire visible en la suela ', 165000, 1, 'IMG/NIKE-AIR-MAX-DN-M-2.webp', NULL, 3, '2025-05-29 23:29:14', 1),
(52, 'Nike ReactX Infinity Run 4 negro', 'Nike ReactX Infinity Run 4 negro. Proporcionan una tracción fiable en superficies mojadas y resbaladizas', 170000, 1, 'IMG/nike-4306-6107042-1-zoom.webp', NULL, 3, '2025-05-29 23:38:42', 1),
(53, 'New Balance Running', 'New Balance Running esta Diseñada para ofrecer una experiencia suave pero estable, bajo los pies con una comodidad total.', 180000, 10, 'IMG/WRCELLN4-B-1.webp', NULL, 11, '2025-05-29 23:39:06', 1),
(54, 'Nike Blazer Victory negro', 'Nike Blazer Victory negro. Perfecto para combinar tu outfitt contemporáneo', 165000, 1, 'IMG/WNIKEBLAZERMIDVICTORY.avif', NULL, 3, '2025-05-29 23:45:12', 1),
(55, 'Nike Blazer Victory blanco', 'Nike Blazer Victory blanco. Perfecto para combinar tu outfitt contemporáneo', 165000, 1, 'IMG/61c9W-9D9uL._AC_SY695_.jpg', NULL, 3, '2025-05-29 23:47:35', 1),
(56, 'New Balance Running', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total ', 180000, 10, 'IMG/WFCXCJ4-1_dr3nta.webp', NULL, 11, '2025-05-29 23:53:16', 1),
(57, 'Nike Bailleli', 'Nike Bailleli. Diseñadas para ofrecer comodidad y soporte con una estética moderna', 175000, 1, 'IMG/Nike-Bailleli-2.webp', NULL, 3, '2025-05-29 23:54:37', 1),
(58, ' New Balance Running', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total ', 180000, 10, 'IMG/new-balance.jpg', NULL, 11, '2025-05-29 23:55:55', 1),
(59, 'Nike Air Max Bliss', 'Nike Air Max Bliss. Una mezcla de funcionalidad y moda, combina una amortiguación suave con un acolchado alrededor del tobillo', 170000, 1, 'IMG/Nike-Air-Max-Bliss-Photon-Dust-Lilac-W.avif', NULL, 3, '2025-05-30 00:03:42', 1),
(60, 'New Balance Running AT ', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total .', 180000, 10, 'IMG/WTMORAG3Q44_1.webp', NULL, 11, '2025-05-30 00:07:04', 1),
(61, 'New Balance Running ', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total .', 180000, 10, 'IMG/New-Balance-FuelCell-SC-Elite-V3-TCS-New-York-City-Marathon-2023.avif', NULL, 11, '2025-05-30 00:09:52', 1),
(62, 'Nike Jordan Retro 3 \"travis scott\"', 'Nike Jordan Retro 3 \"travis scott\". Perfectas para quienes aprecian la combinación de la cultura urbana con el rendimiento deportivo', 175000, 1, 'IMG/Fxk1X1oX0AI4Pjs.webp', NULL, 3, '2025-05-30 00:09:52', 1),
(63, 'Nike Invincible Run 3', 'Nike Invincible Run 3. La máxima amortiguación de esta zapatilla proporciona una pisada mas cómoda para las carreras del día a día ', 175000, 2, 'IMG/8b-1.jpg', NULL, 3, '2025-05-30 00:21:31', 1),
(64, 'Nike Running', 'Las Nike Running de  máxima amortiguación de los Vomero proporciona una pisada cómoda para las carreras del día a día. ', 180000, 10, 'IMG/nike-zoomx-vaporfly-next-3-prototype-fb7937-100_1.jpg', NULL, 12, '2025-05-30 00:25:06', 1),
(65, 'Nike Tn negro', 'Nike Tn negro. Una experiencia Air Max que ofrece estabilidad y amortiguación, eleva tu estilo con las Nike Tn ', 175000, 1, 'IMG/AIRMAXPLUS.avif', NULL, 3, '2025-05-30 00:25:43', 1),
(66, 'Nike V2k Run', 'Nike V2k Run. El talón estilo chunky garantiza comodidad, estas zapatillas llevan el estilo retro al futuro', 175000, 1, 'IMG/WNIKEV2KRUN.avif', NULL, 3, '2025-05-30 00:33:24', 1),
(67, 'Nike Running', 'Las Nike Running de  máxima amortiguación de los Vomero proporciona una pisada cómoda para las carreras del día a día. ', 180000, 10, 'IMG/nike-zoomx-vaporfly-next--3-m-chaussures-homme-663621-1-fz.jpg', NULL, 12, '2025-05-30 00:38:48', 1),
(68, 'Nike Jordan Retro 1 Low Paris', 'Nike Jordan Retro 1 Low Paris. Ofrecen el equilibrio perfecto entre funcionalida y moda', 170000, 1, 'IMG/al8eq-hcdty.webp', NULL, 3, '2025-05-30 00:39:55', 1),
(69, 'Nike Running ', 'Las Nike Running de  máxima amortiguación de los Vomero proporciona una pisada cómoda para las carreras del día a día. ', 180000, 10, 'IMG/img01.avif', NULL, 12, '2025-05-30 00:40:43', 1),
(70, 'Nike Jordan 1 High OG UNC', 'Nike Jordan 1 High OG UNC. Integra magistralmente una combinación exclusiva de colores', 165000, 1, 'IMG/images.jpeg', NULL, 3, '2025-05-30 00:43:09', 1),
(71, 'Nike Jordan 1 Palo Rosa', 'Nike Jordan 1 Palo Rosa. Integra magistralmente una combinación exclusiva de colores', 165000, 1, 'IMG/1696215037124-2641db0f2a4c8ded7216962753113412-640-0.jpg', NULL, 3, '2025-05-30 00:47:36', 1),
(72, 'Nike Running', 'Las Nike Running de  máxima amortiguación de los Vomero proporciona una pisada cómoda para las carreras del día a día. ', 180000, 10, 'IMG/nike-air-zoom-alphafly-next--2-m-chaussures-homme-672457-1-fz.jpg', NULL, 12, '2025-05-30 00:48:36', 1),
(73, 'Adizero Adios Pro 3', 'Las Adizero Adios Pro 3 fueron diseñadas con y para atletas para lograr hazañas increíbles', 180000, 10, 'IMG/adidas-Adios-Pro-3-Cloud-White.avif', NULL, 13, '2025-05-30 14:50:05', 1),
(74, 'Tenis Adistar 3', 'Los Tenis Adistar 3 fueron diseñadas con y para atletas para lograr hazañas increíbles', 180000, 10, 'IMG/Tenis_Adistar_3_Blanco_IE8222_HM1_1.jpg', NULL, 13, '2025-05-30 14:53:28', 1),
(75, 'Tenis On Running ', 'Los On Running Cloudmonster 2 son perfectas para carreras de entrenamiento o esfuerzos dinámicos al aportar más amortiguación en cada zancada', 180000, 10, 'IMG/On-Running-Cloudmonster-2-White-Flame-Womens.avif', NULL, 14, '2025-05-30 15:00:13', 1),
(76, 'Nike Air Max Correlate', 'Nike Air Max Correlate. La combinación entre comodidad y estilo', 165000, 1, 'IMG/WMNSNIKEAIRMAXCORRELATE.avif', NULL, 3, '2025-05-30 15:59:23', 1),
(77, 'Nike Sb Dunk Low Retro Azul', 'Nike Sb Dunk Low Retro Azul. Destacan por su diseño atemporal; perfectas para los amantes del skateboarding', 170000, 1, 'IMG/Zapatos-Nike-SB-Dunk-Low-Retro-Azul-Blanco-Coast-Zapatilla-para-mujer-y-nino-Trainers-Sneakers-online-tenis-zapatillas-shoes-tienda-en-colombia-en-oferta.webp', NULL, 3, '2025-05-30 16:03:31', 1),
(78, 'Nike Court Legacy Lift negro', 'Nike Court Legacy Lift negro. Disfruta de una comodidad inigualable; esta zapatilla fusiona estilo y funcionalidad ', 170000, 1, 'IMG/w800h800fitpad.avif', NULL, 3, '2025-05-30 16:07:36', 1),
(79, 'Nike Air Force 1 \'07LX', 'Nike Air Force 1 \'07LX. Cómodos, sofisticados y con una icónica confección de los 80, el complemento perfecto para tu outfit', 175000, 3, 'IMG/742497-800-auto.webp', NULL, 3, '2025-05-30 16:13:24', 1),
(80, 'Puma Suede Xl negro', 'Puma Suede Xl negro. Su diseño esta inspirado en los clasicos de los 80, son la combinación perfecta de confort y estilo; con su estilo retro y elegancia atemporal', 175000, 3, 'IMG/Tenis-para-mujer-Suede-XL.avif', NULL, 15, '2025-05-30 16:43:42', 1),
(81, 'Puma Palermo Rosada-Verde', 'Puma Palermo Rosada-Verde. Únicas para ti, ya que combinan un estilo contemporáneo y atemporal', 165000, 4, 'IMG/Tenis-Palermo-Special-para-mujer.avif', NULL, 15, '2025-05-30 16:50:06', 1),
(82, 'Puma Roma Reversed rojas ', 'Puma Roma Reversed. Un estilo deportivo convertido en urbano', 170000, 1, 'IMG/puma-roma-reversed-for-all-time-red-392263-01_1.jpg', NULL, 15, '2025-05-30 16:59:26', 1),
(83, 'Puma Suede Terrace Negro', 'Puma Suede Terrace Negro. Estilo y comodidad superiores, estas zapatillas son un clásico atemporal', 165000, 2, 'IMG/A11371_4o9RHxgv.jpeg', NULL, 15, '2025-05-30 17:09:40', 1),
(84, 'Puma Suede Xl amarillo', 'Puma Suede Xl. Su diseño esta inspirado en los clasicos de los 80, son la combinación perfecta de confort y estilo; con su estilo retro y elegancia atemporal', 165000, 4, 'IMG/001514901_101.avif', NULL, 10, '2025-05-30 17:17:06', 1),
(85, 'Puma Park Lifestyle OG blanco-negro', 'Puma Park Lifestyle OG. Su estilo inspirado en el skate te ayudará a conquistar terrenos urbanos', 175000, 2, 'IMG/Tenis-Park-Lifestyle-OG.avif', NULL, 15, '2025-05-30 17:23:34', 1),
(86, 'Fila Fusion Mars beige-morado-azul', 'Fila Fusion Mars. Estas zapatillas llegan para brindarte una mejor experiencia en calzado, combinando un comodidad con un diseño vanguardista ', 170000, 1, 'IMG/Zapatos-Fila-Fusion-Mars-Beige-Morado-Azul-tenis-para-mujer-y-nino-Trainers-Sneakers-online-tenis-zapatillas-shoes-tienda-en-colombia-en-oferta0.webp', NULL, 16, '2025-05-30 19:13:49', 1),
(87, 'New Balance 530 blancas-lila', 'New Balance 530. Su diseño atemporal combina elementos clásicos con detalles modernos, la combinación perfecta entre estilo y comodidad ', 175000, 2, 'IMG/New-Balance-530-Lila-tenis-para-mujer-Trainers-Sneakers-online-tenis-zapatillas-shoes-tienda-en-colombia-en-oferta1.webp', NULL, 17, '2025-05-30 19:37:45', 1),
(88, 'New Balance 327 Leopardo', 'New Balance 327. Estas zapatillas son la reconceptualización de la linea de running new balance', 170000, 2, 'IMG/200021720304950.jpg', NULL, 17, '2025-05-30 19:48:59', 1),
(89, 'New Balance 327 blanco-negro', 'New Balance 327. Estas zapatillas son la reconceptualización de la linea de running new balance', 170000, 2, 'IMG/MS327CWB-1.webp', NULL, 17, '2025-05-30 19:55:01', 1),
(90, 'New Balance 327 beige-café', 'New Balance 327. Estas zapatillas son la reconceptualización de la linea de running new balance', 170000, 2, 'IMG/tenis-new-balance-lifestyle-mode-de-vie-blanco-128030BL.jpg_EPvvnNDVOvix2OEYbz53pgU919ORSgX2LlEWTcutMaHU9UPmdi.jpg', NULL, 17, '2025-05-30 19:57:31', 1),
(91, 'New Balance 327 negro-blanco', 'New Balance 327. Estas zapatillas son la reconceptualización de la linea de running new balance', 170000, 1, 'IMG/public.avif', NULL, 17, '2025-05-30 20:03:26', 1),
(92, 'New Balance Running ', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total .', 180000, 1, 'IMG/images_1.jpeg', NULL, 11, '2025-05-30 20:11:15', 1),
(93, 'New Balance Running AT ', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total .', 180000, 1, 'IMG/MTMORAB3-1_grande.webp', NULL, 11, '2025-05-30 20:13:16', 1),
(94, 'New Balance Running AT ', 'Las New Balance Running diseñada para ofrecer una experiencia suave, pero estable, bajo los pies con una comodidad total .', 180000, 1, 'IMG/eyJidWNrZXQiOiJic3RuLWltYWdlLXNlcnZlciIsImtleSI6ImNhdGFsb2cvcHJvZHVjdC9XVE1PUlVHMy9XVE1PUlVHMy0wMy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsiZml0IjoiY29udGFpbiIsIndpZHRoIjo1ODAsImhlaWdodCI6NzI1LCJiYWNrZ3JvdW5k.webp', NULL, 11, '2025-05-30 20:16:22', 1),
(95, 'Tenis On Running Fósil ', 'Los On Running Cloudmonster 2 Fósil son perfectas para carreras de entrenamiento o esfuerzos dinámicos al aportar más amortiguación en cada zancada', 180000, 1, 'IMG/92290-1_panske-boty-on-running-cloudrunner-2-fossil-indigo.webp', NULL, 14, '2025-05-30 20:20:54', 1),
(96, 'Tenis On Running Aguamarina', 'Los On Running Cloudmonster 2 son perfectas para carreras de entrenamiento o esfuerzos dinámicos al aportar más amortiguación en cada zancada', 180000, 1, 'IMG/images_2.jpeg', NULL, 14, '2025-05-30 20:22:36', 1),
(97, 'Veja Campo Leather blanca-rosada', 'Veja Campo Leather. Clásicos, y cómodos perfectos para toda ocasión  ', 165000, 1, 'IMG/veja-zapatillas-campo-cuero-blanco-CP0503886_1.jpg', NULL, 18, '2025-05-30 20:30:50', 1),
(98, 'Veja Campo Leather blanca-azul', 'Veja Campo Leather. Clásicos, y cómodos perfectos para toda ocasión ', 165000, 1, 'IMG/veja-zapatillas-campo-cuero-blanco-CP0503121_1.jpg', NULL, 18, '2025-05-30 20:32:57', 1),
(99, 'Veja Recife Low Leather blanco-azul aguamarina', 'Veja Recife Low Leather. Comodidad y estilo en una sola zapatilla, su cuero sintético hace mas fácil su limpieza ', 165000, 1, 'IMG/w800h800fitpad_1.avif', NULL, 18, '2025-05-30 20:42:16', 1),
(100, 'Reebok Classic Leather negro', 'Reebok Classic Leather. Estas zapatillas aportan un estilo sencillo pero atemporal a tu outfit', 170000, 1, 'IMG/784915-800-auto.webp', NULL, 19, '2025-05-30 20:50:24', 1),
(101, 'Reebok Classic Leather blanco', 'Reebok Classic Leather. Estas zapatillas aportan un estilo sencillo pero atemporal a tu outfit', 170000, 2, 'IMG/1145063-800-auto.webp', NULL, 19, '2025-05-30 20:52:51', 1),
(102, 'Reebok X Beams club', 'Reebok X Beams club. Comodidad y estilo son lo que estas zapatillas pueden ofrecer a tu look ', 170000, 2, 'IMG/1A98BBFB-4E35-42CB-B2AE-0AC9C668B754.webp', NULL, 19, '2025-05-30 20:57:07', 1),
(103, 'Reebok Classic Bota negro', 'Reebok Classic Bota. Comodidad y soporte para usar durante todo el día ', 170000, 2, 'IMG/1145395-800-auto.webp', NULL, 19, '2025-05-30 21:00:27', 1),
(104, 'Alexander Mcqueen negro', 'Alexander Mcqueen. Clásicos y fáciles de limpiar la combinación perfecta', 175000, 1, 'IMG/Large-553770WIEE01000_F.jpg', NULL, 20, '2025-05-30 21:06:52', 1),
(105, 'Alexander Mcqueen blanco-negro', 'Alexander Mcqueen. Clásicos y fáciles de limpiar la combinación perfecta', 175000, 2, 'IMG/Large-553770WIEF19061_F.jpg', NULL, 20, '2025-05-30 21:12:07', 1),
(106, 'Valentino Garavani blanco', 'Valentino Garavani. En estas zapatillas puedes encontrar comodidad y elegancia', 170000, 1, 'IMG/VALENTINO.webp', NULL, 21, '2025-05-30 21:16:41', 1),
(107, 'Skechers D´lux Walker 2.0 azul-rosado', 'Skechers D´lux Walker 2.0. Estas zapatillas se adaptan perfectamente a la forma de tu pie, brindando un soporte en cada paso que das ', 170000, 2, 'IMG/D_NQ_NP_893864-MCO82271273855_022025-O.png', NULL, 22, '2025-05-30 21:45:22', 1),
(108, 'Nike', 'Skechers D´lux Walker 2.0. Estas zapatillas se adaptan perfectamente a la forma de tu pie, brindando un soporte en cada paso que das', 450000, 10, 'IMG/nike_1102092010.webp', NULL, 3, '2025-05-31 00:37:16', 0),
(109, 'Asics Gel Kinsei Max blanca', 'Asics Gel Kinsei Max. Estas zapatillas se diseñaron especialmente para corredores que buscan una sensación de suavidad en cada paso ', 180000, 2, 'IMG/1012B512_100_SR_RT_GLB.webp', NULL, 23, '2025-05-31 15:41:05', 1),
(110, 'Asics Novablast 4 TR Nature Bathing', 'Novablast 4 TR Nature Bathing. Ideal para senderos y superficiees todoterreno, ya que presentan un alto retorno de energia', 180000, 1, 'IMG/1039748-1600-auto.webp', NULL, 23, '2025-05-31 15:47:26', 1),
(111, 'Versace Chain ', 'Versace Chain. Elegancia y estilo; cada paso con esta zapatilla se vuelve un viaje por el lujo y la exclusividad ', 175000, 2, 'IMG/CHAIN-10.jpg', NULL, 24, '2025-05-31 15:59:35', 1),
(112, 'Nike Tn negro', 'Nike Tn. Una experiencia Air Max que ofrece estabilidad y amortiguación, eleva tu estilo con las Nike Tn ', 175000, 6, 'IMG/AIRMAXPLUS.avif', NULL, 25, '2025-05-31 16:13:03', 1),
(113, 'Nike Tn X Lacoste blanco-verde', 'Nike Tn X Lacoste. Una experiencia Air Max que ofrece estabilidad y amortiguación, eleva tu estilo con las Nike Tn ', 175000, 2, 'IMG/1438.jpg', NULL, 25, '2025-05-31 16:16:17', 1),
(114, 'Nike Air Max Dn blanco', 'Nike Air Max Dn . Diseño deportivo y contemporáneo, con icónica burbuja de aire visible en la suela ', 165000, 1, 'IMG/685727-800-auto_1.webp', NULL, 25, '2025-05-31 16:24:49', 1),
(115, 'Nike Air Max 90 blanco', 'Nike Air Max 90. Su silueta clásica facilita su combinación, elevando estilos formales y atléticos sin ningún esfuerzo ', 170000, 1, 'IMG/15950141_36455204_600.jpg', NULL, 25, '2025-05-31 16:31:31', 1),
(116, 'Nike Tn blanco', 'Nike Tn. Una experiencia Air Max que ofrece estabilidad y amortiguación, eleva tu estilo con las Nike Tn', 175000, 2, 'IMG/AIRMAXPLUS_12.avif', NULL, 25, '2025-05-31 19:48:25', 1),
(117, 'Nike Air Max SDNR negro', 'Nike Air Max SDNR. Descubre el máximo confort y estilo con estas zapatillas ', 170000, 1, 'IMG/26931672_57060165_1000.jpg', NULL, 25, '2025-05-31 19:56:26', 1),
(118, 'Nike Sacai blanca', 'Nike Sacai. Estas zapatillas te crean el look perfecto par cualquier actividad que puedas imaginar', 175000, 1, 'IMG/fecha-de-lanzamiento-de-las-nike-x-sacai-vaporwaffle-white-and-gum-dd1875-100.avif', NULL, 25, '2025-05-31 20:07:15', 1),
(119, 'Nike Sacai VaporWaffle', 'Nike Sacai VaporWaffle. Estas zapatillas te crean el look perfecto par cualquier actividad que puedas imaginar', 175000, 1, 'IMG/nike-x-sacai-vaporwaffle-royal-fuchsia-release-date.avif', NULL, 25, '2025-05-31 20:25:30', 1),
(120, 'Nike Nocta Glide verde militar', 'Nike Nocta Glide. Este modelo inspirado en el clásico nike zoom destaca por su llamativa suela, aportando comodidad y estilo ', 170000, 1, 'IMG/64b9fb3fdaee260fce90fc090ab7083a25696027.jpg', NULL, 25, '2025-05-31 20:54:48', 1),
(121, 'Nike Air Max Pulse Roam verde militar', 'Nike Air Max Pulse Roam. Elegante, cómoda y con estilo, todo lo que buscas está en esta zapatilla ', 175000, 2, 'IMG/669bad28_acf1_4320_bd2a_1f474f7be504.webp', NULL, 25, '2025-05-31 21:52:41', 1),
(122, 'Nike Air Max 97 Medium brown ', 'Nike Air Max 97. Su plantilla mejorada tiene un mejor amortiguación en el tobillo; tan polifacéticas cómo tú', 170000, 1, 'IMG/air-max-97-medium-brown.jpg', NULL, 25, '2025-05-31 22:15:16', 1),
(123, 'Nike Invincible Run 3 blanco-azul ', 'Nike Invincible Run 3. La máxima amortiguación de esta zapatilla proporciona una pisada mas cómoda para las carreras del día a día ', 175000, 1, 'IMG/FZ5056-103.jpg', NULL, 25, '2025-05-31 22:26:41', 1),
(124, 'Nike Invincible Run 3 negro', 'Nike Invincible Run 3. La máxima amortiguación de esta zapatilla proporciona una pisada mas cómoda para las carreras del día a día ', 175000, 1, 'IMG/ZOOMXINVINCIBLERUN3WIDE.avif', NULL, 25, '2025-05-31 22:30:24', 1),
(125, 'Nike Phoenix Waffle Leather blanco-negro', 'Nike Phoenix Waffle Leather. Gracias a su renovada suela waffle y su entresuela mas alta ofrecen una mayor comodidad', 165000, 1, 'IMG/p25-nike-fq8721-102.webp', NULL, 25, '2025-05-31 22:53:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `correoUser` varchar(130) NOT NULL,
  `nameUser` varchar(80) NOT NULL,
  `passwordUser` varchar(120) NOT NULL,
  `telefonoUser` varchar(80) NOT NULL,
  `rolUser` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `correoUser`, `nameUser`, `passwordUser`, `telefonoUser`, `rolUser`) VALUES
(1, 'alejandroariza.cr@gmail.com', 'Alejandro', 'pbkdf2:sha256:1000000$RMVyZLoUk9ll39VQ$d8f11512f21ccb40c2a083c2e8458032d6e531ac53f8b7a73c2a7efea8fe7bcd', '3133619030', 'administrador'),
(2, 'franco@gmail.com', 'Franco', 'pbkdf2:sha256:1000000$mPucsVJorZbOhUld$089e75284b6c528b57135e9795e5265810c92090715982a54cbce690647259aa', '3214284418', 'administrador'),
(3, 'angipaez853@gmail.com', 'Tatiana', 'pbkdf2:sha256:1000000$eTCGdsff9LQAzvqm$c4263717bb1b2dfa1ff7fa16827f61aab5a77fc4943ccd0cce86115a0ce1c4f2', '3227327914', 'administrador'),
(4, 'nataram665@gmail.com', 'Natalia', 'pbkdf2:sha256:1000000$s1HWsZajDDba2nXB$20421446ffc8012ee159a7ef88383a03e8564460f31675dc895fed524218b248', '3133327040', 'administrador'),
(5, 'juandavid@gmail.com', 'David', 'pbkdf2:sha256:1000000$JVjJSzGbG9vnWwsa$b2fe55a9cbfded13f079737436e13a9e085710cf53dfd735255872d011eaa992', '3213234321', 'cliente'),
(6, 'jherycortes121625@gmail.com', 'Jhery Nicoll', 'pbkdf2:sha256:1000000$CcSlzDLVIAfYhqe6$8bfc68064b966823926ce865f1dbd79d814d8802695725a5e880ce537759b80e', '3233454844', 'cliente'),
(8, 'karen_123@gmail.com', 'Karen', 'pbkdf2:sha256:1000000$hMTYK956wrDvQU7Q$1d04e4729d5e4b3419da550d1034546c8018cdb6cd1115dc2a0f799e116dc8dc', '3213234324', 'cliente'),
(9, 'nicolas11101753800@gmail.com', 'nicolasfontech', 'pbkdf2:sha256:1000000$qdynx3HhPbd4D3aU$9272185f6dc1ae351c5b52b98c2a8f0a8fc7327a17d7c18f848ce4221875d0be', '3188307942', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `nombreCategoria` (`nombreCategoria`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `correoUser` (`correoUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Filtros para la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD CONSTRAINT `detalles_factura_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  ADD CONSTRAINT `detalles_factura_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`idUser`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
