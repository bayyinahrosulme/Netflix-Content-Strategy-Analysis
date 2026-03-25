DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix (
    show_id VARCHAR(20),
    type VARCHAR(20),
    title VARCHAR(500),
    director TEXT,
    "cast" TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    genre VARCHAR(200)
);


COPY netflix
FROM 'C:/AnalystProjects/netflix_cleaned.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';


COPY netflix
FROM 'C:/AnalystProjects/netflix_cleaned.csv'
DELIMITER ','
CSV HEADER
ENCODING 'LATIN1';



COPY netflix
FROM 'C:/AnalystProjects/netflix_cleaned.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM netflix LIMIT 10


SELECT COUNT(*) FROM netflix;


SELECT COUNT(*) FROM netflix;


SELECT * FROM netflix LIMIT 10;



CREATE TABLE netflix_staging AS
SELECT * FROM netflix;


SELECT COUNT(*) FROM netflix_staging;

---content added per year trends-----
SELECT release_year, COUNT(title) 
FROM netflix_staging
GROUP BY release_year
ORDER BY release_year DESC


----Top directors by title count---
SELECT director, COUNT(title)
FROM netflix_staging
WHERE director IS NOT NULL
GROUP BY director
ORDER BY COUNT(title) DESC
LIMIT 10

------TV vs Movie ratio shifts over time-----
SELECT release_year, type, COUNT(type)
FROM netflix_staging
GROUP BY release_year, type
ORDER BY COUNT(type) DESC


----- Average movie duration by decade-----
SELECT (release_year / 10) * 10, AVG(CAST(REPLACE(duration, ' min', '') AS INT))
FROM netflix_staging
WHERE type= 'Movie'
GROUP BY (release_year / 10) * 10
ORDER BY AVG(CAST(REPLACE(duration, ' min', '') AS INT)) DESC


------Which countries produce the most content----
SELECT country, COUNT(title)
FROM netflix_staging
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(title) DESC
LIMIT 10








































