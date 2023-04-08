-- Store PROCEDURE 

USE carrefour;

-- STORE PROCEDURE QUE DEVUELVE LA VISTA "stock_por_articulo" ORDENADO SEGUN COLUMNA y MODO EJEMPLO call stock_odenado("STOCK","DESC");
DROP procedure IF EXISTS `stock_odenado`;
DELIMITER $$
USE `carrefour`$$
CREATE PROCEDURE `stock_odenado` (IN Parametro CHAR(10), IN MODO CHAR(4))
BEGIN
	IF (MODO = 'ASC') THEN
		IF (Parametro = 'CODIGO') THEN
			SELECT * FROM stock_por_articulo ORDER BY CODIGO ASC;

		ELSEIF (Parametro = 'NOMBRE') THEN
			SELECT * FROM stock_por_articulo ORDER BY NOMBRE ASC;

		ELSEIF (Parametro = 'STOCK') THEN
			SELECT * FROM stock_por_articulo ORDER BY STOCK ASC;
		END IF;
        
	ELSEIF (MODO = 'DESC') THEN
		IF (Parametro = 'CODIGO') THEN
			SELECT * FROM stock_por_articulo ORDER BY CODIGO DESC;

		ELSEIF (Parametro = 'NOMBRE') THEN
			SELECT * FROM stock_por_articulo ORDER BY NOMBRE DESC;

		ELSEIF (Parametro = 'STOCK') THEN
			SELECT * FROM stock_por_articulo ORDER BY STOCK DESC;
		END IF;
	END IF;
END$$

DELIMITER ;

call stock_odenado("STOCK","DESC");




     
	