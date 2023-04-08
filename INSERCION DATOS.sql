USE carrefour;

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
    
    
    
    
-- NO INSERTAR LOS PEDIDOS 
-- USAR LOS EJEMPLOS EN LOS STORE PROCUDERE
/*INSERT INTO pedido (id_usu, id_empl, direcc_ped, fecha_ped, retiraEnvia)
VALUES 
    (5, 131, 'Calle del Arco 23', '2023-01-01', 1),
    (7, NULL, 'Avenida de la Constitución 45', '2023-01-03', 0),
    (2, 131, 'Calle Mayor 12', '2023-01-05', 1),
    (10, 131, 'Plaza del Sol 7', '2023-01-08', 0),
    (5, 130, 'Calle del Mar 9', '2023-01-10', 1),
    (6, 133, 'Calle del Sol 11', '2023-01-12', 0),
    (7, 136, 'Avenida de la Libertad 21', '2023-01-15', 1),
    (1, 131, 'Calle del Carmen 5', '2023-01-18', 0),
    (9, NULL, 'Plaza Mayor 14', '2023-01-20', 1),
    (8, 131, 'Calle Real 17', '2023-01-23', 0),
    (3, 132, 'Avenida de la Paz 32', '2023-01-26', 1),
    (4, 131, 'Calle de la Luna 8', '2023-01-29', 0),
    (1, 138, 'Avenida del Mar 14', '2023-02-02', 1),
    (6, 131, 'Calle de la Estrella 9', '2023-02-05', 0),
    (4, 131, 'Plaza de España 4', '2023-02-08', 1),
    (5, NULL, 'Calle del Puente 7', '2023-02-11', 0),
    (7, 137, 'Calle de la Fuente 3', '2023-02-13', 1),
    (3, NULL, 'Avenida de la Victoria 17', '2023-02-15', 0),
    (2, 132, 'Calle de la Torre 12', '2023-02-17', 1),
    (9, 137, 'Calle del Río 6', '2023-02-20', 0);

INSERT INTO desc_pedido (id_ped, id_art, cantidad)
VALUES 
    (1, 4, 6),
    (1, 5, 3),
    (2, 5, 6),
    (2, 4, 5),
    (2, 1, 2),
    (3, 8, 7),
    (3, 12, 9),
    (4, 7, 10),
    (4, 11, 1),
    (5, 2, 5),
    (5, 9, 4),
    (6, 10, 8),
    (6, 14, 6),
    (6, 15, 3),
    (7, 1, 7),
    (8, 3, 2),
    (9, 13, 6),
    (10, 4, 4),
    (10, 8, 9),
    (11, 12, 8),
    (12, 7, 1),
    (12, 11, 3),
    (13, 2, 2),
    (13, 3, 5),
    (13, 5, 8),
    (14, 6, 9),
    (14, 10, 7),
    (15, 15, 6),
    (16, 1, 5);
*/


SELECT * FROM cargos;
SELECT * FROM Sucursales;
SELECT * FROM empleados;
SELECT * FROM articulos;
SELECT * FROM usuarios;
SELECT * FROM disponibilidad;
SELECT * FROM pedido;
SELECT * FROM desc_pedido;





	



