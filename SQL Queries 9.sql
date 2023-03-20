USE sakila;

-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE if not exists rentals_may LIKE rental;

-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may
SELECT
	*
FROM rental
WHERE date_format(rental_date,'%M') = 'May';

SELECT
	*
FROM rentals_may;

-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE if not exists rentals_june LIKE rental;

-- 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june
SELECT
	*
FROM rental
WHERE date_format(rental_date,'%M') = 'June';

SELECT
	*
FROM rentals_june;

-- 5. Check the number of rentals for each customer for May.
SELECT
	customer_id,
    count(customer_id) as num_rentals
FROM rentals_may
GROUP BY customer_id
ORDER BY 2 DESC;

-- 6. Check the number of rentals for each customer for June.
SELECT
	customer_id,
    count(customer_id) as num_rentals
FROM rentals_june
GROUP BY customer_id
ORDER BY 2 DESC;
