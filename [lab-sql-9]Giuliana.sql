-- Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
-- Check the number of rentals for each customer for May
-- Check the number of rentals for each customer for June
-- Hint: You can store the results from the two queries in two separate dataframes.
-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.


-- Creating the table for May rentals and filtering the rents that happend in that month

create table sakila.rentals_may
select ren.*, cus.first_name, cus.last_name, cus.email, cus.address_id
from sakila.rental ren 
inner join sakila.customer cus 
on ren.customer_id = cus.customer_id
where date_format(convert(rental_date, date), '%M') = 'May';

select * from sakila.rentals_may;


-- Doing the same for the month of June
create table sakila.rentals_june
select ren.*, cus.first_name, cus.last_name, cus.email, cus.address_id
from sakila.rental ren 
inner join sakila.customer cus 
on ren.customer_id = cus.customer_id
where date_format(convert(rental_date, date), '%M') = 'June';

-- Checking the number of rentakls for each customer in May 
select count(rental_id) as num_rents, customer_id, first_name, last_name 
from sakila.rentals_may
group by 2,3,4
order by num_rents desc;

-- Checking the number of rentals for each customer in June 
select count(rental_id) as num_rents, customer_id, first_name, last_name 
from sakila.rentals_june
group by 2,3,4
order by num_rents desc;