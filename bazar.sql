-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-11-2021 a las 02:12:55
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bazar`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `eliminar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_producto` (IN `id` INT)  begin
delete from producto where idProducto = id;
end$$

DROP PROCEDURE IF EXISTS `insertar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_producto` (IN `nom` VARCHAR(45), IN `precio` INT, IN `descrip` VARCHAR(140), IN `tipo` INT, IN `img` VARCHAR(45))  begin
insert into producto(nombre,precio,descripcion,tipo,imagen) values (nom,precio,descrip,tipo, img);
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoriaproducto`
--

DROP TABLE IF EXISTS `auditoriaproducto`;
CREATE TABLE IF NOT EXISTS `auditoriaproducto` (
  `idAuditoriaProducto` int(11) NOT NULL,
  `Copia_nombre` varchar(45) DEFAULT NULL,
  `Copia_Precio` varchar(45) DEFAULT NULL,
  `Copia_tipo` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `Movimiento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auditoriaproducto`
--

INSERT INTO `auditoriaproducto` (`idAuditoriaProducto`, `Copia_nombre`, `Copia_Precio`, `Copia_tipo`, `usuario`, `fecha`, `Movimiento`) VALUES
(1, 'camisa', '85', '2', 'root@localhost', '2021-11-20 13:39:01.000000', 'insert'),
(2, 'sueter', '800', '2', 'root@localhost', '2021-11-20 13:39:01.000000', 'insert'),
(3, 'camisa', '85', '2', 'root@localhost', '2021-11-20 13:39:01.000000', 'insert'),
(4, 'camisa de cuadros', '67', '2', 'root@localhost', '2021-11-20 13:39:01.000000', 'insert'),
(5, 'pantalon deportivo', '764', '2', 'root@localhost', '2021-11-20 13:39:01.000000', 'insert'),
(6, 'playera', '899', '2', 'root@localhost', '2021-11-20 13:42:54.000000', 'insert'),
(7, 'playera', '899', '3', 'root@localhost', '2021-11-24 17:33:16.000000', 'update'),
(8, 'camisa', '85', '3', 'root@localhost', '2021-11-24 17:33:58.000000', 'update'),
(9, 'camisa de cuadros', '67', '3', 'root@localhost', '2021-11-24 17:34:07.000000', 'update'),
(10, 'camisa', '85', '1', 'root@localhost', '2021-11-24 17:34:33.000000', 'update');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoproducto`
--

DROP TABLE IF EXISTS `catalogoproducto`;
CREATE TABLE IF NOT EXISTS `catalogoproducto` (
  `idCatalogoProducto` int(11) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCatalogoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catalogoproducto`
--

INSERT INTO `catalogoproducto` (`idCatalogoProducto`, `Tipo`) VALUES
(1, 'Camisa'),
(2, 'Reloj'),
(3, 'Vestido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Descripcion` varchar(140) DEFAULT NULL,
  `Tipo` int(11) NOT NULL,
  `Imagen` varchar(45) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombre`, `Precio`, `Descripcion`, `Tipo`, `Imagen`, `usuario`) VALUES
(23, 'Camisa mao', 350, 'Camisa en tono rojo, su diseÃ±o mao da el toque de elegancia minimalista que todo hombre necesita.', 1, 'images/e.jpg', 'Panchita'),
(26, 'Reloj CRRJU', 945, 'Reloj negro, un reloj con el estilo perfecto para todos los caballeros que saben lucir su excelente clase.', 2, 'images/6.jpg', 'Panchita'),
(27, 'Vestido primaveral', 569, 'Vestido rojo, un vestido muy casual lleno de alegria y diseÃ±o fantÃ¡sticos ideales para relucir en todo momento.', 3, 'images/h.jpg', 'Panchita'),
(28, 'Camisa diseÃ±o', 320, 'Camisa blanca con diseÃ±o, un look libre que expresa toda la personalidad alegre para las ocasiones donde el momento no importa.', 1, 'images/w.jpg', 'Juan '),
(29, 'Reloj LV', 999, 'Reloj LV, la elegancia en accesorio, adquierelo por este medio, es un producto totalmente original y en excelente estado.', 2, 'images/b.jpg', 'Juan '),
(30, 'Vestido JC', 789, 'Vestido esmeralda, un color lleno de todo el glamour necesario para asistir a esos eventos en donde el momento lo amerita.', 3, 'images/j.jpg', 'Juan '),
(31, 'Camisa corta', 290, 'Camisa corta en color rosa, un color muy llamativo, puro y lleno de estilo que combina con tu personalidad.', 1, 'images/y.jpg', 'Karen'),
(32, 'Reloj Hewitt', 879, 'Reloj Hewitt en tono negro, la marca y el color hablan por sÃ­ solos, excelente oportunidad para los amantes del accesorio.', 2, 'images/m.jpg', 'Karen'),
(33, 'Vestido Drak', 985, 'Un vestido negro totalmente fascinado con la naturaleza del modismo dark, muy elegante y perfecto para todas.', 3, 'images/f.jpg', 'Karen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL,
  `User` varchar(45) NOT NULL,
  `Contrasenia` varchar(45) NOT NULL,
  `Tipo` varchar(1) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `User`, `Contrasenia`, `Tipo`) VALUES
(1, 'Juan', 'iguano', '1'),
(2, 'Aaron', '12345', '1'),
(3, 'Pedro', '11111', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tipo` int(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `usuario`, `password`, `tipo`) VALUES
(1, 'Juan Guevara', 'Juan', 'iguano', 1),
(3, 'Sandra', 'sandy', 'sandy', 1),
(4, 'aaron', 'aaron', 'aaron', 1),
(5, 'Karen', 'Karen', 'novia', 1),
(6, 'Panchita', 'Panchita', 'chimbo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `idVentas` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `VecesVendido` int(11) NOT NULL,
  PRIMARY KEY (`idVentas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVentas`, `idProducto`, `VecesVendido`) VALUES
(1, 1, 10),
(2, 2, 7),
(3, 3, 9),
(4, 37, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
