select * 
from sakila.rental;

create table sakila.rentals_may like sakila.rental;

insert into sakila.rentals_may 
select * 
from sakila.rental
where month(rental_date) = 5;

select * 
from sakila.rentals_may;

create table sakila.rentals_june like sakila.rental;
insert into sakila.rentals_june 
select * from sakila.rental
where month(rental_date) = 6;
select * from sakila.rentals_june;


select customer_id, count(rental_id) as number_rentals
from sakila.rentals_may
group by customer_id
order by customer_id;


select customer_id, count(rental_id) as number_rentals
from sakila.rentals_june
group by customer_id
order by customer_id;



