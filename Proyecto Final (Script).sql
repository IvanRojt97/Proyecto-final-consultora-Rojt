-- Crear la base de datos para la empresa de retail
CREATE DATABASE consultora;
USE consultora;

-- Tabla de clientes
CREATE TABLE Cliente (
  id INT NOT NULL auto_increment,
  Cliente_id INT,
  Razón_Social VARCHAR(30),
  Email VARCHAR(25),
  CUIT VARCHAR(13),
  Teléfono VARCHAR(20),
  Calle VARCHAR(15),
  Ciudad VARCHAR(25),
  CP VARCHAR(9),
  Pago VARCHAR(2),
  Monto VARCHAR(13),
  PRIMARY KEY (id)
);

-- Tabla de Segmentos trabajados
CREATE TABLE Segmento (
id INT NOT NULL auto_increment,
Segmento_id INT,
Edad VARCHAR (20),
Género VARCHAR (10),
Ciudad VARCHAR (25),
PRIMARY KEY (id)
);

-- Tabla de las Ordenes activas
CREATE TABLE Ordenes (
  id INT NOT NULL auto_increment,
  Orden_id INT,
  Nombre_Encuesta VARCHAR(12),
  Cliente_id INT,
  Razón_social_Cliente VARCHAR(30),
  A_Calle VARCHAR(15),
  A_Ciudad VARCHAR (15),
  A_CP VARCHAR (15),
  Fecha_Orden DATE,
  Fecha_informe DATE,
  Segmento_id INT, 
  FOREIGN KEY (Segmento_id) REFERENCES Segmento (id),
  FOREIGN KEY (Cliente_id) REFERENCES Cliente (id),
  PRIMARY KEY (id)
);

-- Tabla de empleados
CREATE TABLE Empleados (
  id INT NOT NULL auto_increment,
  Empleados_id INT,
  Nombre VARCHAR(15),
  Apellido VARCHAR(15),
  Email VARCHAR(25),
  Teléfono VARCHAR(20),
  Calle VARCHAR(15),
  Ciudad VARCHAR(25),
  CP VARCHAR(9),
  PRIMARY KEY (id)
);

