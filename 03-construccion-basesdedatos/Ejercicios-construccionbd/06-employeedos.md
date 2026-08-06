##CODIGO
```
CREATE DATABASE empresa_2;
GO

USE empresa_2;
GO


CREATE TABLE department(
number INT NOT NULL,
name VARCHAR(30) NOT NULL,
manager INT NOT NULL,
start_date DATE NOT NULL,
CONSTRAINT pk_department
PRIMARY KEY (number, name),
CONSTRAINT uq_department_manager
UNIQUE (manager)
);
GO

CREATE TABLE employee(
ssn INT NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
address VARCHAR(80) NOT NULL,
bdate DATE NOT NULL,
salary DECIMAL(10,2) NOT NULL,
sex CHAR(1) NOT NULL,
jefe INT NULL,
number_dep INT NOT NULL,
name_dep VARCHAR(30) NOT NULL,
CONSTRAINT pk_employee
PRIMARY KEY (ssn),
CONSTRAINT fk_employee_jefe
FOREIGN KEY (jefe)
REFERENCES employee(ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_employee_department
FOREIGN KEY (number_dep, name_dep)
REFERENCES department(number, name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

ALTER TABLE department
ADD CONSTRAINT fk_department_manager
FOREIGN KEY (manager)
REFERENCES employee(ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
GO


CREATE TABLE locations(
num_location INT NOT NULL,
number_dep INT NOT NULL,
name_dep VARCHAR(30) NOT NULL,
location VARCHAR(50) NOT NULL,
CONSTRAINT pk_locations
PRIMARY KEY (num_location, number_dep, name_dep),
CONSTRAINT fk_locations_department
FOREIGN KEY (number_dep, name_dep)
REFERENCES department(number, name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE projects(
name VARCHAR(30) NOT NULL,
number INT NOT NULL,
location VARCHAR(50) NOT NULL,
number_dep INT NOT NULL,
name_dep VARCHAR(30) NOT NULL,
CONSTRAINT pk_projects
PRIMARY KEY (name, number),
CONSTRAINT uq_projects_number
UNIQUE (number),
CONSTRAINT fk_projects_department
FOREIGN KEY (number_dep, name_dep)
REFERENCES department(number, name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO


CREATE TABLE dependent(
name VARCHAR(30) NOT NULL,
ssn INT NOT NULL,
sex CHAR(1) NOT NULL,
relationship VARCHAR(30) NOT NULL,
CONSTRAINT pk_dependent
PRIMARY KEY (name, ssn),
CONSTRAINT fk_dependent_employee
FOREIGN KEY (ssn)
REFERENCES employee(ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE works_on(
ssn INT NOT NULL,
name_proj VARCHAR(30) NOT NULL,
number_proj INT NOT NULL,
CONSTRAINT pk_works_on
PRIMARY KEY (ssn, name_proj, number_proj),
CONSTRAINT fk_works_on_employee
FOREIGN KEY (ssn)
REFERENCES employee(ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_works_on_projects
FOREIGN KEY (name_proj, number_proj)
REFERENCES projects(name, number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO
```

##DIAGRAMA

![alt text](../../img/Employee2.png)