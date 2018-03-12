Economies:
econ_id	code	year	income_group	gdp_percapita	gross_savings	inflation_rate	
1	AFG	2010	Low income	539.667	37.133	2.179	30.402	null	46.394	24.381
2	AFG	2015	Low income	615.091	21.466	-1.549	18.602	null	-49.11	-7.294

populations:
pop_id	country_code	year	fertility_rate	
20	ABW	2010	1.704	74.9535	101597
19	ABW	2015	1.647	75.5736	103889

country:
code	name	continent	region	surface_area	indep_year	local_name	gov_form	capital	cap_long	cap_lat
AFG	Afghanistan	Asia	Southern and Central Asia	652090	1919	Afganistan/Afqanestan	Islamic Emirate	Kabul	69.1761	34.5228
NLD	Netherlands	Europe	Western Europe	41526	1581	Nederland	Constitutional Monarchy	Amsterdam	4.89095	52.3738

*****************************************************************************
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code;

result:
code	name		region						year	fertility_rate	unemployment_rate

AFG		Afghanistan	Southern and Central Asia	2010	4.653			null
AFG		Afghanistan	Southern and Central Asia	2010	5.746			null

******************************************************************************

SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code AND e.year = p.year;

******************************************************************************

SELECT c.name AS country, continent, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
USING (code);

result:
country		continent	language	official
Afghanistan	Asia		Dari		true
Afghanistan	Asia		Pashto		true

*****************************************************************************

SELECT p1.country_code,
       p1.size AS size2010,
       p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
    AND p1.year = p2.year - 5;


result:
country_code	size2010	size2015
ABW				101597		103889
AFG				27962200	32526600
AGO				21220000	25022000
ALB				2913020		2889170

*****************************************************************************

SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
    AND p1.year = p2.year - 5;

result:
country_code	size2010	size2015	growth_perc
ABW				101597		103889		2.25597210228443
AFG				27962200	32526600	16.32329672575
AGO				21220000	25022000	17.9171919822693

*****************************************************************************

-- get name, continent, code, and surface area
select name, continent, code, surface_area,
    -- first case
    case when surface_area > 2000000
    -- first then
            then 'large'
    -- second case
       when surface_area > 350000
    -- second then
            then 'medium'
    -- else clause + end
        else 'small' end
    -- alias resulting field of CASE WHEN
       as geosize_group
-- from the countries table
from countries;

result:
name		continent	code	surface_area	geosize_group
Afghanistan	Asia		AFG		652090			medium
Netherlands	Europe		NLD		41526			small
Albania		Europe		ALB		28748			small

******************************************************************************

Use INTO to save the result of the previous query as pop_plus

SELECT country_code, size,
  -- start CASE here with WHEN and THEN
  CASE WHEN size > 50000000
            THEN 'large'
  -- layout other CASE conditions here            
       WHEN size > 1000000
            THEN 'medium'
  -- end CASE here with ELSE & END
       ELSE 'small' END
  -- provide the alias of popsize_group to SELECT the new field       
       AS popsize_group
-- which table? 
INTO pop_plus
FROM populations
-- any conditions to check?
WHERE year = 2015;
select * from pop_plus;

******************************************************************************

SELECT country_code, size,
  -- start CASE here with WHEN and THEN
  CASE WHEN size > 50000000
            THEN 'large'
  -- layout other CASE conditions here            
       WHEN size > 1000000
            THEN 'medium'
  -- end CASE here with ELSE & END
       ELSE 'small' END
  -- provide the alias of popsize_group to SELECT the new field       
       AS popsize_group
-- which table? 
INTO pop_plus
FROM populations
-- any conditions to check?
WHERE year = 2015;

SELECT name , continent , geosize_group , popsize_group
FROM countries_plus  AS c
INNER JOIN pop_plus AS p
ON c.code = p.country_code
ORDER BY geosize_group;

result:
name			continent		geosize_group	popsize_group
India			Asia			large			large
United States	North America	large			large
Saudi Arabia	Asia			large			medium
China			Asia			large			large
Kazakhstan		Asia			large			medium
Sudan			Africa			large			medium
Argentina		South America	large			medium
Algeria			Africa			large			medium

Congo,TheDemocraticRepublic of theAfrica	large	large

Canada			North America	large			medium
Australia		Oceania			large			medium
Brazil			South America	large			large
Russian Federation	Europe		large			large
Greenland		North America	large			small
Iran			Asia			medium			large