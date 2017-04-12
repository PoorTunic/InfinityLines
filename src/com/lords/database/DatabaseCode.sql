-- Crecion de la base de datos: INFINITELINES03
-- 17/03/2017
-- Burgueño Sanchez Ivan Samuel
-- Clemente Aguirre Daniel
-- Palacios Oviedo Victor
-- Carreon Manriquez Paula Shade

-- CREACIÓN DE LA BASE DE DATOS

CREATE DATABASE verifact CHARACTER SET 'UTF8';
USE verifact;

-- CREACIÓN DE TABLAS

-- TABLA PROVEEDOR

CREATE TABLE proveedor(
id_proveedor INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
proveedor VARCHAR(100) NOT NULL
)Engine=Innodb;

-- TABLA SERVICIO

CREATE TABLE servicio(
id_servicio INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
servicio VARCHAR(100) NOT NULL,
id_proveedor INT(5),
FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
)Engine=Innodb;

-- TABLA FACTURA

CREATE TABLE factura(
folio_factura VARCHAR(50) PRIMARY KEY NOT NULL,
fecha_recep DATE NOT NULL,
quincena CHAR(7) NOT NULL,
estado_factura CHAR(9) NOT NULL,
factura_img VARCHAR(100),
subtotal FLOAT(8,2) NOT NULL,
iva FLOAT(8,2) NOT NULL,
total FLOAT(8,2) NOT NULL
)Engine=Innodb;

-- TABLA ORDEN_PAGO

CREATE TABLE orden_pago(
no_orden_pago INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
solicitante VARCHAR(50) DEFAULT 'C.P. Armando Mendoza Delgado',
fecha_orden DATE NOT NULL,
departamento VARCHAR(50) DEFAULT 'Estadio Azul',
tipo_pago VARCHAR (15) NOT NULL,
importe_numero FLOAT(8,2) NOT NULL,
importe_letra VARCHAR(50) NOT NULL,
aplic_contable VARCHAR(80) NOT NULL,
gerente_area VARCHAR(30) DEFAULT 'Lic. Pedro Ruiz Isunza',
direccion_area VARCHAR(30) DEFAULT 'C.P. Isaac Velasco Alcantara'
)Engine=Innodb;

-- TABLA PAGO

CREATE TABLE pago(
id_pago INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
no_orden_pago INT(5) NOT NULL,
estado_pago VARCHAR(15) NOT NULL,
id_servicio INT(5) NOT NULL, 
folio_factura VARCHAR(50) NOT NULL,
FOREIGN KEY (no_orden_pago) REFERENCES orden_pago(no_orden_pago),
FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
FOREIGN KEY (folio_factura) REFERENCES factura(folio_factura)
)Engine=Innodb;

-- TABLA USUARIO

CREATE TABLE usuario(
id_usuario INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_usuario VARCHAR(60),
apatUsuario VARCHAR(60),
amatUsuario VARCHAR(60),
username VARCHAR(12),
password VARCHAR(15),
enabled INT(11)
)ENGINE=InnoDB;

-- TABLA ROLL USUARIO

CREATE TABLE rollusuario(
id_roll INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_usuario INT(11) DEFAULT NULL,
user_name VARCHAR(12) DEFAULT NULL,
roll VARCHAR(20) DEFAULT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;


-- _____________________________________________________________________________
-- REGISTROS DE USUARIOS
INSERT INTO usuario VALUES(
NULL,
'Ryuu',
'Eru',
'Lawliet',
'sixnore',
'password',
01
);

INSERT INTO usuario VALUES(
NULL,
'Daniel',
'Alias',
'Pigmeo',
'poortunic',
'password',
02
);

INSERT INTO usuario VALUES(
NULL,
'Victor',
'Alias',
'El inge',
'inge',
'password',
03
);

INSERT INTO usuario VALUES(
NULL,
'Zero',
'Metralletas',
'Oscuras',
'zero',
'123456789',
04
);

INSERT INTO usuario VALUES(
NULL,
'Pau',
'Alias',
'Shade',
'shade',
'password',
05
);

-- _____________________________________________________________________________
-- REGISTROS DE ROLL USUARIOS

INSERT INTO rollusuario VALUES(
NULL,
1,
'sixnore',
'admon'
);

INSERT INTO rollusuario VALUES(
NULL,
2,
'poortunic',
'admon'
);

INSERT INTO rollusuario VALUES(
NULL,
3,
'inge',
'admon'
);

INSERT INTO rollusuario VALUES(
NULL,
4,
'zero',
'admon'
);

INSERT INTO rollusuario VALUES(
NULL,
5,
'shade',
'admon'
);

-- ______________________________________________________________________________
-- DESCRIPCION DE TABLAS

DESC servicio;
DESC pago;
DESC factura;
DESC cheque;

-- ______________________________________________________________________________
-- VISUALIZACION DE TODOS LOS REGISTROS

SELECT * FROM servicio;
SELECT * FROM pago;
SELECT * FROM factura;
SELECT * FROM cheque;