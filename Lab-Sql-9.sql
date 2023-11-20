-- 1) Creating a table rentals_may to store the data from rental table with information for the month of May
-- 2) Inserting values in the table rentals_may using the table rental, filtering values only for the month of May
create table sakila.rentals_may as 
select *
from sakila.rental
where date_format(rental_date, "%M") = "May";

-- 3) Creating a table rentals_june to store the data from rental table with information for the month of June
-- 4) Inserting values in the table rentals_june using the table rental, filtering values only for the month of June
create table sakila.rentals_june as 
select *
from sakila.rental
where date_format(rental_date, "%M") = "June";

-- 5) Checking the number of rentals for each customer for May
select customer_id, count(*) as number_of_rentals
from sakila.rentals_may
group by customer_id;

-- 6) Checking the number of rentals for each customer for June
select customer_id, count(*) as number_of_rentals
from sakila.rentals_june
group by customer_id;