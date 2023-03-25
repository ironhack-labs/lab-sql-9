-- Create a table rentals_may to store the data from rental table with information for the month of May.
-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
Create table if not exists rentals_may like rental;

INSERT INTO rentals_may
SELECT * FROM rental
WHERE rental_date like '%-05-%';

select * from sakila.rentals_may;

-- Check the number of rentals for each customer for May.
select 
	customer_id,
    count(rental_id) as num_films
from sakila.rentals_may
group by customer_id;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

Create table if not exists rentals_june like rental;

INSERT INTO rentals_june
SELECT * FROM rental
WHERE rental_date like '%-06-%';


-- Check the number of rentals for each customer for June.
select 
	customer_id,
    count(rental_id) as num_films
from sakila.rentals_june
group by customer_id;

