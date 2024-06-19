/* Ejercicio 3
 Nivel de dificultad: Difícil*/

 /* antes de comenzar, creqre una base de datos nueva, y una tabla de Clientes  y una de pedidos referenciados a cada cliente de cada cliente
 */
CREATE DATABASE Ejercicio3

CREATE TABLE IF NOT EXISTS Clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
	)

INSERT INTO public.Clientes (id, nombre)
VALUES (1, 'Jero'),
		(2, 'Pedro'), 
		(3, 'Joaquin'), 
		(4, 'Nuria'), 
		(5, 'Manolo')

CREATE TABLE IF NOT EXISTS Pedidos(
	id INT PRIMARY KEY,
	cliente_id INT,
	producto VARCHAR(255),
	cantidad int,
	FOREIGN KEY (cliente_id) REFERENCES public.Clientes (id))

/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS Productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio DEC
	)*/


 /*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos (id, nombre, precio)
VALUES (1,'Camiseta', 10.20), (2,'Pantalon', 20.80),(3, 'Calcetines', 5.20),(4, 'Gorra', 15.25),(5, 'Zapatos', 26.30)

 /*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio = 18.20
WHERE id = 2

/* 4. Elimina un producto de la tabla "Productos".*/

 DELETE FROM public.productos
WHERE id = 4

 /*5. Realiza una consulta que muestre los nombres de los usuarios junto con los 
nombres de los productos que han comprado (utiliza un INNER JOIN con la 
tabla "Productos")*/
/*PRIMERO VOY A INSERTAR PEDIDOS DE CLIENTES*/

INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 5), 
		(2, 2, 'Pantalon', 4),
		(3, 2, 'Camiseta', 1),
		(4, 3, 'Zapatos', 3),
		(5, 4, 'Pantalon', 2),
		(6, 5, 'Camiseta', 7),
		(8, 1, 'Pantalon', 24),
		(9, 1, 'Camiseta', 2),
		(10, 4, 'Calcetines', 9),
		(12, 3, 'Calcetines', 6)

/*PONEMOS UNA NUEVA FK PARA RELACIONAR PRODUCTOS CON PEDIDOS*/
ALTER TABLE public.productos
DROP CONSTRAINT productos_pkey
----
ALTER TABLE public.productos
ADD CONSTRAINT productos_pkey
PRIMARY KEY (nombre)
-----
ALTER TABLE public.pedidos
ADD CONSTRAINT fk_productos FOREIGN KEY (producto) REFERENCES public.productos (nombre)

/*consulta*/

SELECT 
c.nombre as nombre,
p.producto as producto
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id = p.cliente_id
GROUP BY c.nombre, p.producto
ORDER BY c.nombre ASC