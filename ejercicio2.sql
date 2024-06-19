/* Ejercicio 2
 Nivel de dificultad: Fácil
 1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos


 /*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "edad" (entero).*/

CREATE TABLE IF NOT EXISTS Usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT)

 /*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios (id, nombre, edad)
VALUES (1, 'Jeronimo', 44), (2, 'Teresa', 45)

 /*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/

UPDATE public.usuarios 
SET edad = 35
WHERE id = 2

/*5. Elimina un usuario de la tabla "Usuarios".**/

DELETE FROM public.usuarios 
WHERE id = 1

 /*Nivel de dificultad: Moderado
 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE IF NOT EXISTS Ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255))

 /*2. Inserta al menos tres registros en la tabla "Ciudades".*/

INSERT INTO public.ciudades (id, nombre, pais)
VALUES (1, 'Sevilla', 'España'), (2, 'Cadiz', 'España'), (3, 'Londres', 'Inglaterra')

 /*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" 
de la tabla "Ciudades".*/

ALTER TABLE public.usuarios
ADD CONSTRAINT fk_usuario_id FOREIGN KEY (id) REFERENCES public.ciudades (id)


 /*4. Realiza una consulta que muestre los nombres de los usuarios junto con el 
nombre de su ciudad y país (utiliza un LEFT JOIN).*/

SELECT u.nombre as nombre, 
c.nombre as ciudad,
c.pais as pais FROM public.ciudades c
LEFT JOIN public.usuarios u 
ON u.id = c.id

 /*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad 
asociada (utiliza un INNER JOIN).*/

SELECT u.nombre as nombre, 
c.nombre as ciudad,
c.pais as pais FROM public.ciudades c
INNER JOIN public.usuarios u 
ON u.id = c.id