-- Tabla del equipo
CREATE TABLE Equipo (
  id INT NOT NULL auto_increment,
  Equipo_id INT,
  Nombre_Equipo VARCHAR(50),
  Orden_id INT,
  Nombre_técnica VARCHAR(15),
  Empleados_id INT,
  Nombre VARCHAR(15),
  Apellido VARCHAR(15),
  Ciudad VARCHAR(25),
  Segmento_id INT,
  FOREIGN KEY (Segmento_id) REFERENCES Segmento (id),
  FOREIGN KEY (Orden_id) REFERENCES Ordenes (id),
  FOREIGN KEY (Empleados_id) REFERENCES Empleados (id),
  PRIMARY KEY (id)
  );
  
  -- Tabla del target idóneo para el cliente
  CREATE TABLE Target (
  id INT NOT NULL auto_increment,
  Target_id INT,
  Nombre_target Varchar (60),
  Equipo_id INT,
  Segmento_id INT,
  FOREIGN KEY (Segmento_id) REFERENCES Segmento(id),
  FOREIGN KEY (Equipo_id) REFERENCES Equipo(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
  );
  
  -- Tabla de las técnicas de entrevistas disponibles
CREATE TABLE Técnicas_de_entrevista (
id INT NOT NULL auto_increment,
Técnica_de_entrevista_id INT,
Técnica Varchar (20),
Herramientas Varchar (12),
Método_de_trabajo VARCHAR (60),
Segmento_id INT,
FOREIGN KEY (Segmento_id) REFERENCES Segmento(id),
PRIMARY KEY (id)
);

-- Tabla de informes a entregar
CREATE TABLE Informes (
id INT NOT NULL auto_increment,
Informe_id INT,
Resultado VARCHAR (100),
Fecha_informe DATE,
Cliente_id INT,
FOREIGN KEY (Cliente_id) REFERENCES Cliente(id),
PRIMARY KEY (id)
);

-- Tabla de presupuesto
CREATE TABLE Presupuesto (
id INT NOT NULL auto_increment,
Presupuesto_id INT,
Dinero_Disponible INT,
Gastos INT,
Fecha_Informe DATE,
PRIMARY KEY (id)
);

-- Tabla de sedes
CREATE TABLE Sedes (
id INT NOT NULL auto_increment,
Sede_id INT,
Email VARCHAR(25),
CUIT VARCHAR(13),
Teléfono VARCHAR(20),
Calle VARCHAR(15),
Ciudad VARCHAR(25),
CP VARCHAR(9),
PRIMARY KEY (id)
);

-- Tabla de posibles innovaciones que se podrían realizar
CREATE TABLE Posibles_innovaciones (
id INT NOT NULL auto_increment,
Innovaciones_id INT,
Gastos INT,
Herramientas VARCHAR (12),
Fecha_Orden DATE,
Fecha_Informe DATE,
Técnica_de_entrevista_id INT,
Empleados_id INT,
FOREIGN KEY (Técnica_de_entrevista_id) REFERENCES  Técnicas_de_entrevista (id),
FOREIGN KEY (Empleados_id) REFERENCES Empleados (id),
PRIMARY KEY (id)
);

-- Tabla de la posición en el mercado
CREATE TABLE Posición_de_mercado (
id INT NOT NULL auto_increment,
Posición_id INT,
Posición INT,
Posición_de_rivales INT,
PRIMARY KEY (id)
);

-- Tabla de argumentos para los clientes
CREATE TABLE Argumentos_para_clientes (
id INT NOT NULL auto_increment,
Argumentos_id INT,
Gastos INT,
Herramientas VARCHAR (12),
Posición_id INT,
Orden_id INT,
Sedes_id INT,
Presupuesto_id INT,
FOREIGN KEY (Posición_id) REFERENCES Posición_de_mercado (id),
FOREIGN KEY (Orden_id) REFERENCES Ordenes (id),
FOREIGN KEY (Sedes_id) REFERENCES Sedes (id),
FOREIGN KEY (Presupuesto_id) REFERENCES Presupuesto (id),
PRIMARY KEY (id)
);

-- Tabla de los tipos de consulta
CREATE TABLE Tipos_de_Consulta (
id INT NOT NULL auto_increment,
Tipo_id INT,
Rubro VARCHAR (15),
Técnica_de_entrevista_id INT,
FOREIGN KEY (Técnica_de_entrevista_id) REFERENCES  Técnicas_de_entrevista (id),
PRIMARY KEY (id)
);

INSERT INTO Cliente (id, Cliente_id, Razón_social, Email, CUIT, Teléfono, Calle, Ciudad, CP) VALUES
(1, 1, 'Burguer King','burguerking@hotmail', '24-40797152-4', '1568157317', 'Burguercalle','Buenos Aires', '1609'),
(2, 2, 'Mostaza','mostaza@hotmail', '25-40797153-5', '1568157318', 'Mostazacalle', 'Buenos Aires', '1619'),
(3, 3, 'Subway', 'Subway@hotmail', '26-40797154-6', '1568157319', 'Subcalle', 'Santa Fe', '1215');

INSERT INTO Segmento (id, Segmento_id, Edad, Género, Ciudad) VALUES
(1,1, 'Entre 20 y 40 años', 'Varones', 'Ciudad de Buenos Aires'),
(2,2, 'Entre 40 y 59 años', 'Mixto', 'Ciudad de Buenos Aires'),
(3,3, 'Entre 20 y 40 años', 'Mujeres', 'Santa Fe');

INSERT INTO Ordenes (id, Segmento_id, Nombre_encuesta, Cliente_id, Razón_Social_cliente, A_Calle, A_Ciudad, A_CP, fecha_orden, fecha_informe) VALUES
(1, 1, 'KingBurguer', '1', 'BurguerKing', 'king1234', 'Buenos Aires', '1609','2022-12-01', '2023-06-01'),
(2, 3, 'Mostaza', '2', 'Mostaza', 'Mostaza1234', 'Buenos Aires', '1619', '2022-12-02', '2023-06-02'),
(3, 2, 'Subs', '3', 'Subway', 'Sub1234', 'Santa Fe', '1215','2022-12-03', '2023-06-03');

INSERT INTO Empleados (id, Empleados_id, Nombre, Apellido, Email, Teléfono, Calle, Ciudad, CP) VALUES
(1, 1, 'Iván','Rojt','ivanrojt@hotmail', '1568157317', 'Calle1', 'Buenos Aires', 'B1609'),
(2, 2, 'Federico','Rojt','federicorojt@hotmail', '1568157318', 'Calle2', 'Buenos Aires', 'B1610'),
(3, 3, 'Álvaro','Rodriguez','ÁlvaroRogdriguez@hotmail', '1568157339', 'Calle3', 'Buenos Aires', 'b1649');

INSERT INTO Equipo (id, Nombre_Equipo, Orden_id, Segmento_id, Nombre_Técnica, Empleados_id, Nombre, Apellido, Ciudad) VALUES
(1, 'Investigación comida rapida1', 1, 1, 'Encuesta', 1, 'Iván', 'Rojt', 'Buenos Aires'),
(2, 'Investigación comida rapida2', 2, 2, 'Encuesta', 2, 'Federico', 'Rojt', 'Buenos Aires'),
(3, 'Investigación comida rapida3', 3, 3, 'Entrevista', 3, 'Álvaro', 'Rodriguez', 'Santa Fe');

INSERT INTO Target (id, Segmento_id, Nombre_Target, Equipo_id) VALUES
(1,1, 'Personas varones entre 20 y 40 años', 1),
(2,3, 'Personas varones entre 40 y 59 años', 1),
(3,2, 'Personas mujeres entre 20 y 40 años', 1);

INSERT INTO Técnicas_de_entrevista (id, Técnica_de_entrevista_id, Técnica, Herramientas, Método_de_trabajo, Segmento_id) VALUES
(1,1, 'Encuesta', 'Guía', 'Online', 1),
(2,3, 'Entrevista', 'Teléfono', 'Telefónica', 2),
(3,2, 'Entrevista', 'Guía', 'Prescencial', 3);

INSERT INTO Informes (id, Informe_id, Resultado, Fecha_informe, Cliente_id) VALUES
(1,1, '65% interesados en probar nuevos platos con otras carnes', '2023-06-01', 1),
(2,2, '80% interesados en extensión de platos infantiles', '2023-06-02', 2),
(3,3, '25% interesadas en platos con menos calorias y 60% interesadas en extensión del menu', '2023-06-03', 3);

INSERT INTO Presupuesto (id, Dinero_Disponible, Gastos, Fecha_Informe) VALUES
(1, '20000000', '-8000000', '2023-06-01'),
(2, '20000000', '-8000000','2023-06-02'),
(3, '20000000', '-8000000', '2023-06-03');

INSERT INTO Sedes (id, Sede_id, Email, CUIT, Teléfono, Calle, Ciudad, CP) VALUES
(1,1, 'SedeCABA@hotmail.com', '0033445566', '+541168157317', 'Calle1', 'Ciudad de Buenos Aires', 'C1004'),
(2,2, 'SedeGBA@hotmail.com', '0033445566','+541186513771', 'Calle2', 'San Isidro', 'B1609'),
(3,3, 'SedeSantafe@hotmail.com', '0033445566', '+34268157317', 'Calle3', 'Santa Fe Capital', 'S3004');

INSERT INTO Posibles_innovaciones (id, Gastos, Herramientas, Fecha_Orden, Fecha_Informe, Técnica_de_entrevista_id, Empleados_id) VALUES
(1,'-20000', 'Online', '2022-12-01', '2023-06-01', 1, 1),
(2,'-30000', 'Prescencial', '2022-12-02', '2023-06-02', 2, 2),
(3,'-30000', 'Telefónica', '2023-06-03', '2022-12-03', 3, 3);

INSERT INTO Posición_de_mercado (id, Posición_id, Posición, Posición_de_rivales) VALUES
(1, 1, 10, 1),
(2, 2, 10, 7),
(3, 3, 3, 1);

INSERT INTO Argumentos_para_clientes (id, Argumentos_id, Gastos, Herramientas, Posición_id, orden_id, Sedes_id, Presupuesto_id) VALUES
(1, 1,'-20000', 'Online', 1, 1, 1, 1),
(2, 2,'-30000', 'Prescencial', 2, 2, 2, 2),
(3, 3,'-30000', 'Telefónica', 3, 3, 3, 3);

INSERT INTO Tipos_de_Consulta (id, Tipo_id, Rubro, Técnica_de_entrevista_id) VALUES
(1, 1, 'Gastronomía', 1),
(2, 2, 'Gastronomía', 2),
(3, 3, 'Gastronomía', 3);

-- Vista de trabajos que hay en Buenos Aires
Create view Trabajos_en_Buenos_Aires as
Select A_Ciudad,A_CP,Razón_Social_Cliente,Fecha_Orden 
From Ordenes c
INNER JOIN Equipo o ON c.Orden_id = o.Orden_id 
Where Ciudad Like '%Buenos Aires%';

-- Vista de empleados que hay en Buenos Aires
Create view Empleados_en_Buenos_Aires as
Select c.Nombre,c.Apellido,c.Email,c.Teléfono,c.Calle,c.Ciudad,c.CP
From Empleados c
INNER JOIN Equipo o ON c.Empleados_id = o.Empleados_id 
Where o.Ciudad Like '%Buenos Aires%';

-- Vista de los equipos trabajando con un target femenino
Create view Equipo_trabajando_Target_femenino as
Select c.Target_id, c.Segmento_id, c.Nombre_target, c.Equipo_id
From Target c
INNER JOIN Equipo o ON c.Equipo_id = o.Equipo_id 
Where Nombre_Target Like '%Personas mujeres%';

-- Vista de las órdenes de cada cliente
Create view órdenes_de_cada_cliente as
Select c.Cliente_id,c.Razón_Social,c.Teléfono,c.Ciudad,c.CP,c.Pago,c.Monto
From Cliente c
INNER JOIN Ordenes o ON c.Cliente_id = o.Cliente_id
Where c.Cliente_id = o.Cliente_id;

-- Vista de empleados disponibles para los equipos que trabajan en Buenos Aires
Create view Empleados_disponibles_para_equipos_Buenos_Aires as
Select c.Equipo_id,c.Nombre_Equipo,c.Nombre_técnica,c.Ciudad 
From Equipo c
INNER JOIN Empleados o ON c.Empleados_id = o.Empleados_id 
Where c.Ciudad Like '%Buenos Aires%';

DELIMITER //

CREATE FUNCTION designacion_de_empleados (Ciudad_empleado VARCHAR(15), Ciudad_de_orden VARCHAR(15))

RETURNS VARCHAR(2)

DETERMINISTIC

BEGIN

  DECLARE resultado VARCHAR(2);

  SELECT * INTO resultado FROM Empleados

  INNER JOIN Ordenes  ON id_empleado = o.id_empleado

  WHERE A_Ciudad = Ciudad_empleado AND A_Ciudad = Ciudad_de_orden;

  RETURN resultado;

END//

DELIMITER //

CREATE FUNCTION Asignación_target (Nombre_target Varchar (60), Equipo_id int)

RETURNS int

DETERMINISTIC

BEGIN

    DECLARE Equipo int;
    
    SELECT * INTO Nombre_Target FROM Target
    
    INNER JOIN Equipo  ON equipo = equipo;

    RETURN Equipo;
    
END//

DELIMITER //

CREATE PROCEDURE `sp_calcular_ingresos_junio` (OUT total INTEGER)

BEGIN

DECLARE Monto INT;

DECLARE resultado FLOAT;

SELECT COUNT(*) INTO Monto FROM Cliente;

END //

DELIMITER //

Create PROCEDURE `sp_target_femenino` (INOUT Nombre_target VARCHAR (60)) 

BEGIN

DECLARE género FLOAT;

SELECT id INTO Nombre_target

FROM Target

Where Nombre_target LIKE "Personas mujeres"; 

END//

Create PROCEDURE `sp_target_masculino` (INOUT Nombre_target VARCHAR (60)) 

BEGIN

DECLARE género FLOAT;

SELECT id INTO Nombre_target

FROM Target

Where Nombre_target LIKE "Personas varones"; 

END//

DELIMITER //

-- Trigger que actualiza la lista de empleados después de designarlos a un equipo
CREATE TRIGGER Log_Empleados_Delete

BEFORE INSERT ON Equipo

FOR EACH ROW

BEGIN

  DELETE FROM Empleados WHERE Nombre = NEW.Nombre;

  DELETE FROM Empleados WHERE Apellido = NEW.Apellido;

END;

//

DELIMITER ;

DELIMITER //

-- Trigger que actualiza el salario de un empleado después de una compra
CREATE TRIGGER Log_Empleados_Update

AFTER UPDATE ON Equipo

FOR EACH ROW

BEGIN

  INSERT INTO Empleados (Empleados_id) VALUES (NEW.Empleados_id);

END;

//

DELIMITER ;

START TRANSACTION;

DELETE FROM equipo WHERE Segmento_id = 1;

DELETE FROM equipo WHERE Segmento_id = 2;

DELETE FROM equipo WHERE Segmento_id = 3;

DELETE FROM equipo WHERE Segmento_id = 4;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO equipo (Equipo_id, Nombre_Equipo, Segmento_id, Nombre_Técnica, Nombre, Apellido, Ciudad) VALUES (1, 'Investigación comida rapida1', 1, 'Encuesta', 'Iván', 'Rojt', 'Buenos Aires');
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO equipo (Equipo_id, Nombre_Equipo, Segmento_id, Nombre_Técnica, Nombre, Apellido, Ciudad) VALUES (2, 'Investigación comida rapida2', 2, 'Encuesta', 'Federico', 'Rojt', 'Buenos Aires');
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO equipo (Equipo_id, Nombre_Equipo, Segmento_id, Nombre_Técnica, Nombre, Apellido, Ciudad) VALUES (3, 'Investigación comida rapida3', 3, 'Entrevista', 'Álvaro', 'Rodriguez', 'Santa Fe');
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO equipo (Equipo_id, Nombre_Equipo, Segmento_id, Nombre_Técnica, Nombre, Apellido, Ciudad) VALUES (4, 'Investigación comida rapida4', 4, 'Entrevista', 'Álvaro', 'González', 'Santa Fe');
SET FOREIGN_KEY_CHECKS=1;

ROLLBACK;

START TRANSACTION;

INSERT INTO cliente (Pago, Monto) VALUES ('si', 1500000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 2500000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 3000000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 4000000);

SAVEPOINT savepoint1;

INSERT INTO cliente (Pago, Monto) VALUES ('si', 5000000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 5000000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 3000000);

INSERT INTO cliente (Pago, Monto) VALUES ('si', 1000000);

SAVEPOINT savepoint2;

RELEASE SAVEPOINT savepoint1;

COMMIT;

drop user 'read_only@consultora';

flush privileges;

CREATE USER 'read_only@consultora' IDENTIFIED BY 'password_read_only';

GRANT SELECT ON consultora.* TO 'read_only@consultora';

drop user 'read_insert_update@consultora';

flush privileges;

CREATE USER 'read_insert_update@consultora' IDENTIFIED BY 'password_read_insert_update';

GRANT SELECT, INSERT, UPDATE ON consultora.* TO 'read_insert_update@consultora';