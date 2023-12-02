create temporary table sakila.rentals_may as select * from sakila.rental where month(rental_date)=5;
create temporary table sakila.rentals_june as select * from sakila.rental where month(rental_date)=6;

select concat(cust.first_name, " ", cust.last_name) as customer_name, count(may.rental_id) as nr_rentals_may
from sakila.customer cust left join sakila.rentals_may may 
on may.customer_id = cust.customer_id
group by cust.customer_id order by 2 desc;

create table sakila.rentals_may_june 
as select cust.customer_id, concat(cust.first_name, " ", cust.last_name) as customer_name, 
count(distinct may.rental_id) as nr_rentals_may, count(distinct june.rental_id) as nr_rentals_june
from
sakila.customer as cust 
left join sakila.rentals_may as may
on may.customer_id = cust.customer_id
left join sakila.rentals_june as june
on june.customer_id = cust.customer_id
group by cust.customer_id order by (nr_rentals_may + nr_rentals_june) desc;

select * from sakila.rentals_may_june;