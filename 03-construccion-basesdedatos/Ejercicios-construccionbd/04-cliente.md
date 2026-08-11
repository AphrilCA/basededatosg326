##CODIGO
```
CREATE DATABASE pedidos;
GO

USE pedidos;
GO

CREATE TABLE cliente(
id_cliente INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
CONSTRAINT pk_cliente
PRIMARY KEY (id_cliente)
);
GO

CREATE TABLE pedido(
num_pedido INT NOT NULL,
fecha_pedido INT NOT NULL,
id_cliente INT NOT NULL,
CONSTRAINT pk_pedido
PRIMARY KEY (num_pedido),
CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE producto(
num_producto INT NOT NULL,
nombre_prod VARCHAR(30) NOT NULL,
precio_prod DECIMAL(10,2) NOT NULL,
CONSTRAINT pk_producto
PRIMARY KEY (num_producto)
);
GO

CREATE TABLE contiene(
numero_pedido INT NOT NULL,
num_prod INT NOT NULL,
cantidad INT NOT NULL,
CONSTRAINT pk_contiene
PRIMARY KEY (numero_pedido, num_prod),
CONSTRAINT fk_contiene_pedido
FOREIGN KEY (numero_pedido)
REFERENCES pedido(num_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_contiene_producto
FOREIGN KEY (num_prod)
REFERENCES producto(num_producto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

USE pedidos;
GO

SELECT *
FROM pedido;

SELECT *
FROM producto;
```

## DIAGRAMA

![Diagrama de pedidos](./img/Pedidos.png)
