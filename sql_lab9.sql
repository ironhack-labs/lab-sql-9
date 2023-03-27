-- Create a table rentals_may to store the data from rental table with information for the month of May.

use sakila;
create table if not exists rentals_may like rental;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

insert into rentals_may
select * from rental
where month (rental_date)=5;

select * from sakila.rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.

use sakila;
create table if not exists rentals_june like rental;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

insert into rentals_june
select * from rental
where month (rental_date)=6;

select * from sakila.rentals_june;

-- Check the number of rentals for each customer for May.

select customer_id,
count(customer_id) as number_of_films
from sakila.rentals_may
group by customer_id
order by number_of_films desc;

-- Check the number of rentals for each customer for June

select customer_id,
count(customer_id) as number_of_films
from sakila.rentals_june
group by customer_id
order by number_of_films desc;

