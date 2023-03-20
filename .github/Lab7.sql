use sakila;

-- Create a table rentals_may to store the data from rental table with information for the month of May.
create table sakila.rentals_may like sakila.rental;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO sakila.rentals_may 
SELECT * FROM sakila.rental
WHERE MONTH(rental_date) = 5;
select * from sakila.rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
create table sakila.rentals_june like sakila.rental;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO sakila.rentals_june 
SELECT * FROM sakila.rental
WHERE MONTH(rental_date) = 6;
select * from sakila.rentals_june;

-- Check the number of rentals for each customer for May.
SELECT customer_id, COUNT(rental_id) AS number_rentals
FROM sakila.rentals_may
GROUP BY customer_id
ORDER BY customer_id;

-- Check the number of rentals for each customer for June.
SELECT customer_id, COUNT(rental_id) AS number_rentals
FROM sakila.rentals_june
GROUP BY customer_id
ORDER BY customer_id;

-- Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

-- Check the number of rentals for each customer for May

-- Check the number of rentals for each customer for June
-- Hint: You can store the results from the two queries in two separate dataframes.
-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.