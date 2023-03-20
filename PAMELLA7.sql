use sakila;

-- Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may AS
SELECT * FROM rental 
WHERE MONTH(rental_date) = 5;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may 
SELECT * FROM rental 
WHERE MONTH(rental_date) = 5;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june AS 
SELECT * FROM rental 
WHERE MONTH(rental_date) = 6;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june 
SELECT * FROM rental 
WHERE MONTH(rental_date) = 6;

-- Check the number of rentals for each customer for May.
SELECT customer_id, COUNT(*) as num_rentals_may 
FROM rentals_may 
GROUP BY customer_id;

-- Check the number of rentals for each customer for June.
SELECT customer_id, COUNT(*) as num_rentals_june 
FROM rentals_june 
GROUP BY customer_id;

-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.