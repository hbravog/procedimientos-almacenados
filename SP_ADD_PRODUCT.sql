DELIMITER //
DROP PROCEDURE IF EXISTS SP_ADD_PRODUCT;
CREATE PROCEDURE SP_ADD_PRODUCT(IN codprod varchar(20), IN producto varchar(100),
								IN prov int,IN estado varchar(2),IN fecha_cre varchar(100),
                                IN usu_crea varchar(12), IN almacen int,IN ubicacion int,
                                IN qr_code varchar(100))

BEGIN
	 INSERT INTO `InventoryControl`.`producto`
	(`cod_produto`,
	`nombre`,
	`proveedor_id`,
	`estado`,
	`fecha_creacion`,
	`usu_creacion`,
	`almacen_id`,
	`ubicacion_id´`,
	`qr_code`)
	VALUES
	(codprod,
	 producto,
	 prov,
	 estado,
	 fecha_cre,
	 usu_crea,
	 almacen,
	 ubicacion,
	 qr_code);
	
END//
DELIMITER ;
