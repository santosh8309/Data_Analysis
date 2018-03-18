SELECT name AS country, code, region, basic_unit
FROM countries
FULL JOIN currencies
USING (code)
WHERE region = 'North America' OR region IS NULL
ORDER BY region;

result:
country	code	region	basic_unit
Canada	CAN	North America	Canadian dollar
United States	USA	North America	United States dollar
Bermuda	BMU	North America	Bermudian dollar
Greenland	GRL	North America	null

/****************************************************************************/

SELECT countries.name, code, languages.name AS language
FROM languages
full JOIN countries
USING (code)
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;

result:
name	code	language
Vanuatu	VUT	Tribal Languages
Vanuatu	VUT	English
Vanuatu	VUT	French
Vanuatu	VUT	Other
Vanuatu	VUT	Bislama

/*****************************************************************************/

SELECT c1.name AS country, region, l.name AS language,
       basic_unit, frac_unit
FROM countries AS c1
FULL JOIN languages AS l
USING (code)
FULL JOIN currencies AS c2
USING (code)
WHERE region LIKE 'M%esia';

result:
country	region	language	basic_unit	frac_unit
Kiribati	Micronesia	English	Australian dollar	Cent
Kiribati	Micronesia	Kiribati	Australian dollar	Cent
Marshall Islands	Micronesia	Other	United States dollar	Cent
Marshall Islands	Micronesia	Marshallese	United States dollar	Cent
Nauru	Micronesia	Other	Australian dollar	Cent
Nauru	Micronesia	English	Australian dollar	Cent
Nauru	Micronesia	Nauruan	Australian dollar	Cent

/*******************************************************************************/


