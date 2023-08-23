--  Trigger que actualiza la lista de empleados después de designarlos a un equipo

CREATE TRIGGER log_empleados_delete 

BEFORE INSERT ON equipo

FOR EACH ROW

BEGIN

DELETE FROM empleados WHERE nombre = new.nombre;

DELETE FROM empleados WHERE apellido = new.apellido;

END;

//

DELIMITER ;

DELIMITER //

-- Trigger que actualiza el salario de un empleado después de una compra

CREATE TRIGGER log_empleados_update 

AFTER UPDATE ON equipo 

FOR EACH ROW  

BEGIN

INSERT INTO empleados (empleados_id) VALUES (new.empleados_id);

END;

//