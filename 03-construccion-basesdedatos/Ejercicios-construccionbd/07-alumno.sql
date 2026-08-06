CREATE DATABASE control_universitario;
GO

USE control_universitario;
GO


CREATE TABLE alumno(
matricula VARCHAR(10) NOT NULL,
nombre VARCHAR(30),
apellido_1 VARCHAR(20),
apellido_2 VARCHAR(20),
correo VARCHAR(50),
fecha_naci DATE,
CONSTRAINT pk_alumno
PRIMARY KEY (matricula)
);
GO

CREATE TABLE departamento(
num_depto INT NOT NULL,
nombre_depto VARCHAR(30),
edificio VARCHAR(30),
CONSTRAINT pk_departamento
PRIMARY KEY (num_depto)
);
GO


CREATE TABLE proyecto(
num_proy INT NOT NULL,
nombre VARCHAR(40),
propuesta VARCHAR(100),
CONSTRAINT pk_proyecto
PRIMARY KEY (num_proy)
);
GO


CREATE TABLE profesor(
num_prof INT NOT NULL,
nombre VARCHAR(30),
apellido_1 VARCHAR(20),
apellido_2 VARCHAR(20),
num_depto INT NOT NULL,
CONSTRAINT pk_profesor
PRIMARY KEY (num_prof),
CONSTRAINT fk_profesor_departamento
FOREIGN KEY (num_depto)
REFERENCES departamento(num_depto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE telefono(
clave_tel INT NOT NULL,
matricula VARCHAR(10) NOT NULL,
telefono VARCHAR(15),
CONSTRAINT pk_telefono
PRIMARY KEY (clave_tel, matricula),
CONSTRAINT fk_telefono_alumno
FOREIGN KEY (matricula)
REFERENCES alumno(matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE credencial(
num_credencial INT NOT NULL,
fecha_exp DATE,
vigencia DATE,
matricula VARCHAR(10) NOT NULL,
CONSTRAINT pk_credencial
PRIMARY KEY (num_credencial),
CONSTRAINT uq_credencial_matricula
UNIQUE (matricula),
CONSTRAINT fk_credencial_alumno
FOREIGN KEY (matricula)
REFERENCES alumno(matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO


CREATE TABLE materia(
clave_materia VARCHAR(10) NOT NULL,
nombre_materia VARCHAR(30),
creditos INT,
num_prof INT NOT NULL,
CONSTRAINT pk_materia
PRIMARY KEY (clave_materia),
CONSTRAINT fk_materia_profesor
FOREIGN KEY (num_prof)
REFERENCES profesor(num_prof)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE dependiente(
nombre_dep VARCHAR(30) NOT NULL,
num_prof INT NOT NULL,
fecha_naci DATE,
parentesco VARCHAR(20),
CONSTRAINT pk_dependiente
PRIMARY KEY (nombre_dep, num_prof),
CONSTRAINT fk_dependiente_profesor
FOREIGN KEY (num_prof)
REFERENCES profesor(num_prof)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO


CREATE TABLE cursa(
matricula VARCHAR(10) NOT NULL,
clave_materia VARCHAR(10) NOT NULL,
fecha_inscripcion DATE,
cal_final DECIMAL(4,2),
CONSTRAINT pk_cursa
PRIMARY KEY (matricula, clave_materia),
CONSTRAINT fk_cursa_alumno
FOREIGN KEY (matricula)
REFERENCES alumno(matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_cursa_materia
FOREIGN KEY (clave_materia)
REFERENCES materia(clave_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE participa(
num_prof INT NOT NULL,
num_proy INT NOT NULL,
rol VARCHAR(30),
CONSTRAINT pk_participa
PRIMARY KEY (num_prof, num_proy),
CONSTRAINT fk_participa_profesor
FOREIGN KEY (num_prof)
REFERENCES profesor(num_prof)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_participa_proyecto
FOREIGN KEY (num_proy)
REFERENCES proyecto(num_proy)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO