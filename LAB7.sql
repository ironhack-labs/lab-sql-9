-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
Use sakila;
CREATE TABLE if not exists rentals_may like sakila.rental;
-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

INSERT INTO rentals_may
SELECT *
FROM sakila.rental
WHERE month(rental_date)=5;

SELECT *
FROM sakila.rentals_may;



-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE if not exists rentals_june like sakila.rental;

-- 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june
SELECT *
FROM sakila.rental
WHERE month(rental_date)=6;

SELECT *
FROM sakila.rentals_june;
-- 5. Check the number of rentals for each customer for May.
SELECT
	c.first_name,
    c.last_name,
	c.customer_id,
	count(rental_id) as num_of_rentals
FROM sakila.rentals_may r
JOIN sakila.customer c ON c.customer_id = r.customer_id
GROUP BY r.customer_id
order by num_of_rentals desc
;


-- 6.Check the number of rentals for each customer for June.
SELECT
	c.first_name,
    c.last_name,
	c.customer_id,
	count(rental_id) as num_of_rentals
FROM sakila.rentals_june r
JOIN sakila.customer c ON c.customer_id = r.customer_id
GROUP BY r.customer_id
order by num_of_rentals desc
;



-- 7. Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

-- 7.1 Check the number of rentals for each customer for May

-- 7.2 Check the number of rentals for each customer for June

-- Hint: You can store the results from the two queries in two separate dataframes.

-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.

-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.