DELIMITER //

CREATE FUNCTION designacion_de_empleados (ciudad_empleado varchar(15),ciudad_de_orden varchar(15))

returns varchar(2) 

deterministic

BEGIN 

DECLARE resultado VARCHAR(2);

SELECT * INTO resultado

FROM empleados

INNER JOIN ordenes ON id_empleado = o.id_empleado

WHERE a_ciudad = ciudad_empleado AND a_ciudad = ciudad_de_orden;

RETURN resultado;

END//

DELIMITER //

CREATE FUNCTION asignación_target (nombre_target varchar (60), equipo_id int)

returns int 

deterministic

BEGIN

DECLARE equipo INT;

SELECT * INTO nombre_target FROM target

INNER JOIN equipo ON equipo = equipo;

RETURN equipo;

END//

DELIMITER //

CREATE PROCEDURE `sp_calcular_ingresos_junio` (out total integer)

BEGIN

DECLARE monto INT;DECLARE resultado FLOAT;

SELECT Count(*) INTO   monto FROM   cliente;

END//

DELIMITER //

CREATE PROCEDURE `sp_target_femenino` (inout nombre_target varchar (60))

BEGIN

DECLARE género FLOAT;

SELECT id INTO nombre_target

FROM target

WHERE  nombre_target LIKE "personas mujeres";END//CREATE PROCEDURE `sp_target_masculino` (inout nombre_target varchar (60))

BEGIN

DECLARE género FLOAT;

SELECT id INTO nombre_target 

FROM   target

WHERE nombre_target LIKE "personas varones";

END//

DELIMITER //