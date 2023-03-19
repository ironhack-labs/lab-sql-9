CREATE TABLE if not exists rentals_may like sakila.rental;

INSERT INTO rentals_may
SELECT *
FROM sakila.rental
WHERE MONTH(rental_date) = 5;

CREATE TABLE if not exists rentals_june like sakila.rental;

INSERT INTO rentals_june
SELECT *
FROM sakila.rental
WHERE MONTH(rental_date) = 6;

SELECT
     customer_id,
     COUNT(*) as num_rentals
FROM sakila.rentals_may
GROUP BY customer_id;

SELECT
	customer_id,
	COUNT(*)
FROM sakila.rentals_june
GROUP BY customer_id;




