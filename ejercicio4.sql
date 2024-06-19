/*Ejercicio 4
 Nivel de dificultad: Experto*/

/* antes de comenzar, creqre una base de datos nueva, y una tabla de Usuarios con unsuarios dentro
y una de Productos con productos dentro */
CREATE DATABASE Ejercicio4

--
CREATE TABLE IF NOT EXISTS Usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
	)
----
INSERT INTO public.usuarios (id, nombre)
VALUES (1, 'Jero'),
		(2, 'Pedro'), 
		(3, 'Joaquin'), 
		(4, 'Nuria'), 
		(5, 'Manolo')

---
CREATE TABLE IF NOT EXISTS Productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio DEC
	)
------

INSERT INTO public.productos (id, nombre, precio)
VALUES (1,'Camiseta', 10.20), (2,'Pantalon', 20.80),(3, 'Calcetines', 5.20),(4, 'Gorra', 15.25),(5, 'Zapatos', 26.30)



/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave 
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y 
"id_producto" (entero, clave foránea de la tabla "Productos")*/

CREATE TABLE IF NOT EXISTS Pedidos(
	id INT PRIMARY KEY,
	id_usuario INT,
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios (id),
	id_producto INT,
	CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES public.productos (id)
	)


 /*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con 
productos.*/

INSERT INTO public.pedidos (id, id_usuario, id_producto)
VALUES (1, 1, 1), (2, 1, 3), (3, 2, 4), (4, 3, 4), (5, 3, 5), (6, 5, 2)

 /*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de 
los productos que han comprado, incluidos aquellos que no han realizado 
ningún pedido (utiliza LEFT JOIN y COALESCE).*/


SELECT u.nombre as nombre, COALESCE (p.nombre, 'Sin Pedidos') as producto
FROM public.usuarios u
LEFT JOIN public.pedidos o ON u.id = o.id_usuario 
LEFT JOIN public.productos p ON p.id = o.id_producto 

 /*4. Realiza una consulta que muestre los nombres de los usuarios que han 
realizado un pedido, pero también los que no han realizado ningún pedido 
(utiliza LEFT JOIN).*/

SELECT u.nombre as nombre, p.nombre as producto
FROM public.usuarios u
LEFT JOIN public.pedidos o ON u.id = o.id_usuario 
LEFT JOIN public.productos p ON p.id = o.id_producto 

 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza 
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)

ALTER TABLE public.pedidos
ADD COLUMN Cantidad INT
---

UPDATE public.pedidos
SET cantidad = CASE
	WHEN id = 1 THEN 3
	WHEN id = 2 THEN 2
	WHEN id = 3 THEN 5
	WHEN id = 4 THEN 1
	WHEN id = 5 THEN 7
	WHEN id = 6 THEN 8
END
WHERE id IN (1, 2, 3, 4, 5, 6)