USE carrefour;

DROP TRIGGER IF EXISTS insertEmpleadoVitacora;

CREATE TRIGGER insertEmpleadoVitacora
AFTER INSERT ON empleados
FOR EACH ROW
INSERT INTO vitacoraempleados(fecha,usuario,id_empleado)
VALUES (curdate(),session_user(),NEW.id_empl);


INSERT INTO empleados (id_suc, email_empl, nombre_empl, tel_empl, direcc_empl,cargo_empl)
VALUES 
   (3,"lola.doe@example.com", "Lola Carlo",1138042675 , "123 Main St, Anytown USA",10);
   
SELECT * FROM empleados;
SELECT * FROM vitacoraempleados;


DROP TRIGGER IF EXISTS updateDisponibilidad;

CREATE TRIGGER updateDisponibilidad
BEFORE UPDATE ON disponibilidad
FOR EACH ROW
INSERT INTO vitacoradisponibilidad(fecha,usuario,id_disponibilidad,cantidadModificada)
VALUES (curdate(),session_user(),NEW.id,NEW.stock);


CALL create_pedido(3, 3, 135, "123 Main St, Anytown USA", 1);
call detalle_pedido (1,3,1);

SELECT * FROM disponibilidad;
SELECT * FROM vitacoradisponibilidad;