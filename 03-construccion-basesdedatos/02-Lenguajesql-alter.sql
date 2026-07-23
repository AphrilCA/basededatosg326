CREATE DATABASE bdejemplo
GO

USE bdejemplo
GO
-- ALTER TABLE

CREATE TABLE alumno (
alumno_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR (20) NOT NULL,
apellido_paterno VARCHAR (15) NOT NULL,
apellido_materno VARCHAR (15)
);

-- Agregar una columna
ALTER TABLE alumno 
ADD telefono VARCHAR (20);

-- Agregar varias columnas
ALTER TABLE alumno
ADD 
urp CHAR (18),
rfc CHAR (13) NOT NULL;
GO

-- Modificar un campo y su tipo de dato
ALTER TABLE alumno
ALTER COLUMN 
telefono VARCHAR (30);
GO
--Restricciones
--PK

ALTER TABLE alumno
ADD CONSTRAINT pk_alumno
PRIMARY KEY (alumno_id);

-- Foreign Key
CREATE TABLE carrera (
carrera_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR (30) NOT NULL,
);
GO

ALTER TABLE carrera
ADD CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id);
GO

ALTER TABLE alumno
ADD carrera_id INT NOT NULL;
GO

ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY(carrera_id)
REFERENCES carrera(carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

ALTER TABLE alumno
ADD CONSTRAINT pk_alumno
PRIMARY KEY (alumno_id);


--Check 
ALTER TABLE alumno
ADD edad INT NOT NULL;

--- Restriccion Chekc

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad
CHECK (edad > 0);

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_telefono
CHECK (telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

INSERT INTO carrera
VALUES ('Tecnologias de Información');

INSERT INTO alumno
VALUES ('Monico Toribio', 'Cervantes', 'Chimbo', '773-146-2447', 'qwertyui', 'jjfjhddrt', 18);

SELECT *
FROM alumno;

DELETE FROM alumno;
 -- Restriccion default

 ALTER TABLE alumno
 ADD activo  BIT NOT NULL;

 ALTER TABLE alumno
 ADD CONSTRAINT df_alumno_activo
 DEFAULT 1
 FOR activo;

 --UNIQUE

 ALTER TABLE carrera
 ADD CONSTRAINT uq_carrera_nombre
 UNIQUE (nombre);

 --Eliminar restricciones

 --Restriccion FK

 ALTER TABLE alumno
 DROP CONSTRAINT fk_alumno_carrera;

-- Eliminar pk
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;
ALTER TABLE carrera 
DROP CONSTRAINT pk_carrera;

--Eliminar check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_telefono;

--Eliminar unique

ALTER TABLE carrera
DROP CONSTRAINT uq_carrera_nombre;

--Eliminar columna

ALTER TABLE alumno
DROP COLUMN carrera_id;

-- DROP (elimina objetos de la bd completos (tables, views, stored, prodcedures, trigger, bd))

DROP TABLE carrera;
DROP TABLE alumno;

-- Eliminar la base de datos
USE master;
GO

IF DB_ID ('bdejemplo') IS NOT NULL
BEGIN
	DROP DATABASE bdejemplo;
END







