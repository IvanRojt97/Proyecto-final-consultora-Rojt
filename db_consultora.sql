CREATE TABLE cliente(
id INT NOT NULL auto_increment,
cliente_id INT,
razón_social VARCHAR(30),
email VARCHAR(25),
cuit VARCHAR(13),
teléfono VARCHAR(20),
calle VARCHAR(15),
ciudad VARCHAR(25),
cp VARCHAR(9),
pago VARCHAR(2),
monto VARCHAR(13),
PRIMARY KEY (id)
);

-- Tabla de Segmentos trabajados
CREATE TABLE segmento(
id INT NOT NULL auto_increment,
segmento_id INT,
edad VARCHAR (20),
género VARCHAR (10),
ciudad VARCHAR (25),
PRIMARY KEY (id)
);

-- Tabla de las Ordenes activas
CREATE TABLE ordenes(
id INT NOT NULL auto_increment,
orden_id INT,
nombre_encuesta VARCHAR(12),
cliente_id INT,
razón_social_cliente VARCHAR(30),
a_calle  VARCHAR(15),
a_ciudad VARCHAR (15),
a_cp VARCHAR (15),
fecha_orden DATE,
fecha_informe DATE,
segmento_id INT,
FOREIGN KEY (segmento_id)REFERENCES segmento (id),
FOREIGN KEY (cliente_id) REFERENCES cliente (id),
PRIMARY KEY (id)
);

-- Tabla de empleados
CREATE TABLE empleados(
id INT NOT NULL auto_increment,
empleados_id INT,
nombre VARCHAR(15),
apellido VARCHAR(15),
email VARCHAR(25),
teléfono VARCHAR(20),
calle VARCHAR(15),
ciudad VARCHAR(25),
cp VARCHAR(9),
PRIMARY KEY (id)
);

-- Tabla del equipo
CREATE TABLE equipo(
id INT NOT NULL auto_increment,
equipo_id INT,
nombre_equipo VARCHAR(50),
orden_id INT,
nombre_técnica VARCHAR(15),
empleados_id INT,
nombre VARCHAR(15),
apellido VARCHAR(15),
ciudad VARCHAR(25),
segmento_id INT,
FOREIGN KEY (segmento_id) REFERENCES segmento (id),
FOREIGN KEY (orden_id) REFERENCES ordenes (id),
FOREIGN KEY (empleados_id) REFERENCES empleados (id),
PRIMARY KEY (id)
);

-- Tabla del target idóneo para el cliente
CREATE TABLE target(
id INT NOT NULL auto_increment,
target_id INT,
nombre_target VARCHAR (60),
equipo_id INT,
segmento_id INT,
FOREIGN KEY (segmento_id) REFERENCES segmento(id),
FOREIGN KEY (equipo_id) REFERENCES equipo(id) ON DELETE CASCADE,
PRIMARY KEY (id)
);

-- Tabla de las técnicas de entrevistas disponibles
CREATE TABLE técnicas_de_entrevista(
id INT NOT NULL auto_increment,
técnica_de_entrevista_id INT,
técnica VARCHAR (20),
herramientas VARCHAR (12),
método_de_trabajo VARCHAR (60),
segmento_id INT,
FOREIGN KEY (segmento_id) REFERENCES segmento(id),
PRIMARY KEY (id)
);

-- Tabla de informes a entregar
CREATE TABLE informes (
id INT NOT NULL auto_increment,
informe_id INT,
resultado VARCHAR (100),
fecha_informe DATE,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
PRIMARY KEY (id)
);

-- Tabla de presupuesto
CREATE TABLE presupuesto(
id INT NOT NULL auto_increment,
presupuesto_id INT,
dinero_disponible INT,
gastos INT,
fecha_informe DATE,
PRIMARY KEY (id)
);

-- Tabla de sedes
CREATE TABLE sedes (
id INT NOT NULL auto_increment,
sede_id INT,
email VARCHAR(25),
cuit VARCHAR(13),
teléfono VARCHAR(20),
calle VARCHAR(15),
ciudad VARCHAR(25),
cp VARCHAR(9),
PRIMARY KEY (id)
);

