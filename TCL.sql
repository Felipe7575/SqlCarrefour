USE carrefour;

SET AUTOCOMMIT = 0;


START TRANSACTION;

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Laptop', 1200.00, 'Laptop de última generación', 1000.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Monitor', 400.00, 'Monitor LED de 24 pulgadas', 320.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Teclado', 60.00, 'Teclado inalámbrico retroiluminado', 50.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Mouse', 30.00, 'Mouse óptico con cable', 20.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Impresora', 250.00, 'Impresora multifuncional', 200.00);

	SAVEPOINT loteArt1;
    
	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Altavoces', 80.00, 'Altavoces 2.1 de alta fidelidad', 60.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Disco Duro Externo', 120.00, 'Disco duro externo de 1TB', 100.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Memoria USB', 20.00, 'Memoria USB de 32GB', 15.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Webcam', 50.00, 'Webcam de alta definición', 40.00);

	INSERT INTO articulos (nombre_art, precio_art, descr_art, precio_compra) 
	VALUES ('Router', 90.00, 'Router inalámbrico de doble banda', 70.00);

	ROLLBACK TO SAVEPOINT loteArt1;
	COMMIT;
    
SELECT * FROM articulos;

SET AUTOCOMMIT = 1;


