CREATE DATABASE bdconstraints;
GO 

USE bdconstraints;
GO
--Razon de cardinalidad de 1:1--
CREATE TABLE paciente (
Numpaciente INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Apellido1 VARCHAR(20) NOT NULL,
Apellido2 VARCHAR(20) NULL,
Fechanaci DATE NOT NULL
CONSTRAINT pk_paciente
PRIMARY KEY (Numpaciente)
);
GO

CREATE TABLE expediente (
NumExp INT NOT NULL,
Fechaapertura DATE NOT NULL,
Tipodesangre CHAR (3) NOT NULL,
paciente INT NOT NULL, 
CONSTRAINT pk_expediente
PRIMARY KEY (NumExp),
CONSTRAINT unique_numpaciente
UNIQUE (paciente),
CONSTRAINT fk_expediente_paciente
FOREIGN KEY (paciente)
REFERENCES paciente (Numpaciente)
);
GO

INSERT INTO paciente 
VALUES (1, 'Kevin', 'Kosner', 'Lopez', '2007-02-18');

INSERT INTO paciente 
VALUES (2, 'Daniel', 'Martinez', 'Mendoze', '2005-01-30');

INSERT INTO paciente 
VALUES (3, 'Luis Fernando', 'Nieto', NULL, '2007-07-04');

SELECT *
FROM paciente;

INSERT INTO expediente
VALUES (1, GETDATE(),'+O', 1);

INSERT INTO expediente
VALUES (2, GETDATE(),'+A', 2);

INSERT INTO expediente
VALUES (3, GETDATE(),'+b', 3);

SELECT
e.NumExp,
e.Fechaapertura,
e.Tipodesangre,
CONCAT(P.Nombre, ' ', p.Apellido1, ' ', P.Apellido2) 
AS [Nombre Completo]
FROM expediente AS e
INNER JOIN paciente AS p
ON E.paciente = p.Numpaciente

GO
--Razon de cardinalidad de 1:N--
CREATE TABLE profesor (
Numprof INT not null IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
Apellido1 VARCHAR (30) NOT NULL,
Apellido2 VARCHAR (30) NULL,
);

GO

CREATE TABLE curso (
Numcurso INT NOT NULL,
Nombre VARCHAR (20) NOT NULL,
Creditos INT NOT NULL,
numprof INT NOT NULL,
CONSTRAINT pk_curso
PRIMARY KEY (Numcurso),
CONSTRAINT unique_nombre
UNIQUE (Nombre),
CONSTRAINT check_Creditos
CHECK (Creditos > 0),
CONSTRAINT fk_curso_profesor
FOREIGN KEY (Numprof)
REFERENCES profesor (Numprof)
);

GO

CREATE TABLE especialidad (
Numesp INT NOT NULL,
Numprof INT NOT NULL,
NombreEsp VARCHAR (30) NOT NULL,
CONSTRAINT pk_especialidad
PRIMARY KEY (Numesp,Numprof),
CONSTRAINT unique_nombreesp
UNIQUE (NombreEsp),
CONSTRAINT fk_especialidad_profesor
FOREIGN KEY (Numprof)
REFERENCES profesor (Numprof)
);
GO


SELECT GETDATE()