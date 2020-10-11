CREATE DATABASE IF NOT EXISTS `asigna` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `asigna`;


CREATE TABLE IF NOT EXISTS `alumno` (
  `carnet` INT(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los datos de alumnos ';

CREATE TABLE IF NOT EXISTS `catedratico` (
  `codigo_cate` INT(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`codigo_cate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los datos de catedratico ';

CREATE TABLE IF NOT EXISTS `curso` (
  `codigo_curso` INT(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los datos de curso';

CREATE TABLE IF NOT EXISTS `asigna_curso_alumno` (
  `id_asigna` varchar(50) NOT NULL,
  `carnet` int(11) NOT NULL DEFAULT 0,
    `fecha_asigna` datetime DEFAULT NULL,  
  PRIMARY KEY (`id_asigna`),
  KEY `fk_alumno` (`carnet`),
  CONSTRAINT `fk_alumno` FOREIGN KEY (`carnet`) REFERENCES `alumno` (`carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda asigna alumno';

