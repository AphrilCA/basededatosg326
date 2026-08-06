## CODIGO
```
CREATE DATABASE escuela;
GO

USE escuela;
GO

CREATE TABLE profesor (
num_prof INT NOT NULL,
nombre VARCHAR (50) NOT NULL,
apellido_paterno VARCHAR (20) NOT NULL,
apellido_materno VARCHAR (20) NULL,
CONSTRAINT pk_profesor
PRIMARY KEY (num_prof)
);
GO

CREATE TABLE curso(
num_curso INT NOT NULL,
nombre_curso VARCHAR (20) NOT NULL,
creditos INT NOT NULL,
num_prof INT NOT NULL,
CONSTRAINT pk_curso
PRIMARY KEY (num_curso),
CONSTRAINT uq_curso_nombre_curso
UNIQUE (nombre_curso),
CONSTRAINT fk_curso_profesor
FOREIGN KEY (num_prof)
REFERENCES profesor(num_prof)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE especialidad (
num_esp INT NOT NULL,
num_prof INT NOT NULL,
nombre VARCHAR(30) not null,
CONSTRAINT pk_especialidad
PRIMARY KEY (num_esp, num_prof),
CONSTRAINT fk_especialidad_profesor
FOREIGN KEY (num_prof)
REFERENCES profesor (num_prof)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

SELECT *
FROM curso;
```
## DIAGRAMA
![alt text](../../img/Escuela.png)
