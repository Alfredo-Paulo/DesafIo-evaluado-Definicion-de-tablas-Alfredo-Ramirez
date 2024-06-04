/*Descripción
Se requiere crear un sitio web dedicado al mundo cinematográfico donde los usuarios
puedan buscar detalles del top 100 de películas más populares. El plus más importante de
este sitio web debe ser la variedad de filtros que ofrece para una búsqueda más efectiva.
Para este desafío necesitarás crear 2 tablas llamadas películas y reparto, sus datos los
consigues en los ficheros de extensión csv ubicados en el Apoyo Desafío.
*/
-- 1 Crear una base de datos llamada películas.

CREATE DATABASE peliculas;
\c peliculas; 

-- dll DBeaver
-- 2 Cargar ambos archivos a su tabla correspondiente.

-- public.peliculas definition

-- Drop table

-- DROP TABLE public.peliculas;

CREATE TABLE public.peliculas (
	id int4 NULL,
	pelicula varchar(64) NULL,
	"Año estreno" int4 NULL,
	director varchar(50) NULL
);
select * from peliculas;
select * from reparto;  

-- 3 Obtener el ID de la película “Titanic”
SELECT id FROM peliculas WHERE "pelicula" = 'Titanic';

/* id
----
  2
(1 fila) */

-- 4 Listar a todos los actores que aparecen en la película "Titanic".

SELECT r.actor
FROM peliculas p
JOIN reparto r ON p.id = r.id_pelicula
WHERE p."pelicula" = 'Titanic';

-- 5 Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*) AS num_peliculas
FROM reparto
WHERE actor = 'Harrison Ford';

-- 6 Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.

SELECT "pelicula"
FROM peliculas
WHERE "A±o estreno" BETWEEN 1990 AND 1999  -- WHERE "Año estreno" BETWEEN 1990 AND 1999  DBeaver
ORDER BY "pelicula" ASC;

-- 7 Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”. 
SELECT "pelicula", LENGTH("pelicula") AS longitud_titulo
FROM peliculas;

-- 8 Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX(LENGTH("pelicula")) AS longitud_maxima
FROM peliculas;
