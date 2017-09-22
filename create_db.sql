-- MySQL Script generated by MySQL Workbench
-- Wed Sep 20 22:51:59 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema InventoryAndroid
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema InventoryAndroid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `InventoryAndroid` DEFAULT CHARACTER SET latin1 ;
USE `InventoryAndroid` ;

-- -----------------------------------------------------
-- Table `InventoryAndroid`.`ubicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`ubicacion` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`ubicacion` (
  `id_ubicacion` INT(11) NOT NULL,
  `fila` VARCHAR(100) NULL DEFAULT NULL,
  `columna` VARCHAR(100) NULL DEFAULT NULL,
  `almacen_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`),
  INDEX `almacen_id` (`almacen_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`almacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`almacen` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`almacen` (
  `id_almacen` INT(11) NOT NULL,
  `almacen` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_almacen`),
  CONSTRAINT `fk_almacen`
    FOREIGN KEY (`id_almacen`)
    REFERENCES `InventoryAndroid`.`ubicacion` (`almacen_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`categoria` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`categoria` (
  `id` VARCHAR(10) NOT NULL,
  `categoria` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`disponible`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`disponible` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`disponible` (
  `cod_producto` VARCHAR(15) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `ubicacion` INT(11) NULL DEFAULT NULL,
  `bodega` INT(11) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`inventario_detalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`inventario_detalle` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`inventario_detalle` (
  `id_detalle` INT(11) NOT NULL,
  `inventario_id` INT(11) NULL DEFAULT NULL,
  `cod_producto` VARCHAR(15) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  INDEX `cod_producto` (`cod_producto` ASC),
  INDEX `inventario_id` (`inventario_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`inventario` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`inventario` (
  `id_inventario` INT(11) NOT NULL,
  `inventario` VARCHAR(100) NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  `estado` BIT(1) NULL DEFAULT NULL,
  `usuario` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  INDEX `usuario` (`usuario` ASC),
  CONSTRAINT `fk_inventario`
    FOREIGN KEY (`id_inventario`)
    REFERENCES `InventoryAndroid`.`inventario_detalle` (`inventario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`producto` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`producto` (
  `cod_produto` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `proveedor_id` VARCHAR(10) NULL DEFAULT NULL,
  `fecha_creacion` VARCHAR(100) NULL DEFAULT NULL,
  `usu_creacion` VARCHAR(100) NULL DEFAULT NULL,
  `qr_code` VARCHAR(100) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  `categoria_id` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_produto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`proveedores` (
  `id_proveedor` VARCHAR(10) NOT NULL,
  `proveedor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`qr_code_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`qr_code_image` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`qr_code_image` (
  `id_img_qr` INT(11) NOT NULL AUTO_INCREMENT,
  `ruta` VARCHAR(100) NULL DEFAULT NULL,
  `cod_prod` VARCHAR(20) NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_img_qr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`terminales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`terminales` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`terminales` (
  `id_terminal` INT(11) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `autorizado` BIT(1) NULL DEFAULT NULL,
  `user_id` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`unidad_medida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`unidad_medida` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`unidad_medida` (
  `id_umedida` INT(11) NOT NULL AUTO_INCREMENT,
  `unidad_medida` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_umedida`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InventoryAndroid`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InventoryAndroid`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `InventoryAndroid`.`usuarios` (
  `rut` VARCHAR(15) NOT NULL,
  `nombres` VARCHAR(100) NULL DEFAULT NULL,
  `apellidos` VARCHAR(100) NULL DEFAULT NULL,
  `clave` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`rut`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `InventoryAndroid` ;

-- -----------------------------------------------------
-- procedure SP_ADD_PRODUCT
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`SP_ADD_PRODUCT`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADD_PRODUCT`(IN cod varchar(20), IN producto varchar(100),
								IN prov int,IN fecha_cre varchar(100),
                                IN usu_crea varchar(12),IN qr_code varchar(100),IN precio double,IN categoria_id int,out result int)
BEGIN
	DECLARE start  INT;  
	select count(*) into result from `InventoryAndroid`.`producto` where cod_produto = cod;
    
    if(result > 0) then
    	set result = 1000;
    else
    	INSERT INTO `InventoryAndroid`.`producto`
		(`cod_produto`,
		`nombre`,
		`proveedor_id`,
		`fecha_creacion`,
		`usu_creacion`,
		`qr_code`,
		`precio`,
        `categoria_id`)              
		VALUES
		(cod,
	 	producto,
	 	prov,                         
	 	fecha_cre,
	 	usu_crea,
	 	qr_code,
		precio,
        categoria_id);
    
    	set result = 0;
    end if;
	
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_GET_ALL_CATEGORY
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`SP_GET_ALL_CATEGORY`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_ALL_CATEGORY`()
BEGIN
	SELECT * FROM CATEGORIA;                                                       
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_GET_ALL_PRODUCT
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`SP_GET_ALL_PRODUCT`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`hernan`@`%` PROCEDURE `SP_GET_ALL_PRODUCT`()
BEGIN
 SELECT cod_produto,nombre FROM producto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_GET_ALL_PROVIDER
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`SP_GET_ALL_PROVIDER`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_ALL_PROVIDER`()
BEGIN
   SELECT id_proveedor,proveedor FROM PROVEEDORES;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_GET_PRODUCT_BY_CODE
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`SP_GET_PRODUCT_BY_CODE`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`hernan`@`%` PROCEDURE `SP_GET_PRODUCT_BY_CODE`(IN cod VARCHAR(10))
BEGIN
 SELECT cod_produto FROM producto WHERE cod_produto = cod;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_get_UserValid
-- -----------------------------------------------------

USE `InventoryAndroid`;
DROP procedure IF EXISTS `InventoryAndroid`.`sp_get_UserValid`;

DELIMITER $$
USE `InventoryAndroid`$$
CREATE DEFINER=`hernan`@`%` PROCEDURE `sp_get_UserValid`(IN run varchar(20),IN pass varchar(20))
BEGIN
 SELECT rut,nombres,apellidos,clave FROM usuarios where rut = run and clave = pass;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