-- Tabla de posibles innovaciones que se podrían realizar
CREATE TABLE posibles_innovaciones (
id INT NOT NULL auto_increment,
innovaciones_id INT,
gastos INT,
herramientas VARCHAR (12),
fecha_orden DATE,
fecha_informe DATE,
técnica_de_entrevista_id INT,
empleados_id INT,
FOREIGN KEY (técnica_de_entrevista_id) REFERENCES técnica_de_entrevista_id (id),
FOREIGN KEY (empleados_id) REFERENCES empleados (id),
PRIMARY KEY (id)
);

-- Tabla de la posición en el mercado
CREATE TABLE posición_de_mercado (
id INT NOT NULL auto_increment,
posición_id INT,
posición INT,
posición_de_rivales INT,
PRIMARY KEY (id)
);

-- Tabla de argumentos para los clientes
CREATE TABLE argumentos_para_clientes(
id INT NOT NULL auto_increment,
argumentos_id INT,
gastos INT,
herramientas VARCHAR (12),
posición_id INT,
orden_id INT,
sedes_id INT,
presupuesto_id INT,
FOREIGN KEY (posición_id) REFERENCES posición_de_mercado (id),
FOREIGN KEY (orden_id) REFERENCES ordenes (id),
FOREIGN KEY (sedes_id) REFERENCES sedes (id),
FOREIGN KEY (presupuesto_id) REFERENCES presupuesto (id),
PRIMARY KEY (id)
);

-- Tabla de los tipos de consulta
CREATE TABLE tipos_de_consulta(
id INT NOT NULL auto_increment,
tipo_id INT,
rubro VARCHAR (15),
técnica_de_entrevista_id INT,
FOREIGN KEY (técnica_de_entrevista_id) REFERENCES técnicas_de_entrevista (id),
PRIMARY KEY (id)
);

INSERT INTO cliente(id, cliente_id, razón_social, email, cuit, teléfono, calle, ciudad, cp) VALUES      
(1, 1, 'Burguer King', 'burguerking@hotmail', '24-40797152-4', '1568157317', 'Burguercalle', 'Buenos Aires', '1609'),
(2, 2, 'Mostaza', 'mostaza@hotmail', '25-40797153-5', '1568157318', 'Mostazacalle', 'Buenos Aires', '1619'),
(3, 3, 'Subway', 'Subway@hotmail', '26-40797154-6', '1568157319', 'Subcalle', 'Santa Fe', '1215');

INSERT INTO segmento(id, segmento_id, edad, género, ciudad) VALUES      
(1, 1, 'Entre 20 y 40 años', 'Varones', 'Ciudad de Buenos Aires'),
(2, 2, 'Entre 40 y 59 años', 'Mixto', 'Ciudad de Buenos Aires'),
(3, 3, 'Entre 20 y 40 años', 'Mujeres', 'Santa Fe');

INSERT INTO ordenes(id, segmento_id, nombre_encuesta, cliente_id, razón_social_cliente, a_calle, a_ciudad, a_cp, fecha_orden, fecha_informe)VALUES
(1, 1, 'KingBurguer', '1', 'BurguerKing', 'king1234', 'Buenos Aires', '1609', '2022-12-01', '2023-06-01'),
(2, 3, 'Mostaza', '2', 'Mostaza', 'Mostaza1234', 'Buenos Aires', '1619', '2022-12-02', '2023-06-02'),
(3, 2, 'Subs', '3', 'Subway', 'Sub1234', 'Santa Fe', '1215', '2022-12-03', '2023-06-03');

INSERT INTO empleados (id, empleados_id, nombre, apellido, email, teléfono, calle, ciudad, cp) VALUES
(1, 1, 'Iván', 'Rojt', 'ivanrojt@hotmail', '1568157317', 'Calle1', 'Buenos Aires', 'B1609'),
(2, 2, 'Federico', 'Rojt', 'federicorojt@hotmail', '1568157318', 'Calle2', 'Buenos Aires', 'B1610'),
(3, 3, 'Álvaro', 'Rodriguez', 'ÁlvaroRogdriguez@hotmail', '1568157339', 'Calle3', 'Buenos Aires', 'b1649');

