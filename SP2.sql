USE `carrefour`;
 -- SP QUE CREA UN PEDIDO. AL FINAL DE TODO EL SCRIPT ESTAN LAS LLAMADAS A LOS DOS

DROP procedure IF EXISTS `create_pedido`;

DELIMITER $$
USE `carrefour`$$
CREATE PROCEDURE `create_pedido` (IN ID_SUCURSAL INT, IN ID_USUARIO INT, IN ID_EMPLEADO INT, IN DIR_PEDIDO VARCHAR(100), IN MODO INT)
BEGIN
	IF(MODO IS NULL OR DIR_PEDIDO IS NULL OR ID_SUCURSAL IS NULL OR (ID_USUARIO IS NULL AND ID_EMPLEADO IS NULL)) THEN
		SELECT 'ERROR DE VARIABLES DE ENTORNO';
	ELSE
		IF EXISTS(SELECT id_suc FROM sucursales WHERE id_suc = ID_SUCURSAL) THEN
			INSERT INTO pedido (id_usu, id_suc , id_empl, direcc_ped, fecha_ped, retiraEnvia, finalizado)
				VALUES (ID_USUARIO,ID_SUCURSAL,ID_EMPLEADO,DIR_PEDIDO, curdate() ,MODO, 0 );
		ELSE 
			SELECT 'SUCURSAL NO EXISTE';
		END IF;
	END IF;
END$$

DELIMITER ;
-- -----------------------------------------------------------------------------------------------------------
-- SP QUE CREA LOS DETALLES DE UN PEDIDO (COD_ARTICULO, CANTIDAD)


DROP procedure IF EXISTS `detalle_pedido`;

DELIMITER $$
USE `carrefour`$$
CREATE PROCEDURE `detalle_pedido` (IN ID_PEDIDO INT, IN ID_ARTICULO INT, IN CANTIDAD INT)
BEGIN
DECLARE SUCURSAL INT;
	IF EXISTS (SELECT id_ped FROM pedido WHERE id_ped = ID_PEDIDO) THEN 
		SELECT id_suc INTO SUCURSAL FROM pedido WHERE id_ped = ID_PEDIDO;
        IF (SELECT stock FROM disponibilidad WHERE (id_art = ID_ARTICULO AND id_suc = SUCURSAL)) >= CANTIDAD THEN
			UPDATE disponibilidad 
				SET stock = stock - CANTIDAD
                WHERE (id_suc = SUCURSAL AND id_art = ID_ARTICULO);
                INSERT INTO desc_pedido(id_ped,id_art,cantidad)
					VALUES (ID_PEDIDO,ID_ARTICULO,CANTIDAD);

		else
			SELECT 'NO HAY STOCK SUFICIENTE';
        END IF;
        
	ELSE 
			SELECT CONCAT('NO EXISTE PEDIDO :', ID_PEDIDO);
	
    END IF;
END$$
DELIMITER ;




CALL create_pedido(5, 3, 135, "123 Main St, Anytown USA", 1);
CALL create_pedido(4, 2, 136, "456 Oak Ave, Anytown USA", 0);
CALL create_pedido(3, 1, 137, "789 Pine St, Anytown USA", 1);
CALL create_pedido(2, 10, 138, "111 Maple St, Anytown USA", 0);
CALL create_pedido(1, 9, 139, "222 Cedar Blvd, Anytown USA", 1);
CALL create_pedido(6, 8, 130, "333 River Rd, Anytown USA", 0);
CALL create_pedido(7, 7, 131, "444 Hill St, Anytown USA", 1);
CALL create_pedido(8, 6, 132, "555 Mountain Ave, Anytown USA", 0);
CALL create_pedido(9, 5, 133, "666 Valley Rd, Anytown USA", 1);
CALL create_pedido(10, 4, 134, "777 Park Blvd, Anytown USA", 0);


-- INSERTA ARTICULOS PARA EL PEDIDO 1
call detalle_pedido (1,3,1);
call detalle_pedido (1,2,25);   -- NO ALCANZA EL STOCK
call detalle_pedido (1,1,2);


-- INSERTA ARTICULOS PARA EL PEDIDO 2 
call detalle_pedido (2,13,1);	
call detalle_pedido (2,14,2);
call detalle_pedido (2,15,2);



-- INSERTA ARTICULOS PARA EL PEDIDO 3
call detalle_pedido (3,12,1);
call detalle_pedido (3,10,3);
call detalle_pedido (3,11,2);


-- INSERTA ARTICULOS PARA EL PEDIDO 4
call detalle_pedido (4,9,1);
call detalle_pedido (4,6,2);
call detalle_pedido (4,8,2);


-- INSERTA ARTICULOS PARA EL PEDIDO 5
call detalle_pedido (5,4,3);
call detalle_pedido (5,1,1);
call detalle_pedido (5,5,2);

-- INSERTA ARTICULOS PARA EL PEDIDO 6
call detalle_pedido (6,5,2);
call detalle_pedido (6,3,1);
call detalle_pedido (6,4,1);

-- INSERTA ARTICULOS PARA EL PEDIDO 7  NO HAY EN ESTA SUCURSAL NINGUN ARTICULO EN STOCK
call detalle_pedido (7,6,3);
