/*Ejercicio 5
 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre 
(cadena de texto).*/

/* antes de comenzar, creqre una base de datos nueva, */
CREATE DATABASE Ejercicio5

-------
CREATE TABLE IF NOT EXISTS Clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
	)


 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".

INSERT INTO public.clientes (id, nombre)
VALUES (1, 'John')


 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".

UPDATE public.clientes
SET nombre = 'John Doe' WHERE id = 1


/*4. Elimina el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM public.clientes
WHERE id = 1


/* 5. Lee todos los clientes de la tabla "Clientes".*/
SELECT nombre FROM public.clientes


 /*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero)*/
CREATE TABLE IF NOT EXISTS Pedidos(
id INT PRIMARY KEY,
cliente_id INT)

 /*7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/

INSERT INTO public.pedidos (id, cliente_id)
VALUES (1, 1)

/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/

UPDATE public.pedidos
SET cliente_id = 2 WHERE id = 1


 /*9. Elimina el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM public.pedidos
WHERE id = 1

 /*10. Lee todos los pedidos de la tabla "Pedidos".*/

 SELECT cliente_id FROM public.pedidos


 /*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre 
(cadena de texto).*/

CREATE TABLE IF NOT EXISTS Productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
	)
 /*12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/

INSERT INTO public.productos (id, nombre)
VALUES (1, 'Camisa')

/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/

UPDATE public.productos
SET nombre = 'Pantalón' WHERE id = 1

/* 14. Elimina el producto con id=1 de la tabla "Productos".*/

DELETE FROM public.productos
WHERE id = 1
/* 15. Lee todos los productos de la tabla "Productos".*/

 SELECT nombre FROM public.productos

 /*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y 
producto_id (entero).*/

CREATE TABLE IF NOT EXISTS DetallesPedido(
pedido_id INT,
producto_id INT)

/*17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla 
"DetallesPedido".*/
INSERT INTO public.detallespedido (pedido_id, producto_id)
VALUES (1, 1)
 /*18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla 
"DetallesPedido".*/

UPDATE public.detallespedido
SET producto_id = 2 WHERE pedido_id = 1


 /*19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/

 DELETE FROM public.detallespedido
WHERE pedido_id = 1

 /*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/

 SELECT * FROM public.detallespedido


/* para poder completar los pasos siguentes, vamos a introducir datos en todas las tablas del ejercicio*/

INSERT INTO public.clientes (id, nombre)
VALUES (1, 'Jero'),
		(2, 'Pedro'), 
		(3, 'Joaquin'), 
		(4, 'Nuria'), 
		(5, 'Manolo')

/**/

INSERT INTO public.pedidos (id, cliente_id)
VALUES (1, 1),
		(2, 2), 
		(3, 3), 
		(4, 4), 
		(5, 5),
		(6, 2),
		(7, 1),
		(8, 1),
		(9, 3),
		(10, 4)

/**/
INSERT INTO public.productos (id, nombre)
VALUES (1, 'Camisa'),
		(2, 'Pantalón'), 
		(3, 'Corbata'), 
		(4, 'Zapatos'), 
		(5, 'Chaqueta')

/**/
INSERT INTO public.detallespedido (pedido_id, producto_id)
VALUES (1, 1),
		(2, 3), 
		(3, 2), 
		(4, 1), 
		(5, 3),
		(6, 5),
		(7, 2),
		(8, 4),
		(9, 1),
		(10, 5)

/*ahora vamos a relacionar las tablas con FKs*/

ALTER TABLE public.pedidos
ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.clientes (id)

/**/

ALTER TABLE public.detallespedido
ADD CONSTRAINT fk_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedidos (id)

/**/
ALTER TABLE public.detallespedido
ADD CONSTRAINT fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.productos (id)

/**/


 /*21. Realiza una consulta para obtener todos los clientes y sus pedidos 
correspondientes utilizando un inner join.*/

SELECT c.nombre as cliente, p.id as pedido
FROM public.clientes c
INNER JOIN public.pedidos p
ON p.cliente_id = c.id
ORDER BY c.nombre ASC



 /*22. Realiza una consulta para obtener todos los clientes y sus pedidos 
correspondientes utilizando un left join.*/

SELECT c.nombre as cliente, p.id as pedido
FROM public.clientes c
LEFT JOIN public.pedidos p
ON p.cliente_id = c.id
ORDER BY c.nombre ASC

/* 23. Realiza una consulta para obtener todos los productos y los detalles de pedido 
correspondientes utilizando un inner join.*/

SELECT r.nombre as Producto, d.pedido_id as pedido
FROM public.productos r
INNER JOIN public.detallespedido d
ON d.producto_id = r.id
ORDER BY r.nombre ASC

 /*24. Realiza una consulta para obtener todos los productos y los detalles de pedido 
correspondientes utilizando un left join.*/

SELECT r.nombre as Producto, d.pedido_id as pedido
FROM public.productos r
LEFT JOIN public.detallespedido d
ON d.producto_id = r.id
ORDER BY r.nombre ASC


	/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla 
	"Clientes".*/
ALTER TABLE public.clientes
ADD COLUMN teléfono VARCHAR (255)

/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de 
datos a entero.*/

ALTER TABLE public.clientes
ALTER COLUMN teléfono TYPE INT USING "teléfono"::integer

/* 27. Elimina la columna "telefono" de la tabla "Clientes".*/

ALTER TABLE public.clientes
DROP COLUMN teléfono

/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/

ALTER TABLE public.clientes
RENAME TO Usuarios

 /*29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a 
"nombre_completo".*/

ALTER TABLE public.usuarios
RENAME COLUMN nombre TO nombre_completo


 /*30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/

/*ya tiene una clave primaria, con lo cual no puedo creqr otra ni puedo borrar la que hay, ya que esta relacionada con otras
