-- phpMyAdmin SQL Dump
-- version 3.4.4
-- http://www.phpmyadmin.net
--
-- Servidor: mysql.webcindario.com
-- Tiempo de generación: 16-02-2020 a las 23:23:36
-- Versión del servidor: 5.6.39
-- Versión de PHP: 5.6.40-13+0~20191026.23+debian9~1.gbp37e45b

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `solucionesj3`
--
CREATE DATABASE `solucionesj3` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `solucionesj3`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Arduino_Sucursal`
--

CREATE TABLE IF NOT EXISTS `Arduino_Sucursal` (
  `Id_Relacionado` int(5) NOT NULL AUTO_INCREMENT,
  `Id_Arduino` int(5) DEFAULT NULL,
  `Id_Sucursal` int(5) DEFAULT NULL,
  `Fecha` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Relacionado`),
  KEY `Id_Arduino` (`Id_Arduino`),
  KEY `Id_Sucursal` (`Id_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Arduinos`
--

CREATE TABLE IF NOT EXISTS `Arduinos` (
  `Id` int(5) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(20) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Arduinos`
--

INSERT INTO `Arduinos` (`Id`, `Modelo`, `Descripcion`) VALUES
(1, 'msa5590', 'El arduino fue configurado en marzo de 2019, funci'),
(2, 'jap4857', 'El arduino fue configurado en junio de 2018, funci'),
(3, 'lol1010', 'El arduino fue configurado en octubre de 2015, hay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sensores`
--

CREATE TABLE IF NOT EXISTS `Sensores` (
  `Id_Sensor` int(5) DEFAULT NULL,
  `Id_Arduino` int(5) DEFAULT NULL,
  `Arduino` varchar(20) DEFAULT NULL,
  `Id_Sucursal` int(5) DEFAULT NULL,
  `Sucursal` varchar(20) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  KEY `Id_Arduino` (`Id_Arduino`),
  KEY `Id_Sucursal` (`Id_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sucursales`
--

CREATE TABLE IF NOT EXISTS `Sucursales` (
  `Id` int(5) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Sucursales`
--

INSERT INTO `Sucursales` (`Id`, `Nombre`, `Direccion`) VALUES
(1, 'Beyota Chacarita', 'Dorrego 973'),
(2, 'Beyota Microcentro', 'Paraguay 852'),
(3, 'Beyota Caballito', 'Rojas 213');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Id` int(5) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(20) DEFAULT NULL,
  `Password` int(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Id`, `Usuario`, `Password`) VALUES
(1, 'GOBET', 123),
(2, 'JIMENEZ', 456),
(3, 'COURLEANDER', 789);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Arduino_Sucursal`
--
ALTER TABLE `Arduino_Sucursal`
  ADD CONSTRAINT `Arduino_Sucursal_ibfk_1` FOREIGN KEY (`Id_Arduino`) REFERENCES `Arduinos` (`Id`),
  ADD CONSTRAINT `Arduino_Sucursal_ibfk_2` FOREIGN KEY (`Id_Sucursal`) REFERENCES `Sucursales` (`Id`);

--
-- Filtros para la tabla `Sensores`
--
ALTER TABLE `Sensores`
  ADD CONSTRAINT `Sensores_ibfk_1` FOREIGN KEY (`Id_Arduino`) REFERENCES `Arduinos` (`Id`),
  ADD CONSTRAINT `Sensores_ibfk_2` FOREIGN KEY (`Id_Sucursal`) REFERENCES `Sucursales` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
