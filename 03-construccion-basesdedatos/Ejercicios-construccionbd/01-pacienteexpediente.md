## CODIGO
```
CREATE DATABASE hospital;
GO

USE hospital;
GO

CREATE TABLE paciente (
num_paciente INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR (20) NOT NULL,
apellido2 VARCHAR (20) NULL,
fecha_naci DATE NOT NULL,
CONSTRAINT pk_paciente
PRIMARY KEY (num_paciente)
);
GO

CREATE TABLE expedeinte(
num_exp INT NOT NULL,
fecha_apertura DATE NOT NULL,
tipo_sangre CHAR (3) NOT NULL,
num_paciente INT NOT NULL,
CONSTRAINT pk_expediente
PRIMARY KEY (num_exp),
CONSTRAINT uq_expediente_num_paciente
UNIQUE (num_paciente),
CONSTRAINT fk_expedeinte_paciente
FOREIGN KEY (num_paciente)
REFERENCES paciente (num_paciente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO
```

## DIAGRAMA


![Prueba](../../img/paciente_expediente.png)