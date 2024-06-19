/*Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/

CREATE TABLE IF NOT EXISTS Clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	email VARCHAR(255)
	)

/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/

INSERT INTO public.Clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com')

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/

UPDATE public.Clientes
SET email = 'juan@gmail.com'
WHERE id = 1


/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM public.Clientes
WHERE id = 1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS Pedidos(
	id INT PRIMARY KEY,
	cliente_id INT,
	producto VARCHAR(255),
	cantidad int,
	FOREIGN KEY (cliente_id) REFERENCES public.Clientes (id) 
	)

6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.

INSERT INTO public.Clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@gmail.com')
/* vuelvo a introducir el cliente ya que si no no me deja ingresar en la tabla de pedidos debido a que no encuentr la clave foranea*/

INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1,'Camiseta', 2)

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE public.pedidos
SET cantidad = 3
WHERE id = 1

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM public.pedidos
WHERE id = 1

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/

CREATE TABLE IF NOT EXISTS Productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio DEC
	)
/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/

INSERT INTO public.productos (id, nombre, precio)
VALUES (1,'Camiseta', 10.20), (2,'Pantalon', 20.80),(3, 'Calcetines', 5.20),(4, 'Gorra', 15.25),(5, 'Zapatos', 26.30)

/*11. Consultar todos los clientes de la tabla "Clientes".*/
/*primero voy  a introducir varios clientes ya que solo tengo uno actualmente*/

INSERT INTO public.Clientes (id, nombre, email)
VALUES (2, 'Pedro', 'pedro@gmail.com'), 
		(3, 'Joaquin', 'joaquin@gmail.com'), 
		(4, 'Nuria', 'nuria@gmail.com'), 
		(5, 'Manolo', 'manolo@gmail.com')

/*luego realizao la consulta*/

SELECT * FROM public.clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/

/*primero voy  a introducir varios pedidos ya que solo no tengo pedidos actualmente*/

INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 5), 
		(2, 2, 'Pantalon', 4),
		(3, 2, 'Camiseta', 1),
		(4, 3, 'Zapatos', 3),
		(5, 4, 'Pantalon', 2),
		(6, 5, 'Camiseta', 7),
		(7, 5, 'Gorra', 15),
		(8, 1, 'Pantalon', 24),
		(9, 1, 'Camiseta', 2),
		(10, 4, 'Calcetines', 9),
		(11, 3, 'Gorra', 1),
		(12, 3, 'Calcetines', 6)

/*consulta*/

SELECT 
p.producto as producto, 
p.cantidad as cantidad,
c.nombre as nombre FROM public.pedidos p
LEFT JOIN public.clientes c
ON p.cliente_id = c.id


/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

/*cambiare los pantalones a 55 para tener alguna respuesta*/

UPDATE public.productos
SET precio = 55
WHERE id = 2

/*consulta*/

SELECT * FROM public.productos
WHERE precio > 50

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/

SELECT * FROM public.pedidos
WHERE cantidad >= 5

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/

SELECT * FROM public.clientes
WHERE nombre ILIKE 'a%'


/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/

SELECT c.nombre, COUNT (p.producto)
FROM public.clientes c
LEFT JOIN public.pedidos p
ON  c.id = p.cliente_id
GROUP BY c.nombre


/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/

SELECT producto, COUNT (producto) FROM public.pedidos
GROUP BY producto



/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE public.pedidos
ADD COLUMN fecha DATE

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/

ALTER TABLE public.productos
DROP CONSTRAINT productos_pkey

ALTER TABLE public.productos
ADD CONSTRAINT productos_pkey
PRIMARY KEY (nombre)

ALTER TABLE public.pedidos
ADD CONSTRAINT fk_productos FOREIGN KEY (producto) REFERENCES public.productos (nombre)


/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
*/

SELECT 
c.nombre as nombre,
p.producto as producto,
p.cantidad as cantidad
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id = p.cliente_id
ORDER BY nombre ASC, producto ASC
