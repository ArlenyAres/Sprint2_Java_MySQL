# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.28-MariaDB)
# Base de datos: optica_Cul_d_Ampolla
# Tiempo de Generación: 2024-06-08 18:23:38 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla Clientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Clientes`;

CREATE TABLE `Clientes` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Direccion_Postal` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo_Electronico` varchar(255) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `Cliente_recomendador_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `fk_recomendador` (`Cliente_recomendador_ID`),
  CONSTRAINT `fk_recomendador` FOREIGN KEY (`Cliente_recomendador_ID`) REFERENCES `Clientes` (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla Empleados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Empleados`;

CREATE TABLE `Empleados` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla Gafas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Gafas`;

CREATE TABLE `Gafas` (
  `ID_Gafa` int(11) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(250) NOT NULL,
  `Color_Montura` varchar(50) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `Graduacion_derecho` decimal(10,0) NOT NULL,
  `Graduacion_izquierdo` decimal(10,0) NOT NULL,
  `Color_cristal_izquierdo` varchar(50) NOT NULL,
  `Tipo_montura` enum('flotante','pasta','metalica') NOT NULL,
  PRIMARY KEY (`ID_Gafa`),
  KEY `Gafas_Proveedores_FK` (`ID_Proveedor`),
  CONSTRAINT `Gafas_Proveedores_FK` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla Proveedores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Proveedores`;

CREATE TABLE `Proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `Numero_Calle` int(11) NOT NULL,
  `Piso` varchar(20) DEFAULT NULL,
  `Puerta` varchar(20) DEFAULT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Codigo_Postal` int(11) NOT NULL,
  `Pais` varchar(255) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `NIF` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla Ventas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ventas`;

CREATE TABLE `Ventas` (
  `ID_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Gafa` int(11) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `Ventas_Gafas_FK` (`ID_Gafa`),
  KEY `Ventas_Empleados_FK` (`ID_Empleado`),
  KEY `Ventas_Clientes_FK` (`ID_Cliente`),
  CONSTRAINT `Ventas_Clientes_FK` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`),
  CONSTRAINT `Ventas_Empleados_FK` FOREIGN KEY (`ID_Empleado`) REFERENCES `Empleados` (`ID_Empleado`),
  CONSTRAINT `Ventas_Gafas_FK` FOREIGN KEY (`ID_Gafa`) REFERENCES `Gafas` (`ID_Gafa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
