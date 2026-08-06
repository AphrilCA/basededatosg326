CREATE DATABASE control_escuela;
GO

USE control_escuela;
GO

CREATE TABLE alumno(
id_alumno INT NOT NULL,
matricula VARCHAR(10) NOT NULL,
nombre NVARCHAR(30) NOT NULL,
apellido_1 NVARCHAR(20) NOT NULL,
apellido_2 NVARCHAR(20) NULL,
semestre INT NOT NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id_alumno),
CONSTRAINT uq_alumno_matricula
UNIQUE (matricula),
CONSTRAINT ck_alumno_semestre
CHECK (semestre > 0)
);
GO

CREATE TABLE materia(
id_materia INT NOT NULL,
nombre_materia NVARCHAR(20) NOT NULL,
creditos INT NOT NULL,
CONSTRAINT pk_materia
PRIMARY KEY (id_materia),
CONSTRAINT uq_materia_nombre
UNIQUE (nombre_materia),
CONSTRAINT ck_materia_creditos
CHECK (creditos > 0)
);
GO

CREATE TABLE inscribe(
id_materia INT NOT NULL,
id_alumno INT NOT NULL,
fecha_inscripcion DATE NOT NULL,
cal_final DECIMAL(4,2) NOT NULL,
CONSTRAINT pk_inscribe
PRIMARY KEY (id_materia, id_alumno),
CONSTRAINT fk_inscribe_materia
FOREIGN KEY (id_materia)
REFERENCES materia(id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_inscribe_alumno
FOREIGN KEY (id_alumno)
REFERENCES alumno(id_alumno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO