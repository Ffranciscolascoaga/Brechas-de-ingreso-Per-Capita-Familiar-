
USE eph

SELECT * FROM eph_data;

-- numero de obersaciones en la EPH (personas) no expandido

SELECT COUNT(*) FROM eph_data;

-- respuesta: 97684

--  Edad Promedio 

SELECT AVG(edad) FROM eph_data;

-- respuesta: 36

-- Porcentaje de Mujeres y Hombres 

SELECT 
	COUNT(CASE WHEN sexo = 'Mujer' THEN 1 END)*100/COUNT(*) as porcentaje_mujeres,
	COUNT(CASE WHEN sexo = 'Hombre' THEN 1 END)*100/COUNT(*) AS porcentaje_hombres
FROM eph_data;


-- respuesta_ 52% de mujeres y 47% de hombres



-- porcentaje de hombres y mujeres para los diferentes grupos etarios
-- Para el total de Argentina

SELECT 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	 END AS Grupo_Etario,
		(COUNT(CASE WHEN sexo = 'Mujer' THEN 1 END)*100/COUNT(*)) as Porcentaje_Mujeres,
		(COUNT(CASE WHEN sexo  = 'Hombre' THEN 1 END)*100/COUNT(*)) AS Porcentaje_Hombres
FROM 
	eph_data
GROUP BY 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	END
ORDER BY 
	Grupo_Etario;


-- Para Capital Federal 

SELECT 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	 END AS Grupo_Etario,
		(COUNT(CASE WHEN sexo = 'Mujer' THEN 1 END)*100/COUNT(*)) as Porcentaje_Mujeres,
		(COUNT(CASE WHEN sexo  = 'Hombre' THEN 1 END)*100/COUNT(*)) AS Porcentaje_Hombres
FROM 
	eph_data
WHERE region = 'Gran Buenos Aires'
GROUP BY 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	END
ORDER BY 
	Grupo_Etario;

-- Para el NOA

SELECT 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	 END AS Grupo_Etario,
		(COUNT(CASE WHEN sexo = 'Mujer' THEN 1 END)*100/COUNT(*)) as Porcentaje_Mujeres,
		(COUNT(CASE WHEN sexo  = 'Hombre' THEN 1 END)*100/COUNT(*)) AS Porcentaje_Hombres
FROM 
	eph_data
WHERE region = 'Noroeste Argentino'
GROUP BY 
	CASE
		WHEN edad BETWEEN 0 AND 9 THEN '[O-9]'
		WHEN edad BETWEEN 10 AND 19 THEN '[1O-19]'
		WHEN edad BETWEEN 20 AND 29 THEN '[2O-29]'
		WHEN edad BETWEEN 30 AND 39 THEN '[3O-39]'
		WHEN edad BETWEEN 40 AND 49 THEN '[4O-49]'
		WHEN edad BETWEEN 50 AND 59 THEN '[5O-59]'
		WHEN edad BETWEEN 60 AND 69 THEN '[6O-69]'
		WHEN edad BETWEEN 70 AND 79 THEN '[7O-79]'
		WHEN edad BETWEEN 80 AND 89 THEN '[8O-89]'
		ELSE '[90 y mas]'
	END
ORDER BY 
	Grupo_Etario;


-- 3) Obtengo el ingreso per capita (ipcf) por grupo etario y por region
-- 4) tambien buscar si existen diferencias importantes en el ingreso per capita e/ dif aglomerados
-- 5) que areas tienen mejores condiciones de vida  (servicio de agua y cloacas) y cuales las peores condiciones?
-- 6) los hogares con mas miembros tienen mejores ingresos per capita? 
-- 7) el acceso a servicios basicos o la propiedad de la vivienda esta relacionado con el tama�o del hogar?


-- 4)

SELECT	
    aglomerado,
    AVG(CAST(ISNULL(ipcf, 0) AS decimal(18, 2))) AS ingreso_promedio_per_capita,
    COUNT(*) AS total_hogares
FROM 
    eph_data
GROUP BY 
    aglomerado
ORDER BY 
    ingreso_promedio_per_capita DESC;


-- 5) 

SELECT 
	aglomerado,
	SUM(CASE WHEN agua = 'Tiene' THEN 1 END)*100.0 / COUNT(*) AS Porcentaje_con_agua,
	SUM(CASE WHEN cloacas = 'Tiene' THEN 1 END)*100.0 / COUNT(*) AS Porcentaje_con_cloacas
FROM
	eph_data
GROUP BY 
	aglomerado
ORDER BY 
	Porcentaje_con_agua DESC, Porcentaje_con_cloacas DESC;

-- 6) 

SELECT 
	id,
	AVG(ipcf) AS ingreso_promedio_per_capita,
	COUNT(*) AS total_miembros_hogar
FROM 
	eph_data
GROUP BY 
	id
ORDER BY
	ingreso_promedio_per_capita DESC;


