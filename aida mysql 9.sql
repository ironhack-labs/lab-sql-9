-- 1 Create a table rentals_may to store the data from rental table with information for the month of May.
-- 2 Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
-- 3 Create a table rentals_june to store the data from rental table with information for the month of June.
-- 4 Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
-- 5 Check the number of rentals for each customer for May.
-- 6 Check the number of rentals for each customer for June.

-- 7 Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
-- 8 Check the number of rentals for each customer for May
-- 9 Check the number of rentals for each customer for June

-- Hint: You can store the results from the two queries in two separate dataframes.
-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
-- Hint: For this part, you can create a join between the two dataframes created before, using the  
   -- merge function available for pandas dataframes. Here is a link to the documentation for the merge function.
   
use sakila;   

CREATE TABLE rentals_may SELECT * FROM rental WHERE MONTH(rental_date) = 5;
INSERT INTO rentals_may SELECT * FROM rental WHERE MONTH(rental_date) = 5;

CREATE TABLE rentals_june SELECT * FROM rental WHERE MONTH(rental_date) = 6;
INSERT INTO rentals_june SELECT * FROM rental WHERE MONTH(rental_date) = 6;

SELECT customer_id, COUNT(*) AS rental_count_may FROM rental WHERE MONTH(rental_date) = 5 GROUP BY customer_id;
SELECT customer_id, COUNT(*) AS rental_count_june FROM rental WHERE MONTH(rental_date) = 6 GROUP BY customer_id;

SELECT @@hostname;
SELECT USER();













