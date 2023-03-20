# Create a table rentals_may to store the data from rental table with information for the month of May.
use sakila;

select rental_date,date_format(rental_date,"%M") as mon from rental;

CREATE TABLE if not exists rentals_may like rental;

# Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may select * from rental where date_format(rental_date,"%M")="May";
select * from rentals_may;

#Create a table rentals_june to store the data from rental table with information for the month of June.
#Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

CREATE TABLE if not exists rentals_june like rental;
insert into rentals_june select * from rental where date_format(rental_date,"%M")="June";
select * from rentals_june;

#Check the number of rentals for each customer for May.
select count(*) as rentals, customer_id from rentals_may group by customer_id order by rentals desc;

#Check the number of rentals for each customer for June.
select count(*) as rentals, customer_id from rentals_june group by customer_id order by rentals desc;

