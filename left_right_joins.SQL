-- select name, region, and gdp_percapita
select region, avg(gdp_percapita) as avg_gdp
-- countries (alias c) on the left
from countries AS c
-- join with economies (alias e)
left JOIN economies AS e
-- match on code fields
ON c.code = e.code
-- focus on 2010 entries
where year = 2010
group by region
order by avg_gdp;

result:
region	avg_gdp
Southern Africa	5051.59797363281
Australia and New Zealand	44792.384765625
Southeast Asia	10547.1541320801
Southern Europe	22926.4109108665
Northern Africa	4713.86169433594
Nordic Countries	57073.99765625
Central Africa	4797.23992919922
Micronesia	4497.65197753906
Polynesia	3451.36336263021

****************************************************************************************

SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
RIGHT JOIN countries
ON languages.code = countries.code
RIGHT JOIN cities
ON cities.country_code = countries.code
ORDER BY city, language;


result:
city	urbanarea_pop	country					indep_year	language	percent
Abidjan		4765000		Cote d'Ivoire			1960		French		null
Abidjan		4765000		Cote d'Ivoire			1960		Other		null
Abu Dhabi	1145000		United Arab Emirates	1971		Arabic		null
Abu Dhabi	1145000		United Arab Emirates	1971		English		null
Abu Dhabi	1145000		United Arab Emirates	1971		Hindi		null
Abu Dhabi	1145000		United Arab Emirates	1971		Persian		null

*****************************************************************************************