INSERT INTO equipo (id, nombre_equipo, orden_id, segmento_id, nombre_técnica, empleados_id, nombre, apellido, ciudad) VALUES
(1, 'Investigación comida rapida1', 1, 1, 'Encuesta', 1, 'Iván', 'Rojt', 'Buenos Aires'),
(2, 'Investigación comida rapida2', 2, 2, 'Encuesta', 2, 'Federico', 'Rojt', 'Buenos Aires'),
(3, 'Investigación comida rapida3', 3, 3, 'Entrevista', 3, 'Álvaro', 'Rodriguez', 'Santa Fe');

INSERT INTO target (id, segmento_id, nombre_target, equipo_id) VALUES
(1, 1, 'Personas varones entre 20 y 40 años', 1), 
(2, 3, 'Personas varones entre 40 y 59 años', 1), 
(3, 2, 'Personas mujeres entre 20 y 40 años', 1);

INSERT INTO técnicas_de_entrevista(id, técnica_de_entrevista_id, técnica, herramientas, método_de_trabajo, segmento_id) VALUES
(1, 1, 'Encuesta', 'Guía', 'Online', 1),
(2, 3, 'Entrevista', 'Teléfono', 'Telefónica', 2),
(3, 2, 'Entrevista', 'Guía', 'Prescencial', 3);

INSERT INTO informes (id, informe_id, resultado, fecha_informe, cliente_id) VALUES
(1, 1,'65% interesados en probar nuevos platos con otras carnes', '2023-06-01', 1),
(2, 2, '80% interesados en extensión de platos infantiles', '2023-06-02',2),
(3,3,'25% interesadas en platos con menos calorias y 60% interesadas en extensión del menu', '2023-06-03',3);

INSERT INTO presupuesto (id, dinero_disponible, gastos, fecha_informe) VALUES
(1, '20000000', '-8000000', '2023-06-01'),
(2, '20000000', '-8000000', '2023-06-02'),
(3, '20000000', '-8000000', '2023-06-03');

INSERT INTO sedes (id, sede_id, email, cuit, teléfono, calle, ciudad, cp) VALUES
(1, 1, 'SedeCABA@hotmail.com', '0033445566', '+541168157317', 'Calle1', 'Ciudad de Buenos Aires', 'C1004'),
(2, 2, 'SedeGBA@hotmail.com', '0033445566', '+541186513771', 'Calle2', 'San Isidro', 'B1609'),
(3, 3, 'SedeSantafe@hotmail.com', '0033445566', '+34268157317', 'Calle3', 'Santa Fe Capital', 'S3004');

INSERT INTO posibles_innovaciones (id, gastos, herramientas, fecha_orden, fecha_informe, técnica_de_entrevista_id, empleados_id) VALUES
(1, '-20000', 'Online', '2022-12-01', '2023-06-01', 1, 1),
(2, '-30000', 'Prescencial', '2022-12-02', '2023-06-02', 2, 2),
(3, '-30000', 'Telefónica', '2023-06-03', '2022-12-03', 3, 3);

INSERT INTO posición_de_mercado (id, posición_id, posición, posición_de_rivales) VALUES      
(1, 1, 10, 1),
(2, 2, 10, 7),
(3, 3, 3, 1);

INSERT INTO argumentos_para_clientes (id, argumentos_id, gastos, herramientas, posición_id, orden_id, sedes_id, presupuesto_id) VALUES      
(1, 1, '-20000', 'Online', 1, 1, 1, 1),
(2, 2, '-30000', 'Prescencial', 2, 2, 2, 2),
(3, 3, '-30000', 'Telefónica', 3, 3, 3, 3);

INSERT INTO tipos_de_consulta (id, tipo_id, rubro, técnica_de_entrevista_id) VALUES
(1, 1, 'Gastronomía', 1),
(2, 2, 'Gastronomía', 2),
(3, 3, 'Gastronomía', 3);