-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
-- Create a table rentals_may to store the data from rental table with information for the month of May.

--

select *, convert(rental_date,date) as month
from sakila.rental
;
-- creating a table with only  the month of may 
CREATE TABLE rentals_may AS
-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
select * ,
date_format(convert(rental_date ,date),'%M') as month
from sakila.rental
having month = 'May';

-- viewing the table for May

select *
from sakila.rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june AS
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
select * ,
date_format(convert(rental_date ,date),'%M') as month
from sakila.rental
having month = 'June';

-- viewing the table for June 
select *
from sakila.rentals_june;

-- Check the number of rentals for each customer for May.
-- looking to table customer 
select *
from sakila.customer;

-- Use Join with customer ID, and groupby customer, to get rental of each customer fro MAy
SELECT c.customer_id, count(r.rental_id) as rental_cust
FROM sakila.customer c
LEFT JOIN sakila.rentals_May r ON c.customer_id = r.customer_id
GROUP BY c.customer_id ;


-- Now same thing for the month of June
SELECT c.customer_id, count(r.rental_id) as rental_cust
FROM sakila.customer c
LEFT JOIN sakila.rentals_june r ON c.customer_id = r.customer_id
GROUP BY c.customer_id ;
