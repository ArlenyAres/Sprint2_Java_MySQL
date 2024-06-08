# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.28-MariaDB)
# Base de datos: Pizzeria
# Tiempo de Generación: 2024-06-08 18:20:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla CATEGORIAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CATEGORIAS`;

CREATE TABLE `CATEGORIAS` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla CLIENTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENTES`;

CREATE TABLE `CLIENTES` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Codigo_Postal` varchar(100) NOT NULL,
  `ID_Localidad` int(11) NOT NULL,
  `ID_Provincia` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `CLIENTES_LOCALIDADES_FK` (`ID_Localidad`),
  KEY `CLIENTES_PROVINCIAS_FK` (`ID_Provincia`),
  CONSTRAINT `CLIENTES_LOCALIDADES_FK` FOREIGN KEY (`ID_Localidad`) REFERENCES `LOCALIDADES` (`ID_Localidad`),
  CONSTRAINT `CLIENTES_PROVINCIAS_FK` FOREIGN KEY (`ID_Provincia`) REFERENCES `PROVINCIAS` (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla EMPLEADOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMPLEADOS`;

CREATE TABLE `EMPLEADOS` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `NIF` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Rol` enum('Cocinero','Repartidor') DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla ENTREGAS_PEDIDOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ENTREGAS_PEDIDOS`;

CREATE TABLE `ENTREGAS_PEDIDOS` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha_Hola_Entrega` datetime NOT NULL,
  PRIMARY KEY (`ID_Empleado`,`ID_Pedido`),
  KEY `ENTREGAS_PEDIDOS_PEDIDOS_FK` (`ID_Pedido`),
  CONSTRAINT `ENTREGAS_PEDIDOS_EMPLEADOS_FK` FOREIGN KEY (`ID_Empleado`) REFERENCES `EMPLEADOS` (`ID_Empleado`),
  CONSTRAINT `ENTREGAS_PEDIDOS_PEDIDOS_FK` FOREIGN KEY (`ID_Pedido`) REFERENCES `PEDIDOS` (`ID_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla LOCALIDADES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LOCALIDADES`;

CREATE TABLE `LOCALIDADES` (
  `ID_Localidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `ID_Provincia` int(11) NOT NULL,
  PRIMARY KEY (`ID_Localidad`),
  KEY `LOCALIDADES_PROVINCIAS_FK` (`ID_Provincia`),
  CONSTRAINT `LOCALIDADES_PROVINCIAS_FK` FOREIGN KEY (`ID_Provincia`) REFERENCES `PROVINCIAS` (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla PEDIDOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PEDIDOS`;

CREATE TABLE `PEDIDOS` (
  `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `FechaHora` datetime NOT NULL,
  `PrecioTotal` decimal(10,0) NOT NULL,
  `ID_Tienda` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `TipoPedido` enum('Reparto','Tienda') DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `PEDIDOS_CLIENTES_FK` (`ID_Cliente`),
  KEY `PEDIDOS_TIENDAS_FK` (`ID_Tienda`),
  CONSTRAINT `PEDIDOS_CLIENTES_FK` FOREIGN KEY (`ID_Cliente`) REFERENCES `CLIENTES` (`ID_Cliente`),
  CONSTRAINT `PEDIDOS_TIENDAS_FK` FOREIGN KEY (`ID_Tienda`) REFERENCES `TIENDAS` (`ID_Tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla PRODUCTOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PRODUCTOS`;

CREATE TABLE `PRODUCTOS` (
  `ID_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(300) DEFAULT NULL,
  `ID_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `PRODUCTOS_CATEGORIAS_FK` (`ID_Categoria`),
  CONSTRAINT `PRODUCTOS_CATEGORIAS_FK` FOREIGN KEY (`ID_Categoria`) REFERENCES `CATEGORIAS` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla PRODUCTOS_PEDIDOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PRODUCTOS_PEDIDOS`;

CREATE TABLE `PRODUCTOS_PEDIDOS` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`,`ID_Pedido`),
  KEY `PRODUCTOS_PEDIDOS_PEDIDOS_FK` (`ID_Pedido`),
  CONSTRAINT `PRODUCTOS_PEDIDOS_PEDIDOS_FK` FOREIGN KEY (`ID_Pedido`) REFERENCES `PEDIDOS` (`ID_Pedido`),
  CONSTRAINT `PRODUCTOS_PEDIDOS_PRODUCTOS_FK` FOREIGN KEY (`ID_Producto`) REFERENCES `PRODUCTOS` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla PROVINCIAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROVINCIAS`;

CREATE TABLE `PROVINCIAS` (
  `ID_Provincia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla TIENDAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIENDAS`;

CREATE TABLE `TIENDAS` (
  `ID_Tienda` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(255) NOT NULL,
  `Codigo_Postal` int(11) NOT NULL,
  `ID_Localidad` int(11) NOT NULL,
  `ID_Provincia` int(11) NOT NULL,
  PRIMARY KEY (`ID_Tienda`),
  KEY `TIENDAS_LOCALIDADES_FK` (`ID_Localidad`),
  KEY `TIENDAS_PROVINCIAS_FK` (`ID_Provincia`),
  CONSTRAINT `TIENDAS_LOCALIDADES_FK` FOREIGN KEY (`ID_Localidad`) REFERENCES `LOCALIDADES` (`ID_Localidad`),
  CONSTRAINT `TIENDAS_PROVINCIAS_FK` FOREIGN KEY (`ID_Provincia`) REFERENCES `PROVINCIAS` (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
