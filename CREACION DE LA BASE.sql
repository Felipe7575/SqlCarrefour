-- CODIGO PARA CREAR TODA LA BASE DE DATOS 
USE carrefour;
-- CREACION DE TABLAS 
CREATE TABLE sucursales
	(
    id_suc			INT NOT NULL AUTO_INCREMENT,						-- PRIMARY KEY
    direcc_suc  	VARCHAR(40)	NOT NULL,
    telef_suc		INT NOT NULL,
    
    
	PRIMARY KEY(id_suc)
    );
    
SELECT * FROM sucursales;
-- ------------------------------------------------------------------------------
CREATE TABLE cargos
	(
    id				INT NOT NULL AUTO_INCREMENT,
    descr			VARCHAR(100),
    
    PRIMARY KEY(id)
    );
ALTER TABLE cargos  AUTO_INCREMENT = 10;


CREATE TABLE empleados
	(
	id_empl			INT NOT NULL AUTO_INCREMENT, 		-- PRIMARY KEY
    id_suc 			INT ,						-- FOREIGN KEY
    
    email_empl 		VARCHAR(100)	NOT NULL,
    nombre_empl 	VARCHAR(30)	NOT NULL,
    tel_empl		INT NOT NULL,
    direcc_empl		VARCHAR(100)	NOT NULL,
    cargo_empl      INT,
    
    PRIMARY KEY (id_empl, email_empl),
    FOREIGN  KEY(id_suc) REFERENCES sucursales(id_suc) ON DELETE SET NULL,
    FOREIGN  KEY(cargo_empl) REFERENCES cargos(id) ON DELETE SET NULL
	);
ALTER TABLE empleados  AUTO_INCREMENT = 130;

-- -----------------------------------------------------------------------------


CREATE TABLE usuarios
	(
	id_usu			INT NOT NULL AUTO_INCREMENT, 		-- PRIMARY KEY
    
    email_usu 		VARCHAR(100)	NOT NULL,
    nombre_usu 		VARCHAR(30)	NOT NULL,
    tel_usu			INT NOT NULL,
    direcc_usu		VARCHAR(100)	NOT NULL,

    
    PRIMARY KEY (id_usu, email_usu)
	);
 
 
-- TABLAS DE ARTICULOS Y DESCRIPCIONES 
CREATE  TABLE articulos(
	id_art			INT NOT NULL AUTO_INCREMENT,
    
    nombre_art		VARCHAR(50)	NOT NULL,
    precio_art 		FLOAT NOT NULL,
    descr_art 		VARCHAR(150),
    
    PRIMARY KEY (id_art)
);
ALTER TABLE articulos ADD (precio_compra FLOAT NOT NULL);

SELECT * FROM articulos;


-- TABLAS DE DISPONIBILIDAD DE ARTICULOS POR SUCURSAL
CREATE TABLE disponibilidad(
	id				INT NOT NULL AUTO_INCREMENT,
	id_art			INT NOT NULL,
    id_suc			INT NOT NULL,
    stock			INT,
    
    PRIMARY KEY (id),
    FOREIGN KEY(id_art) REFERENCES articulos(id_art),
    FOREIGN KEY(id_suc) REFERENCES sucursales(id_suc)
    
);

-- TABLA DE PEDIDOS 
CREATE TABLE pedido(
	id_ped			INT NOT NULL AUTO_INCREMENT,
    id_suc			INT NOT NULL,
    id_usu			INT,
    id_empl			INT,
    direcc_ped		VARCHAR(100)	NOT NULL,
    fecha_ped		date,
    retiraEnvia		INT NOT NULL,
    finalizado      INT,
    
    PRIMARY KEY (id_ped),
	FOREIGN KEY(id_usu) REFERENCES usuarios(id_usu),
    FOREIGN KEY(id_empl) REFERENCES empleados(id_empl),
    FOREIGN KEY(id_suc) REFERENCES sucursales(id_suc)
);


-- TABLA DE DETALLE DE LOS PEDIDOS 
CREATE TABLE desc_pedido(
	id_ped			INT NOT NULL,
    id_art			INT	NOT NULL,
    cantidad		INT,
    
	FOREIGN KEY(id_ped) REFERENCES pedido(id_ped),
    FOREIGN KEY(id_art) REFERENCES articulos(id_art)
);

-- Tabla LOG de empleados
-- Creo esta vitacora porque considero que una modificacion sobre un empleado debe ser registrada
create Table vitacoraEmpleados(
	fecha	date,
    usuario	varchar(100),
    id_empleado	int,

	FOREIGN KEY(id_empleado) REFERENCES empleados(id_empl)
);
create Table vitacoraDisponibilidad(
	fecha	date,
    usuario	varchar(100),
    id_disponibilidad	int,
    cantidadModificada	int,

	FOREIGN KEY(id_disponibilidad) REFERENCES disponibilidad(id)
);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERCION DE DATOS 

INSERT INTO cargos(descr) VALUES
	('Cajero'),
    ('Repositor'),
    ('Gerente'),
    ('Recursos humanos'),
    ('Limpieza'),
    ('Diseñador grafico');


INSERT INTO Sucursales (id_suc,direcc_suc, telef_suc)
VALUES 
   (1,"1st Ave", 1138042682),
   (2,"2nd St", 1138042682),
   (3,"3rd Ave", 1138042682),
   (4,"4th St", 1138042682),
   (5,"5th Ave", 1138042682),
   (6,"6th St", 1138042682),
   (7,"7th Ave", 1138042682),
   (8,"8th St", 1138042682),
   (9,"9th Ave", 1138042682),
   (10,"10th St", 1138042682)
