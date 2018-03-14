#Get the number of decades the films table covers. Alias the result as number_of_decades. The top half of your fraction should be enclosed in parentheses.

SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;

******************************************************************************************
-- get the count(deathdate) and multiply by 100.0
-- then divide by count(*) 
--Get the percentage of people who are no longer alive. Alias the result as percentage_dead. Remember to use 100.0 and not 100!
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

*****************************************************************************************
--Get all details for all films except those released in 2015 and order them by duration.
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration;

*****************************************************************************************
--Get the IMDB score and film ID for every film from the reviews table, sorted from highest to lowest score.

select imdb_score, film_id from reviews order by imdb_score desc;

--Get the birth date and name of people in the people table, in order of when they were born and alphabetically by name.

SELECT birthdate, name
FROM people
ORDER BY birthdate, name;

****************************************************************************************

SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;

might return something like
sex 	count
female 	19
male 	15

****************************************************************************************
select release_year, avg(budget) as avg_budget, avg(gross)as avg_gross
from films 
where release_year > 1990
group by release_year
having avg(budget) > 60000000
order by avg(gross) desc;
****************************************************************************************

-- select country, average budget, average gross
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
-- from the films table
FROM films
-- group by country 
GROUP BY country
-- where the country has a title count greater than 10
HAVING COUNT(title) > 10
-- order by country
ORDER BY country
-- limit to only show 5 results
LIMIT 5;

****************************************************************************************
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
****************************************************************************************
