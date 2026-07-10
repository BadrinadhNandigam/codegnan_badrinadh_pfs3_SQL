-- DDL

-- create database MovieDB;
-- use MovieDB;

-- 1. Create command

-- CREATE TABLE Movies(
--    movie_id INT PRIMARY KEY,
--    movie_name VARCHAR(50),
--    genre VARCHAR(30),
--    language VARCHAR(20),
--    release_year INT,
--    rating DECIMAL(2,1),
--    collection DECIMAL(10,2)
-- );

-- DESC Movies;

-- INSERT INTO Movies VALUES
-- (101,'RRR','Action','Telugu',2022,9.2,1200.50),
-- (102,'Pushpa','Action','Telugu',2021,8.8,365.00),
-- (103,'Baahubali','Action','Telugu',2015,9.5,1800.00),
-- (104,'KGF','Action','Kannada',2018,9.1,950.00),
-- (105,'Jawan','Action','Hindi',2023,8.5,1100.00),
-- (106,'Leo','Action','Tamil',2023,8.4,620.00),
-- (107,'3 Idiots','Comedy','Hindi',2009,9.3,450.00),
-- (108,'Interstellar','Sci-Fi','English',2014,9.6,700.00),
-- (109,'Avengers Endgame','Superhero','English',2019,9.4,2800.00),
-- (110,'Inception','Sci-Fi','English',2010,9.5,850.00);

-- select * from Movies;
-- alter (to add new column/modify the table)

-- alter table Movies
-- add director varchar(70);
-- desc Movies;

-- update 
-- UPDATE Movies
-- SET director='S. S. Rajamouli'
-- WHERE movie_id IN (101,103);

-- UPDATE Movies
-- SET director='Sukumar'
-- WHERE movie_id=102;

-- UPDATE Movies
-- SET director='Prashanth Neel'
-- WHERE movie_id=104;

-- UPDATE Movies
-- SET director='Atlee'
-- WHERE movie_id=105;

-- UPDATE Movies
-- SET director='Lokesh Kanagaraj'
-- WHERE movie_id=106;

-- UPDATE Movies
-- SET director='Rajkumar Hirani'
-- WHERE movie_id=107;

-- UPDATE Movies
-- SET director='Christopher Nolan'
-- WHERE movie_id IN (108,110);

-- UPDATE Movies
-- SET director='Anthony Russo'
-- WHERE movie_id=109;

-- select * from Movies;

-- rename

-- alter table movies rename column collection to box_office;

-- alter table movies add Hero varchar(80);

-- ALTER TABLE MOVIES DROP HERO;
-- RENAME TABLE MOVIES TO CINEMA;
-- RENAME TABLE CINEMA TO MOVIES;

-- 2. DML
-- 2.1 - INSERT command
-- INSERT INTO Movies VALUES(111,'Salaar','Action','Telugu',2023,8.7,715.00,'Prashanth Neel');

-- 2.2 - UPDATE Command

-- update movies set rating = 9.0 where movie_name = 'Salaar';
-- SET SQL_SAFE_UPDATES = 0;

-- 2.3 - DELETE Command
-- delete from movies where movie_id = 111;

-- 3. DQL 
-- 3.1 - Select command

-- select * from movies;

-- released after 2020
-- SELECT * FROM Movies WHERE release_year>2020;

-- movies above 9 rating
-- select * from movies where rating >= 9.5;

-- movies in telugu or hindi
-- select * from movies where language in ('TELUGU','HINDI');

-- MOVIES NOT IN ENGLISH
-- SELECT * FROM MOVIES WHERE LANGUAGE NOT IN ('ENGLISH');

-- TCL 
-- 4.1 COMMIT - save all transaction to the database
-- COMMIT;
-- SET autocommit=0;
-- UPDATE Movies
-- SET box_office=box_office+50
-- WHERE movie_id=101;

-- 4.2 - savepoint - It is used to roll the transaction bacs to a certain point without rolling bacs the entire transaction.
-- SAVEPOINT sp1;

-- UPDATE Movies
-- SET rating=9.8
-- WHERE movie_id=108;

-- 4.3 - Rollback - Rollbacs command is used to undo transactions that have not already been saved to the database.

-- ROLLBACK TO sp1;
-- ROLLBACK ENTIRE TRANSACTION
-- ROLLBACK;

