-- CREAR BASE DE DATOS
CREATE DATABASE comercializadora;
GO

-- UTILIZAR LA BASE DE DATOS
USE comercializadora;
GO

-- TABLE PRODUCTO
CREATE TABLE producto
(
	producto_id CHAR (5) NOT NULL,
	fabricante_id CHAR (3) NOT NULL,
	descripcion VARCHAR (40) NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL, 
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id, fabricante_id),
	CONSTRAINT uq_producto_descripcion
	UNIQUE (descripcion),
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 and 100)
	);
GO
