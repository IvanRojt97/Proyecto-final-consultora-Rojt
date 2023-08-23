-- Vista de trabajos que hay en Buenos Aires
CREATE VIEW trabajos_en_buenos_aires
AS
SELECT a_ciudad, a_cp, razón_social_cliente, fecha_orden
FROM ordenes c
INNER JOIN equipo o ON c.orden_id = o.orden_id
WHERE  ciudad LIKE '%Buenos Aires%';

-- Vista de empleados que hay en Buenos Aires
CREATE VIEW empleados_en_buenos_aires
AS
SELECT c.nombre, c.apellido, c.email, c.teléfono, c.calle, c.ciudad, c.cp
FROM   empleados c
INNER JOIN equipo o ON c.empleados_id = o.empleados_id
WHERE  o.ciudad LIKE '%Buenos Aires%';

-- Vista de los equipos trabajando con un target femenino
CREATE VIEW equipo_trabajando_target_femenino
AS
SELECT c.target_id, c.segmento_id, c.nombre_target, c.equipo_id
FROM   target c
INNER JOIN equipo o ON c.equipo_id = o.equipo_id
WHERE  nombre_target LIKE '%Personas mujeres%';

-- Vista de las órdenes de cada cliente
CREATE VIEW órdenes_de_cada_cliente
AS
SELECT c.cliente_id, c.razón_social, c.teléfono, c.ciudad, c.cp, c.pago, c.monto
FROM   cliente c
INNER JOIN ordenes o ON c.cliente_id = o.cliente_id
WHERE  c.cliente_id = o.cliente_id;

-- Vista de empleados disponibles para los equipos que trabajan en Buenos Aires
CREATE VIEW empleados_disponibles_para_equipos_buenos_aires
AS
SELECT c.equipo_id, c.nombre_equipo, c.nombre_técnica, c.ciudad
FROM   equipo c
INNER JOIN empleados o ON c.empleados_id = o.empleados_id
WHERE  c.ciudad LIKE '%Buenos Aires%'; 