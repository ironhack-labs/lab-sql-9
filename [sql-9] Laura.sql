-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.

create table sakila.rentals_may
select *,
	date_format(rental_date, '%d') as rental_day, 
	date_format(rental_date, '%M') as rental_month
from sakila.rental
where (date_format(rental_date, '%M') = 'May')
;
	
-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
select *
from sakila.rentals_may
;

-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
create table sakila.rentals_june
select *,
	date_format(rental_date, '%d') as rental_day, 
	date_format(rental_date, '%M') as rental_month
from sakila.rental
where (date_format(rental_date, '%M') = 'June')
;

-- 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
select *
from sakila.rentals_june
;

-- 5. Check the number of rentals for each customer for May.
select rent.customer_id, customer.first_name, customer.last_name, count(rent.rental_id) as rentals_may
from sakila.rentals_may as rent
join sakila.customer as customer
on rent.customer_id = customer.customer_id
group by customer_id
order by customer_id
;

-- 6. Check the number of rentals for each customer for June.
select rent.customer_id, customer.first_name, customer.last_name, count(rent.rental_id) as rentals_june
from sakila.rentals_june as rent
join sakila.customer as customer
on rent.customer_id = customer.customer_id
group by customer_id
order by customer_id
;

-- 7. Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

-- 7.1 Check the number of rentals for each customer for May

-- 7.2 Check the number of rentals for each customer for June
--     Hint: You can store the results from the two queries in two separate dataframes.

-- 8. Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
--    Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas 
--    dataframes. Here is a link to the documentation for the merge function.