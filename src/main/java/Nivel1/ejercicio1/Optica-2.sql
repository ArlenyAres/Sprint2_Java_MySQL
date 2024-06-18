-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 18-06-2024 a las 13:10:03
-- Versión del servidor: 5.7.39
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Teléfono` varchar(15) NOT NULL,
  `Correo_Electrónico` varchar(100) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `ID_Recomendador` int(11) DEFAULT NULL,
  `ID_Dirección` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dirección`
--

CREATE TABLE `Dirección` (
  `ID_Dirección` int(11) NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `Número` varchar(10) NOT NULL,
  `Piso` varchar(10) DEFAULT NULL,
  `Puerta` varchar(10) DEFAULT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Código_Postal` varchar(10) NOT NULL,
  `País` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Teléfono` varchar(15) NOT NULL,
  `Correo_Electrónico` varchar(100) DEFAULT NULL,
  `ID_Dirección` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gafas`
--

CREATE TABLE `Gafas` (
  `ID_Gafas` int(11) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Graduación_Ojo_Derecho` decimal(4,2) NOT NULL,
  `Graduación_Ojo_Izquierdo` decimal(4,2) NOT NULL,
  `Tipo_Montura` enum('flotante','pasta','metálica') NOT NULL,
  `Color_Montura` varchar(20) NOT NULL,
  `Color_Cristal_Derecho` varchar(20) NOT NULL,
  `Color_Cristal_Izquierdo` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Teléfono` varchar(15) NOT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `NIF` varchar(20) NOT NULL,
  `ID_Dirección` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Venta`
--

CREATE TABLE `Venta` (
  `ID_Venta` int(11) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `ID_Gafas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `ID_Recomendador` (`ID_Recomendador`),
  ADD KEY `ID_Dirección` (`ID_Dirección`);

--
-- Indices de la tabla `Dirección`
--
ALTER TABLE `Dirección`
  ADD PRIMARY KEY (`ID_Dirección`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_Dirección` (`ID_Dirección`);

--
-- Indices de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD PRIMARY KEY (`ID_Gafas`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`),
  ADD KEY `ID_Dirección` (`ID_Dirección`);

--
-- Indices de la tabla `Venta`
--
ALTER TABLE `Venta`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Empleado` (`ID_Empleado`),
  ADD KEY `ID_Gafas` (`ID_Gafas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Dirección`
--
ALTER TABLE `Dirección`
  MODIFY `ID_Dirección` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  MODIFY `ID_Gafas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Venta`
--
ALTER TABLE `Venta`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_Recomendador`) REFERENCES `Cliente` (`ID_Cliente`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ID_Dirección`) REFERENCES `Dirección` (`ID_Dirección`);

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_Dirección`) REFERENCES `Dirección` (`ID_Dirección`);

--
-- Filtros para la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`ID_Dirección`) REFERENCES `Dirección` (`ID_Dirección`);

--
-- Filtros para la tabla `Venta`
--
ALTER TABLE `Venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Cliente` (`ID_Cliente`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `Empleado` (`ID_Empleado`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`ID_Gafas`) REFERENCES `Gafas` (`ID_Gafas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
