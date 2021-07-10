-- 1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
select countries.name, languages.language, languages.percentage
from countries
join languages on countries.id = languages.country_id
where languages.language like 'Slovene'
order by languages.percentage desc;

-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
SELECT countries.name, COUNT(cities.id) as total
FROM countries
join cities on countries.id = cities.country_id
GROUP BY countries.name
ORDER BY COUNT(cities.id) DESC;

-- 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? Tu consulta debe organizar el resultado por población en orden descendente. (1)
select countries.name as country, cities.name as city, cities.population
from countries
join cities on countries.id = cities.country_id
where countries.name like 'Mex%' and cities.population >= 500000
order by cities.population desc;

-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
select countries.name as country, languages.language, languages.percentage
from countries
join languages on countries.id = languages.country_id
where languages.percentage >= 89
order by languages.percentage desc;

-- 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
select countries.name, countries.surface_area, countries.population
from countries
where countries.population >= 100000 and countries.surface_area <= 501;

-- 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
select countries.name as country, countries.government_form, countries.capital, countries.life_expectancy
from countries
where countries.government_form = 'Constitutional Monarchy' and countries.capital >= 200 and countries.life_expectancy >= 75;

-- 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
select countries.name as country, cities.name, cities.district, cities.population
from countries
join cities on countries.id = cities.country_id
where cities.district = 'Buenos Aires' and cities.population >= 500000;

-- 8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
SELECT countries.region, COUNT(countries.id) as total
FROM countries
GROUP BY countries.region
ORDER BY COUNT(countries.id) DESC;
