-- CREACION DE VISTAS 

-- PIDO EL STOCK DE UN MISMO PRODUCTO ENTRE TODAS LAS SUCURSALES
-- 	POR ALGUNA RAZON NO PUDE LANZAR LA CONSULTA HASTA QUE NO CAMBIE ESAS VARIABLES DE ENTORNO
-- 	ADJUNTO LINK https://clientes.digital-express.com.ar/support/solutions/articles/48001187649-mysql-error-1055-group-by#:~:text=Este%20error%20se%20produce%20cuando%20estamos%20intentando%20lanzar%20una%20SQL,la%20versi%C3%B3n%20MySQL%208.0.15.
SELECT @@sql_mode;
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE VIEW STOCK_POR_ARTICULO	AS
	SELECT A.id_art as CODIGO, nombre_art AS NOMBRE, SUM(stock) AS STOCK
		FROM articulos A
		JOIN disponibilidad D
		ON (A.id_art = D.id_art)
		GROUP BY CODIGO;
    
-- MUESTRA LOS PEDIDOS POR USUARIO 
CREATE VIEW PEDIDOS_POR_USUARIO		AS
	SELECT  U.id_usu AS ID_USUARIO , nombre_usu AS NOMBRE, id_ped
		FROM usuarios U 
		JOIN pedido P 
		ON (U.id_usu = P.id_usu)
		;
    
-- MUESTRA LA CANTIDAD DE VENTAS POR EMPLEADO
CREATE VIEW VENTAS_POR_EMPLEADO	AS
	SELECT  E.id_empl AS ID_EMPLEADO , nombre_empl AS NOMBRE, COUNT(id_ped) AS VENTAS
		FROM empleados E 
		JOIN pedido P 
		ON (E.id_empl = P.id_empl)
		GROUP BY E.id_empl
		ORDER BY VENTAS DESC
		;
-- MUESTRA LAS SUCURSALES QUE CUENTAN CON UN DETERMINADO ARTICULO
CREATE VIEW DISPONIBILIDAD_SUC	AS
	SELECT D.id_art AS COD_ART, D.id_suc AS COD_SUC, S.direcc_suc AS DIRECCION , S.telef_suc  AS TELEFONO, D.stock AS STOCK, A.precio_art AS PRECIO
		FROM disponibilidad D
		JOIN sucursales S 
		ON ( D.id_suc = S.id_suc)
		JOIN articulos A
		ON (A.id_art =  D.id_art) 
		WHERE D.id_art = 6
		;

-- MUESTRA LA GANANCIA POR ARTICULO Y EL PORCENTAJE DE GANANCIA
CREATE VIEW GANANCIA_POR_ARTICULO	AS
	SELECT id_art AS COD_ART, nombre_art AS NOMBRE, (precio_art - precio_compra) AS GANANCIA, ROUND((precio_art/precio_compra)*100, 2) AS PORCENTUAL
		FROM articulos
		ORDER BY GANANCIA DESC;
    
SELECT * FROM disponibilidad_suc;
SELECT * FROM ganancia_por_articulo;
SELECT * FROM pedidos_por_usuario;
SELECT * FROM stock_por_articulo;
SELECT * FROM ventas_por_empleado;
