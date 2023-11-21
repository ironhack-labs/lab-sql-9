-- Create a table `rentals_may` to store the data from rental table with information for the month of May.
-- Insert values in the table `rentals_may` using the table rental, filtering values only for the month of May.

-- Create a table `rentals_may` to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may AS
SELECT
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    staff_id
FROM
    sakila.rental
WHERE
    MONTH(rental_date) = 5;
    
-- Create a table `rentals_june` to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june AS
SELECT
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    staff_id
FROM
    sakila.rental
WHERE
    MONTH(rental_date) = 6;


select * from rentals_may;
select * from rentals_june;

-- Check the number of rentals for each customer for May.
-- Check the number of rentals for each customer for June.

select
	customer_id,
	count(rental_id) as count_rentals
from rentals_may
group by customer_id;

select 
	customer_id,
	count(rental_id) as count_june_rentals
from rentals_june
group by customer_id;


    



