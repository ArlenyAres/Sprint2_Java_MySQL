# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.39)
# Base de datos: youtube_BBDD
# Tiempo de Generación: 2024-06-10 11:04:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla Canales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Canales`;

CREATE TABLE `Canales` (
  `ID_Canal` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Propietario_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Canal`),
  KEY `Propietario_ID` (`Propietario_ID`),
  CONSTRAINT `canales_ibfk_1` FOREIGN KEY (`Propietario_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Comentarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Comentarios`;

CREATE TABLE `Comentarios` (
  `ID_Comentario` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` text NOT NULL,
  `Fecha_Hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `Video_ID` int(11) DEFAULT NULL,
  `Usuario_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Comentario`),
  KEY `Video_ID` (`Video_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`Video_ID`) REFERENCES `Videos` (`ID_Video`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Etiquetas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Etiquetas`;

CREATE TABLE `Etiquetas` (
  `ID_Etiqueta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Etiqueta` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Etiqueta`),
  UNIQUE KEY `Nombre_Etiqueta` (`Nombre_Etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Likes_Dislikes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Likes_Dislikes`;

CREATE TABLE `Likes_Dislikes` (
  `Video_ID` int(11) NOT NULL,
  `Usuario_ID` int(11) NOT NULL,
  `Tipo_Interaccion` enum('like','dislike') DEFAULT NULL,
  `Fecha_Interaccion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Video_ID`,`Usuario_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `likes_dislikes_ibfk_1` FOREIGN KEY (`Video_ID`) REFERENCES `Videos` (`ID_Video`),
  CONSTRAINT `likes_dislikes_ibfk_2` FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Marcaciones_Comentarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Marcaciones_Comentarios`;

CREATE TABLE `Marcaciones_Comentarios` (
  `Comentario_ID` int(11) NOT NULL,
  `Usuario_ID` int(11) NOT NULL,
  `Tipo_Marcacion` enum('me gusta','no me gusta') DEFAULT NULL,
  `Fecha_Marcacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Comentario_ID`,`Usuario_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `marcaciones_comentarios_ibfk_1` FOREIGN KEY (`Comentario_ID`) REFERENCES `Comentarios` (`ID_Comentario`),
  CONSTRAINT `marcaciones_comentarios_ibfk_2` FOREIGN KEY (`Usuario_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Playlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Playlists`;

CREATE TABLE `Playlists` (
  `ID_Playlist` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Estado` enum('publica','privada') DEFAULT 'publica',
  `Propietario_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Playlist`),
  KEY `Propietario_ID` (`Propietario_ID`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`Propietario_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Suscripciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Suscripciones`;

CREATE TABLE `Suscripciones` (
  `Suscriptor_ID` int(11) NOT NULL,
  `Canal_Suscripto_ID` int(11) NOT NULL,
  `Fecha_Suscripcion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Suscriptor_ID`,`Canal_Suscripto_ID`),
  KEY `Canal_Suscripto_ID` (`Canal_Suscripto_ID`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`Suscriptor_ID`) REFERENCES `Usuarios` (`ID_Usuario`),
  CONSTRAINT `suscripciones_ibfk_2` FOREIGN KEY (`Canal_Suscripto_ID`) REFERENCES `Canales` (`ID_Canal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Usuarios`;

CREATE TABLE `Usuarios` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Sexo` enum('Masculino','Femenino') DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Codigo_Postal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Volcado de tabla Videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Videos`;

CREATE TABLE `Videos` (
  `ID_Video` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text,
  `Tamaño` decimal(10,2) DEFAULT NULL,
  `Nombre_Archivo` varchar(255) DEFAULT NULL,
  `Duracion_video` time DEFAULT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Numero_Reproducciones` int(11) DEFAULT '0',
  `Numero_Likes` int(11) DEFAULT '0',
  `Numero_Dislikes` int(11) DEFAULT '0',
  `Estado` enum('publico','oculto','privado') DEFAULT 'publico',
  `Publicador_ID` int(11) DEFAULT NULL,
  `Fecha_Publicacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Video`),
  KEY `Publicador_ID` (`Publicador_ID`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`Publicador_ID`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
