/*===================================================================================================================

SQL-DQL en SQLServer

Archivo: 05-consultas-basicas.sql

Descripcion: Introduccion a la ejecucion de las primeras consultas de recuperacion de datos

======================================================================================================================*/

USE comercial_db;
GO


-- Utilizar el operador asterisco (*), no es muy recomendada
-- *, todas las columnas

SELECT *
FROM productos;

-- Seleccionar columnas necesarias (Proyeccion)

SELECT 
  nombre
FROM estados;
GO


SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

SELECT 
	 nombre, apellido_paterno telefono, correo
FROM clientes;
GO


SELECT 
	nombre,
	apellido_paterno,
	telefono,
	correo
FROM clientes;
GO

-- Alias de columna 
-- Es un nombre temporal asignado a una columna dentro del resultado de una consulta


SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;
GO

SELECT 
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio unitario]
FROM productos;
GO

SELECT 
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio unitario'
FROM productos;
GO

--Otra forma de poner alias No recomendada)

SELECT 
	codigo  codigo_producto,
	nombre  nombre_producto,
	precio  precio_unitario
FROM productos;
GO


-- Alias de tabla
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;


SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos AS p;


SELECT 
	categorias.id_categoria AS [numero_categoria],
	categorias.nombre AS [nombre_categoria],
	id_producto AS [numero_producto],
	productos.nombre AS [nombre_producto],
	precio,
	existencia

FROM categorias
INNER JOIN 
productos 
ON categorias.id_categoria = productos.id_categoria;


SELECT 
	c.id_categoria AS [numero_categoria],
	c.nombre AS [nombre_categoria],
	p.id_producto AS [numero_producto],
	p.nombre AS [nombre_producto],
	p.precio,
	p.existencia

FROM categorias AS c
INNER JOIN 
productos AS p
ON c.id_categoria = p.id_categoria;


-- Columnas calculadas 
-- Seleccionar los datos de los productos y el valor del inventario



SELECT 
	p.codigo AS #,
	p.nombre AS [nombre_producto],
	p.precio AS [precio_producto],
	p.existencia AS [existencia_producto],
	(precio * existencia) AS 'valor_inventario'
FROM productos AS p;


-- TODO: ver ejemplos co  campos calculados y operadores aritmeticos
--Seleccionar los datos  de las ventas, numero de venta, cantidad vendida, 
--precio, descuento y calcular el importe bruto, importe con descuento
--(el importe bruto por descuento entre 100) y
--el importe neto (importe bruto por 1 mes el descuento entre 100)


SELECT
dv.id_venta AS [#venta],
dv.cantidad AS [cantidad_venta],
dv.precio AS [precio_venta],
dv.descuento AS  [descuento],
(dv.cantidad * dv.precio) AS [importe_bruto],
(dv.cantidad * dv.precio * descuento/100.0) AS importe_descuento,
dv.cantidad * dv.precio * (1 - descuento / 100.0) AS importe_neto
FROM detalle_ventas AS dv;

--USO DE DISTINTCT

--Elimina del resutado las filas que tengan valores repetidos en todas las
--columnas seeccionadas

/*========================================================================
	SELECT DISTINCT columna
	FROM tabla;

========================================================================*/

--Ejemplo sin distinct 
--Selecciona los sexos de los clientes 

SELECT sexo
FROM clientes;

--Ejemplo con distinct
SELECT DISTINCT 
sexo
FROM clientes;

--Seleccionar los distintos descuentos que se han aplicado a las ventas
SELECT
	dv.descuento
	FROM detalle_ventas AS dv;

--Seleccionar los distintos departamentos a los que pertenecen los empleados

SELECT DISTINCT 
	e.id_departamento AS [deaprtamento]
FROM empleados AS e;

SELECT DISTINCT
	e.id_empleado
FROM empleados AS e;

--DISTINCT PARA VARIS COLUMNAS
--cuando se utiliza con varias columnas se evalua la combinacion completa

SELECT 
	p.id_categoria,
	p.id_proveedor
FROM productos AS p
ORDER BY p.id_categoria, p.id_proveedor;
GO

/*======================================================================

SELECT TOP (cantidad)
	columna_1,
	columna_2,
	columna_n
FROM TABLA 

======================================================================*/

SELECT TOP  (15)
	id_producto,
	codigo
	FROM productos AS p;

--SELECCIONAR los promeros 5 productos que aparezcan en la consulta mostrando 
--el codigo, nombre, precio, existencia y el valor del inventario de la tabla productos

SELECT  TOP (5)
p.codigo,
p.nombre,
p.precio,
p.existencia,
(p.precio * p.existencia) AS valor_inventario
FROM productos AS p;

--top con porcentaje
--sql server permite limitar el resultado mediante porcentaje 

/*
SELECT TOP (porcentaje ) PERCENT
	columnas
FROM tabla;
*/

--seleccionar el 10% de los registros de la tabla productos mostrando el numero de producto, codigo y el nombre 

SELECT TOP (10) PERCENT
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS p;
GO

--Seleccionar los tres primeros descuentos distintos

SELECT DISTINCT TOP (3)
	descuento
FROM detalle_ventas AS dv;