-- 5. DCL 
-- Create user
-- create user 'movieuser'@'localhost' identified by 'movie123';

-- 5.1 - Grant - It is used to give user access privileges to a database.
-- GRANT SELECT,INSERT,UPDATE ON MovieDB. * TO 'movieuser'@'localhost';
-- SHOW GRANTS FOR 'movieuser'@'localhost';

-- 5.2 - Revoke - It is used to tase bacs permissions from the user.

-- revoke update on moviedb. * from 'movieuser'@'localhost';
-- DROP USER 'movieuser'@'localhost';

-- QUERIES

-- 1. Display all movies with a rating greater than 9.
SELECT *
FROM Movies
WHERE rating > 9;

-- 2. Display movies released between 2015 and 2023.

SELECT *
FROM Movies
WHERE release_year BETWEEN 2015 AND 2023;

-- 3. Display all Telugu and English movies.

SELECT *
FROM Movies
WHERE language IN ('Telugu','English');

-- 4. Display movies except Hindi movies.

SELECT *
FROM Movies
WHERE language <> 'Hindi';

-- 5. Display movies whose names start with 'B'.
select * from movies where movie_name like 'B%';

-- 6. Display movies whose names end with 'a'.
select * from movies where movie_name like '%A';

-- 7. Display movies containing 'er'.
select * from movies where movie_name like '%er%';

-- 8. Display movies where the second letter is 'a'.
select * from movies where movie_name like '_a%';

-- 9. Display the top 5 highest-rated movies.
select * from movies 
order by rating desc
limit 5;

-- 10. Display the 3 movies with the highest box office collection.
select * from movies
order by box_office desc
limit 3;

-- 11. Find the highest movie rating.
select max(rating) as highest_rating
from movies;

-- 12. Find the average box office collection.
select avg(box_office) as collection
from movies;

-- 13. Count the total number of movies.
select count(*) as total_count
from movies;

-- find minium rating
select min(rating) as lowest_rating_movie
from movies;

-- 14. Display the number of movies in each language.

SELECT language,
COUNT(*) AS total_movies
FROM Movies
GROUP BY language;

-- 15. Display the average rating for each language
select language, avg(rating) as avg_rating
from movies
group by language;

-- 16. Display the total box office collection for each language.

select language, sum(box_office) as total_box_office_collection
from movies
group by language;

-- 17. Display languages having more than 2 movies.

select language, count(*) as total_movies
from movies
group by language
having count(*) > 2;

-- 18. Display genres whose average rating is greater than 9.

select genre, avg(rating) as greater_than_nine
from movies
group by genre
having avg(rating) > 9;

-- 19. Display directors who directed more than one movie.
select director, count(*) as more_than
from movies
group by director
having count(*)>1;

-- 20. Display languages where the total box office collection is greater than 1500.

select language, sum(box_office) as total_collection
from movies
group by language
having sum(box_office) > 1500;

-- 21. Increase the rating by 0.2 for all English movies.
UPDATE Movies
SET rating = rating + 0.2
WHERE language = 'English'
AND rating < 9.8;

-- 22. Increase the box office collection by 100 for Action movies.

update movies
set box_office = box_office + 100 
where genre = 'Action';

-- 23. Delete all movies released before 2012.

DELETE FROM Movies
WHERE release_year < 2012;

-- 24. Delete movies whose rating is less than 8.5.

DELETE FROM Movies
WHERE rating < 8.5;

-- 25. Display all movies sorted by: Language (Ascending) Rating (Descending)

select * from movies order by language asc, rating desc;

-- 26. Display genres having at least 2 movies and an average rating greater than 8.8.

select genre, count(*) as total_movies, avg(rating) as av_rating
from movies
group by genre
having count(*) >= 2 and avg(rating) > 8.8;

-- 27. Display languages where the minimum rating is greater than 8.5.

select language, min(rating) as minimum_rating
from movies
group by language
having min(rating) > 8.5;

-- 28. Display directors whose total box office collection is greater than 1000.
select director, sum(box_office) as collection
from movies
group by director
having sum(box_office) > 1000;

-- 29. Display the highest-rated movie from the table.

select * from movies
order by rating desc
limit 1;

-- 30. Display movies released after 2015, with a rating greater than 9, sorted by box office collection in descending order.

select * from movies
where release_year > 2015 and rating > 9
order by box_office desc;



