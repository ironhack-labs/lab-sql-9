-- Create a table rentals_may to store the data from rental table with information for the month of May.
SELECT * 
FROM sakila.rental;

CREATE TABLE if not exists rentals_may like sakila.rental;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may
SELECT * FROM sakila.rental
WHERE rental_date LIKE '%-05-%';

SELECT *
FROM rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE if not exists rentals_june like sakila.rental;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june
SELECT * FROM sakila.rental
WHERE rental_date LIKE '%-06-%';


-- Check the number of rentals for each customer for May.
SELECT customer_id, count(customer_id) as number_of_rentals
FROM rentals_may
GROUP BY customer_id;

-- Check the number of rentals for each customer for June.
SELECT customer_id, count(customer_id) as number_of_rentals
FROM rentals_june
GROUP BY customer_id;


-- Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
 
-- Check the number of rentals for each customer for May
-- Check the number of rentals for each customer for June 
-- Hint: You can store the results from the two queries in two separate dataframes.

-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.