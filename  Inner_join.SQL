SELECT cities.name AS city, countries.name AS country, region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

*************************************************************************
--

    Select
        *country code,
        *name of the country,
        *year,and
        *inflation rate

    --as the fields from an inner join of countries on the left with economies on the right. (What field do you need to use in ON to match the two tables?)

    --Alias countries AS c and economies AS e.

    --Alias c.code AS country_code. Don't alias the other fields. 


SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
INNER JOIN economies AS e
ON c.code = e.code;

************************************************************************

