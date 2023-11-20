-- Create a table `rentals_may` to store the data from rental table with information for the month of May.
-- - Insert values in the table `rentals_may` using the table rental, filtering values only for the month of May.
USE sakila;
create table rentals_may select * from sakila.rental
where month(rental_date)=5;
-- to confirm
select distinct (month(rental_date)) from rentals_may
order by 1;

-- - Insert values in the table `rentals_june` using the table rental, filtering values only for the month of June.
USE sakila;
create table rentals_june select * from sakila.rental
where month(rental_date)=6 ;

-- - Check the number of rentals for each customer for May.
select concat(cus.first_name,' ', cus.last_name) as full_name, count(rent.customer_id) as count_film_rent_may
from sakila.rentals_may rent
left join sakila.customer cus 
on rent.customer_id = cus.customer_id
group by rent.customer_id
order by 2 desc;

--  Check the number of rentals for each customer for June.
select concat(cus.first_name,' ', cus.last_name) as full_name, count(rent.customer_id) as count_film_rent_june
from sakila.rentals_june rent
left join sakila.customer cus 
on rent.customer_id = cus.customer_id
group by rent.customer_id
order by 2 desc;

--