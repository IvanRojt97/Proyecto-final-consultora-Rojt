CREATE DATABASE consultora;
USE consultora;

CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  Cliente_id INT,
  Razón_Social VARCHAR(30),
  Email VARCHAR(25),
  CUIT VARCHAR(13),
  Teléfono VARCHAR(20),
  Calle VARCHAR(15),
  Ciudad VARCHAR(15),
  CP VARCHAR(9)
);

CREATE TABLE Órdenes (
  id INT PRIMARY KEY,
  Orden_id INT,
  Segmento_id INT,
  Nombre_Encuesta VARCHAR(12),
  Cliente_id INT,
  Razón_social_Cliente VARCHAR(30),
  A_Calle VARCHAR(15),
  A_Ciudad VARCHAR (15),
  A_CP VARCHAR (15),
  Fecha_Orden DATE,
  Fecha_Informe DATE,
  FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE Empleados (
  id INT PRIMARY KEY,
  Empleados_id INT,
  Nombre VARCHAR(15),
  Apellido VARCHAR(15),
  Email VARCHAR(25),
  Teléfono VARCHAR(20),
  Calle VARCHAR(15),
  Ciudad VARCHAR(15),
  CP VARCHAR(9)
);

CREATE TABLE Equipo (
  id INT PRIMARY KEY,
  Equipo_id INT,
  Nombre_Equipo VARCHAR(50),
  Orden_id INT,
  Segmento_id INT,
  Nombre_técnica VARCHAR(15),
  Empleados_id INT,
  Nombre VARCHAR(15),
  Apellido VARCHAR(15),
  FOREIGN KEY (Orden_id) REFERENCES Órdenes(id),
  FOREIGN KEY (Empleados_id) REFERENCES Empleados(id)
  );
  
  CREATE TABLE Target (
  id INT PRIMARY KEY,
  Target_id INT,
  Segmento_id INT,
  Nombre_target Varchar (60),
  Equipo_id INT,
  FOREIGN KEY (Equipo_id) REFERENCES Equipo(id)
  );

INSERT INTO Cliente (id, Razón_social, Email, CUIT, Teléfono, Calle, Ciudad, CP) VALUES
(1, 'Burguer King','burguerking@hotmail', '24-40797152-4', '1568157317', 'Burguercalle','Buenos Aires', '1609'),
(2, 'Mostaza','mostaza@hotmail', '25-40797153-5', '1568157318', 'Mostazacalle', 'Buenos Aires', '1619'),
(3, 'Subway', 'Subway@hotmail', '26-40797154-6', '1568157319', 'Subcalle', 'Santa Fe', '1215');

INSERT INTO Órdenes (id, Segmento_id, Nombre_encuesta, Cliente_id, Razón_Social_cliente, A_Calle, A_Ciudad, A_CP, fecha_orden, fecha_Informe) VALUES
(1, 1, 'KingBurguer', '1', 'BurguerKing', 'king1234', 'Buenos Aires', '1609','2022-12-01', '2023-06-01'),
(2, 3, 'Mostaza', '2', 'Mostaza', 'Mostaza1234', 'Buenos Aires', '1619', '2022-12-02', '2023-06-02'),
(3, 2, 'Subs', '3', 'Subway', 'Sub1234', 'Santa Fe', '1215','2022-12-03', '2023-06-03');

INSERT INTO Empleados (id, Nombre, Apellido, Email, Teléfono, Calle, Ciudad, CP) VALUES
(1, 'Iván','Rojt','ivanrojt@hotmail', '1568157317', 'Calle1', 'Buenos Aires', 'B1609'),
(2, 'Federico','Rojt','federicorojt@hotmail', '1568157318', 'Calle2', 'Buenos Aires', 'B1610'),
(3, 'Álvaro','Rodriguez','ÁlvaroRogdriguez@hotmail', '1568157339', 'Calle3', 'Buenos Aires', 'b1649');

INSERT INTO Equipo (id, Nombre_Equipo, Orden_id, Segmento_id, Nombre_Técnica, Empleados_id, Nombre, Apellido
) VALUES
(1, 'Investigación comida rapida1', 1, 1, 'Encuesta', 1, 'Iván', 'Rojt'),
(2, 'Investigación comida rapida2', 2, 2, 'Encuesta', 2, 'Federico', 'Rojt'),
(3, 'Investigación comida rapida3', 3, 3, 'Entrevista', 3, 'Álvaro', 'Rodriguez');

INSERT INTO Target (id, Segmento_id, Nombre_Target, Equipo_id) VALUES
(1,1, 'Personas varones entre 20 y 40 años', 1),
(2,3, 'Personas varones entre 40 y 59 años', 1),
(3,2, 'Personas mujeres entre 20 y 40 años', 1);