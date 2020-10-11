-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.12-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para construcciones
CREATE DATABASE IF NOT EXISTS `construcciones` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `construcciones`;

-- Volcando estructura para tabla construcciones.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `nit_cliente` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `borrado` int(11) DEFAULT NULL,
  PRIMARY KEY (`nit_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los clientes';

-- Volcando estructura para tabla construcciones.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio_compra` double DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los productos';

-- Volcando datos para la tabla construcciones.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla construcciones.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los proveedores';

-- Volcando datos para la tabla construcciones.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla construcciones.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los roles del sistema';

-- Volcando datos para la tabla construcciones.rol: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id_rol`, `descripcion`) VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'OPERATIVO'),
	(3, 'CONSULTAS');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla construcciones.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `login_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 0,
  `activo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`login_name`),
  KEY `fk_usuario_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda los usuarios del sistema';

-- Volcando estructura para tabla construcciones.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `nit_cliente` varchar(50) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `total_venta` double DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_cliente` (`nit_cliente`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`nit_cliente`) REFERENCES `cliente` (`nit_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda las ventas';

-- Volcando datos para la tabla construcciones.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
venta