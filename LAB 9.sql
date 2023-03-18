
#1 Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE if not exists rentals_may like rental;


#2 Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into sakila.rentals_may 
select * from RENTAL
where month(RENTAL_DATE) = 5;
select * from rentals_may;

# 3 Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE if not exists rentals_june like rental;

# 4 Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into sakila.rentals_june 
select * from RENTAL
where month(RENTAL_DATE) = 6;
select * from rentals_june;

#5 Check the number of rentals for each customer for May.
SELECT customer_id, COUNT(rental_id) AS number_rentals
FROM rentals_may
GROUP BY customer_id
ORDER BY customer_id;

#6 Check the number of rentals for each customer for June.
SELECT customer_id, COUNT(rental_id) AS number_rentals
FROM sakila.rentals_june
GROUP BY customer_id
ORDER BY customer_id;

