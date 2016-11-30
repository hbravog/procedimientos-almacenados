DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADD_PRODUCT`(IN cod varchar(20), IN producto varchar(100),
								IN prov int,IN estado varchar(2),IN fecha_cre varchar(100),
                                IN usu_crea varchar(12), IN almacen int,IN ubicacion int,
                                IN qr_code varchar(100),out result int)
BEGIN
	DECLARE start  INT;  
	select count(*) into result from `InventoryControl`.`producto` where cod_produto = cod;
    
    if(result > 0) then
    	set result = 1;
    else
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
		(cod,
	 	producto,
	 	prov,
	 	estado,
	 	fecha_cre,
	 	usu_crea,
	 	almacen,
	 	ubicacion,
	 	qr_code);
    
    	set result = 0;
    end if;
	
END$$
DELIMITER ;
