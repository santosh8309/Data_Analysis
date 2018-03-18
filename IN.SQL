SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
AND duration > 120;