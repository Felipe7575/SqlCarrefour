USE carrefour;

CREATE TABLE sucursales
	(
    id_suc			INT NOT NULL AUTO_INCREMENT,						-- PRIMARY KEY
    direcc_suc  	VARCHAR(40)	NOT NULL,
    telef_suc		INT NOT NULL,
    
    
	PRIMARY KEY(id_suc)
    );
    
SELECT * FROM sucursales;
-- ------------------------------------------------------------------------------

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

-- ALTER TABLE empleados ADD (cargo_empl      INT NOT NULL, FOREIGN  KEY(cargo_empl) REFERENCES cargos(id));
-- ALTER TABLE pedido DROP constraint pedido_ibfk_2;

-- -----------------------------------------------------------------------------

CREATE TABLE cargos
	(
    id				INT NOT NULL AUTO_INCREMENT,
    descr			VARCHAR(100),
    
    PRIMARY KEY(id)
    );
ALTER TABLE cargos  AUTO_INCREMENT = 10;

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
	id_art			INT NOT NULL,
    id_suc			INT NOT NULL,
    stock			INT,
    
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


