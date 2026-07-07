# Construccion de Base de Datos con Lenguaje SQL

El lenguaje SQL (Structure Query Lenguaje), se divide en cinco grandes categorias:

1. DDL (Data Definition Lenguaje)
2. DML (Data Manipulation Lenguaje)
3. DQL (Data Query Lenguaje)
4. DCL (Data Control Lenguaje - Controla Permisos ) - GRANT, REVOKE
5. TCL (Transaction Control Lenguaje - Controla transacciones) - BEGIN TRANSACCION, COMMIT, ROLLBACK, SAVEPOINT


## SQL-DDL
**Lenguaje de Definicion de Datos**

Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sobre los objetos de la base de datos:
- _Base de datos_
- _Tablas_
- _Restricciones_
- Vistas
- Indices
- Esquemas
- Store Procedures
- Functions
- Triggers


**Comandos Principales**

| Comandos | Función |
| :--- | :--- |
| CREATE| Crea objetos de la base de datos |
| ALTER | Modifica objetos de la base de datos |
| DROP | Elimina objetos de la base de datos |
| TRUNCATE | Vacia una tabla |
| RENAME | Renombra objetos (según el sistema gestor de base de datos SGBD) |



## SQL-DML
**Lenguaje de manipulacion de datos**

Sirve para **trabajar con la informacion almacenada**

Con este lenguaje no se cambia la estructura, sino los registros

**Comandos Principales**

| Comandos | Función |
| :--- | :--- |
| INSERT| Inserta registros  |
| UPDATE | Actualiza registros |
| DELETE | Elimina registros |



## SQL-DQL
**Lenguaje de Consulta de Datos**

Su funcion es **consultar informacion**

Este es probablemente el grupo mas utilizado 

**Comando Principal**
| Comandos | Función |
| :--- | :--- |
| SELECT| Sirve para consultar Infomrmación |

Generalmente se combina con:

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, FULL, CROSS)
- DISTINCT
- TOP/LIMIT
- Funciones de agregado  (SUM, AVG, MIN, MAX, COUNT)
- Window Functions (Funciones de Ventana)

## Nomenclatura para la construcion de las Bases de Datos (Snake case)

La nomenclatura o convencion que mas se recomienda hoy si se busca una nomenclatura moderna, portable y alineada con buenas practicas en distintos motores de base de datos 

La razón es que funciona de forma consistente en **SQL SERVER, MYSQ O MARIADB** y especialmente en **POSTGRESQL**, donde los identificadores sin comillas se convierten automaticamente  a minusculas. Con **snake_case** evitas problemas de mayusculas y haces que las consultas sean mas legibles.


| Objeto | Convención | Ejemplo |
|:----------|:---------:|----------:|
| Base de Datos | snake_case | control_escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | Singular en snake_case | cliente, pedido, detalle_pedido |
| Columna | snake_case | cliente_id, fecha_registro, correo_electronico |
| PK | <tabla>_id | cliente_id, producto_id |
| FK | igual que la PK referenciada | cliente_id, categoria_id |
| Tabla puente | <Tabla1>_<Tabla2> | alumno_curso|


## Nombrar las Restricciones 
 - pk_cliente
  - fk_pedido_cliente
  - uq_cliente_correo_electronico
  - ck_producto_precio
  - df_cliente_activo
  - ix_pedido_fecha

  **Prefijos**

  - pk (Primary key)
  - fk (Foregin key)
  - uq (unique)
  - ck (check)
  - df (default)
  - ix (index)

  
  


