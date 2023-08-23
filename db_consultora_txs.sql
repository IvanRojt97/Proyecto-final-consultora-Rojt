START TRANSACTION;

DELETE FROM equipo WHERE segmento_id = 1;

DELETE FROM equipo WHERE segmento_id = 2;

DELETE FROM equipo WHERE segmento_id = 3;

DELETE FROM equipo WHERE  segmento_id = 4;

SET foreign_key_checks=0;
INSERT INTO equipo (equipo_id, nombre_equipo, segmento_id, nombre_técnica, nombre, apellido, ciudad) VALUES (1, 'Investigación comida rapida1', 1, 'Encuesta', 'Iván', 'Rojt', 'Buenos Aires');
SET foreign_key_checks=1;

SET foreign_key_checks=0;
INSERT INTO equipo(equipo_id, nombre_equipo, segmento_id, nombre_técnica, nombre, apellido, ciudad) VALUES (2, 'Investigación comida rapida2', 2, 'Encuesta', 'Federico', 'Rojt', 'Buenos Aires');
SET foreign_key_checks=1;

SET foreign_key_checks=0;
INSERT INTO equipo(equipo_id, nombre_equipo, segmento_id, nombre_técnica, nombre, apellido, ciudad) VALUES(3, 'Investigación comida rapida3', 3, 'Entrevista', 'Álvaro', 'Rodriguez', 'Santa Fe');
SET foreign_key_checks=1;

SET foreign_key_checks=0;
INSERT INTO equipo(equipo_id, nombre_equipo, segmento_id, nombre_técnica, nombre, apellido, ciudad)VALUES(4, 'Investigación comida rapida4', 4, 'Entrevista', 'Álvaro', 'González', 'Santa Fe');
SET foreign_key_checks=1;

ROLLBACK;

START TRANSACTION;

INSERT INTO cliente (pago, monto) VALUES ('si', 1500000);

INSERT INTO cliente (pago, monto) VALUES ('si', 2500000);

INSERT INTO cliente (pago, monto) VALUES ('si', 3000000);

INSERT INTO cliente (pago, monto) VALUES ('si', 4000000);

SAVEPOINT savepoint1;

INSERT INTO cliente (pago, monto) VALUES ('si', 5000000); 

INSERT INTO cliente (pago, monto) VALUES ('si', 5000000);

INSERT INTO cliente (pago, monto) VALUES ('si', 3000000);

INSERT INTO cliente (pago, monto) VALUES ('si', 1000000);

SAVEPOINT savepoint2;

RELEASE savepoint savepoint1;

COMMIT;