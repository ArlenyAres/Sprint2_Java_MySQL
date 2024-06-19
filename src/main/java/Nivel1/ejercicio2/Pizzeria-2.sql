-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 18-06-2024 a las 13:30:10
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
-- Base de datos: `Pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria_Pizza`
--

CREATE TABLE `Categoria_Pizza` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Dirección` varchar(200) NOT NULL,
  `Código_Postal` varchar(10) NOT NULL,
  `ID_Localidad` int(11) DEFAULT NULL,
  `ID_Provincia` int(11) DEFAULT NULL,
  `Teléfono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle_Pedido`
--

CREATE TABLE `Detalle_Pedido` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `NIF` varchar(20) NOT NULL,
  `Teléfono` varchar(15) NOT NULL,
  `Rol` enum('Cocinero','Repartidor') NOT NULL,
  `ID_Tienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Localidad`
--

CREATE TABLE `Localidad` (
  `ID_Localidad` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ID_Provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedido`
--

CREATE TABLE `Pedido` (
  `ID_Pedido` int(11) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Tipo` enum('Domicilio','Tienda') NOT NULL,
  `Cantidad_Productos` int(11) NOT NULL,
  `Precio_Total` decimal(10,2) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Tienda` int(11) DEFAULT NULL,
  `ID_Repartidor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pizza`
--

CREATE TABLE `Pizza` (
  `ID_Pizza` int(11) NOT NULL,
  `ID_Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripción` text,
  `Imagen` varchar(200) DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provincia`
--

CREATE TABLE `Provincia` (
  `ID_Provincia` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tienda`
--

CREATE TABLE `Tienda` (
  `ID_Tienda` int(11) NOT NULL,
  `Dirección` varchar(200) NOT NULL,
  `Código_Postal` varchar(10) NOT NULL,
  `ID_Localidad` int(11) DEFAULT NULL,
  `ID_Provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categoria_Pizza`
--
ALTER TABLE `Categoria_Pizza`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `ID_Localidad` (`ID_Localidad`),
  ADD KEY `ID_Provincia` (`ID_Provincia`);

--
-- Indices de la tabla `Detalle_Pedido`
--
ALTER TABLE `Detalle_Pedido`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_Tienda` (`ID_Tienda`);

--
-- Indices de la tabla `Localidad`
--
ALTER TABLE `Localidad`
  ADD PRIMARY KEY (`ID_Localidad`),
  ADD KEY `ID_Provincia` (`ID_Provincia`);

--
-- Indices de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Tienda` (`ID_Tienda`),
  ADD KEY `ID_Repartidor` (`ID_Repartidor`);

--
-- Indices de la tabla `Pizza`
--
ALTER TABLE `Pizza`
  ADD PRIMARY KEY (`ID_Pizza`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `Provincia`
--
ALTER TABLE `Provincia`
  ADD PRIMARY KEY (`ID_Provincia`);

--
-- Indices de la tabla `Tienda`
--
ALTER TABLE `Tienda`
  ADD PRIMARY KEY (`ID_Tienda`),
  ADD KEY `ID_Localidad` (`ID_Localidad`),
  ADD KEY `ID_Provincia` (`ID_Provincia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categoria_Pizza`
--
ALTER TABLE `Categoria_Pizza`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Detalle_Pedido`
--
ALTER TABLE `Detalle_Pedido`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Localidad`
--
ALTER TABLE `Localidad`
  MODIFY `ID_Localidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Provincia`
--
ALTER TABLE `Provincia`
  MODIFY `ID_Provincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tienda`
--
ALTER TABLE `Tienda`
  MODIFY `ID_Tienda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_Localidad`) REFERENCES `Localidad` (`ID_Localidad`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ID_Provincia`) REFERENCES `Provincia` (`ID_Provincia`);

--
-- Filtros para la tabla `Detalle_Pedido`
--
ALTER TABLE `Detalle_Pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `Pedido` (`ID_Pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `Producto` (`ID_Producto`);

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_Tienda`) REFERENCES `Tienda` (`ID_Tienda`);

--
-- Filtros para la tabla `Localidad`
--
ALTER TABLE `Localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`ID_Provincia`) REFERENCES `Provincia` (`ID_Provincia`);

--
-- Filtros para la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Cliente` (`ID_Cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`ID_Tienda`) REFERENCES `Tienda` (`ID_Tienda`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`ID_Repartidor`) REFERENCES `Empleado` (`ID_Empleado`);

--
-- Filtros para la tabla `Pizza`
--
ALTER TABLE `Pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`ID_Pizza`) REFERENCES `Producto` (`ID_Producto`),
  ADD CONSTRAINT `pizza_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categoria_Pizza` (`ID_Categoria`);

--
-- Filtros para la tabla `Tienda`
--
ALTER TABLE `Tienda`
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`ID_Localidad`) REFERENCES `Localidad` (`ID_Localidad`),
  ADD CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`ID_Provincia`) REFERENCES `Provincia` (`ID_Provincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