;
INSERT INTO empleados (id_suc, email_empl, nombre_empl, tel_empl, direcc_empl,cargo_empl)
VALUES 
   (2,"jane.doe@example.com", "Jane Doe",1138042682 , "123 Main St, Anytown USA",10),
   (1,"john.doe@example.com", "John Doe",1138042682 , "456 Oak Ave, Anytown USA",10),
   (3,"jim.smith@example.com", "Jim Smith",1138042682 , "789 Pine St, Anytown USA",11),
   (5,"jennifer.brown@example.com", "Jennifer Brown",1138042682 , "111 Maple St, Anytown USA",10),
   (6,"jason.lee@example.com", "Jason Lee",1138042682 , "222 Cedar Blvd, Anytown USA",12),
   (2,"jessica.johnson@example.com", "Jessica Johnson",1138042682 , "333 River Rd, Anytown USA",13),
   (1,"jacob.taylor@example.com", "Jacob Taylor",1138042682 , "444 Hill St, Anytown USA",14),
   (5,"jennifer.davis@example.com", "Jennifer Davis",1138042682 , "555 Mountain Ave, Anytown USA",15),
   (6,"james.lee@example.com", "James Lee",1138042682 , "666 Valley Rd, Anytown USA",10),
   (4,"joseph.roberts@example.com", "Joseph Roberts",1138042682 , "777 Park Blvd, Anytown USA",11)
;

INSERT INTO usuarios (email_usu, nombre_usu, tel_usu, direcc_usu) 
VALUES 
  ('juan@hotmail.com.ar', 'Juan Chavez', '1538045278', 'Av Juan Carlos 453'),
  ('ana@gmail.com', 'Ana Rodriguez', '1556789123', 'Calle San Martin 789'),
  ('luisa@yahoo.com', 'Luisa Gonzalez', '1545678901', 'Av Belgrano 1234'),
  ('carlos@outlook.com', 'Carlos Sanchez', '1567890123', 'Calle Corrientes 456'),
  ('maria@hotmail.com', 'Maria Torres', '1543210987', 'Av Santa Fe 789'),
  ('pablo@gmail.com', 'Pablo Ramirez', '1534567890', 'Calle Lavalle 234'),
  ('sofia@yahoo.com', 'Sofia Fernández', '1567890123', 'Av Rivadavia 567'),
  ('lucas@outlook.com', 'Lucas Díaz', '1545678901', 'Calle Florida 890'),
  ('julieta@hotmail.com', 'Julieta Romero', '1567890123', 'Av Callao 1234'),
  ('diego@gmail.com', 'Diego Perez', '1543210987', 'Calle Corrientes 567')
  ;
  
INSERT INTO articulos (nombre_art, descr_art, precio_compra, precio_art) 
VALUES 
  ('Leche descremada', 'Producto lacteo libre de lactosa. Conservar en ambiente refrigerado', 100, 110),
  ('Pan blanco', 'Producto de panadería elaborado con harina de trigo, sal y levadura', 50, 60),
  ('Huevos', 'Huevos frescos de gallinas criadas en libertad', 80, 90),
  ('Atún enlatado', 'Atún enlatado en aceite de oliva, rico en proteínas y omega-3', 120, 140),
  ('Arroz blanco', 'Arroz de grano largo, ideal para guarniciones y ensaladas', 40, 50),
  ('Queso fresco', 'Queso fresco de vaca, suave y cremoso, ideal para ensaladas', 70, 80),
  ('Yogur natural', 'Yogur natural sin azúcar, ideal para preparar postres y smoothies', 60, 70),
  ('Manzanas', 'Manzanas frescas y crujientes, ideales para consumir como fruta de snack', 30, 40),
  ('Naranjas', 'Naranjas dulces y jugosas, ricas en vitamina C', 40, 50),
  ('Aceitunas', 'Aceitunas verdes en salmuera, perfectas para aperitivos y ensaladas', 90, 100),
  ('Galletas de avena', 'Galletas de avena y miel, ideales para desayunos y meriendas', 20, 30),
  ('Pechuga de pollo', 'Pechuga de pollo fresca y magra, ideal para asar o preparar al horno', 150, 160),
  ('Filete de salmón', 'Filete de salmón fresco, rico en proteínas y omega-3, ideal para la parrilla', 200, 220),
  ('Tomate perita', 'Tomates perita frescos y jugosos, ideales para ensaladas y salsas', 50, 60),
  ('Papa', 'Papas frescas y de calidad, ideales para hervir o preparar al horno', 30, 40);

INSERT INTO disponibilidad (id_art, id_suc, stock) 
VALUES 
  (3, 5, 10),
  (1, 5, 10),
  (2, 5, 8),
  (9, 2, 10),
  (13, 4, 13),
  (6, 2, 18),
  (12, 3, 15),
  (15, 4, 8),
  (4, 1, 8),
  (10, 3, 20),
  (8, 2, 14),
  (11, 3, 18),
  (7, 2, 16),
  (2, 1, 12),
  (14, 4, 12),
  (5, 6, 7),
  (1, 1, 15),
  (3, 6, 19),
  (5, 1, 5),
  (4, 6, 15);
INSERT INTO disponibilidad (id_art, id_suc, stock)
VALUES 
	(7,3,7), 
	(7,2,3);
    
SELECT * FROM cargos;
SELECT * FROM Sucursales;
SELECT * FROM empleados;
SELECT * FROM articulos;
SELECT * FROM usuarios;
SELECT * FROM disponibilidad;
SELECT * FROM pedido;
SELECT * FROM desc_pedido;


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




