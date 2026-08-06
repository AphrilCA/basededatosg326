##CODIGO
```
CREATE DATABASE corporativa;
GO

USE corporativa;
GO

CREATE TABLE puesto(
clave_puesto INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
salario_minimo DECIMAL(10,2) NOT NULL,
salario_maximo DECIMAL(10,2) NOT NULL,
nivel_jerarquico INT NOT NULL,
CONSTRAINT pk_puesto
PRIMARY KEY (clave_puesto),
CONSTRAINT uq_puesto_nombre
UNIQUE (nombre)
);
GO


CREATE TABLE sucursal(
clave_sucursal INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
ciudad VARCHAR(30) NOT NULL,
estado VARCHAR(30) NOT NULL,
CONSTRAINT pk_sucursal
PRIMARY KEY (clave_sucursal)
);
GO

CREATE TABLE departamento(
clave_departamento INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
ubicacion VARCHAR(40) NOT NULL,
presupuesto DECIMAL(10,2) NOT NULL,
num_administrador INT NULL,
CONSTRAINT pk_departamento
PRIMARY KEY (clave_departamento),
CONSTRAINT uq_departamento_nombre
UNIQUE (nombre)
);
GO

CREATE TABLE proyecto(
clave_proyecto INT NOT NULL,
nombre VARCHAR(40) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NULL,
presupuesto DECIMAL(10,2) NOT NULL,
CONSTRAINT pk_proyecto
PRIMARY KEY (clave_proyecto),
CONSTRAINT uq_proyecto_nombre
UNIQUE (nombre)
);
GO


CREATE TABLE capacitacion(
num_capacitacion INT NOT NULL,
nombre VARCHAR(40) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NULL,
CONSTRAINT pk_capacitacion
PRIMARY KEY (num_capacitacion)
);
GO

CREATE TABLE empleado(
num_empleado INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido_paterno VARCHAR(30) NOT NULL,
apellido_materno VARCHAR(30) NULL,
telefono VARCHAR(15) NOT NULL,
correo VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NOT NULL,
sueldo DECIMAL(10,2) NOT NULL,
num_jefe INT NULL,
clave_puesto INT NOT NULL,
clave_departamento INT NOT NULL,
clave_sucursal INT NOT NULL,
CONSTRAINT pk_empleado
PRIMARY KEY (num_empleado),
CONSTRAINT uq_empleado_correo
UNIQUE (correo),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (num_jefe)
REFERENCES empleado(num_empleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_empleado_puesto
FOREIGN KEY (clave_puesto)
REFERENCES puesto(clave_puesto)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_empleado_departamento
FOREIGN KEY (clave_departamento)
REFERENCES departamento(clave_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_empleado_sucursal
FOREIGN KEY (clave_sucursal)
REFERENCES sucursal(clave_sucursal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_administrador
FOREIGN KEY (num_administrador)
REFERENCES empleado(num_empleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO


CREATE TABLE participa(
num_empleado INT NOT NULL,
clave_proyecto INT NOT NULL,
rol VARCHAR(30) NOT NULL,
horas INT NOT NULL,
CONSTRAINT pk_participa
PRIMARY KEY (num_empleado, clave_proyecto),
CONSTRAINT fk_participa_empleado
FOREIGN KEY (num_empleado)
REFERENCES empleado(num_empleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_participa_proyecto
FOREIGN KEY (clave_proyecto)
REFERENCES proyecto(clave_proyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO


CREATE TABLE asiste(
num_empleado INT NOT NULL,
num_capacitacion INT NOT NULL,
fecha_asignacion DATE NOT NULL,
calificacion DECIMAL(4,2) NOT NULL,
estatus VARCHAR(20) NOT NULL,
CONSTRAINT pk_asiste
PRIMARY KEY (num_empleado, num_capacitacion),
CONSTRAINT fk_asiste_empleado
FOREIGN KEY (num_empleado)
REFERENCES empleado(num_empleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_asiste_capacitacion
FOREIGN KEY (num_capacitacion)
REFERENCES capacitacion(num_capacitacion)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO
```

##DIAGRAMA
![alt text](../../img/Corporativa.png)