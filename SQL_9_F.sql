
-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

-- 1.Create a table `rentals_may` to store the data from rental table with information for the month of May.
create temporary table sakila.rental_may
select *, date_format(rental_date, "%M") as month
from sakila.rental
where date_format(rental_date, "%M") = 'May';


-- to make sure we only have the month of May 
select distinct month 
from sakila.rental_may;

-- 2.Create a table `rentals_june` to store the data from rental table with information for the month of June.
create temporary table sakila.rental_june
select *, date_format(rental_date, "%M") as month
from sakila.rental
where date_format(rental_date, "%M") = 'June';

select distinct month from sakila.rental_june;

-- 3.Check the number of rentals for each customer for May.
select * from sakila.rental_may;
select concat(first_name, ' ', last_name) customer_full_name, count(rental_id) as rental_per_costumer 
from sakila.rental_may rm
left join sakila.customer c 
on rm.customer_id = c.customer_id
group by rm.customer_id
order by count(rental_id) desc;

-- 4. Check the number of rentals for each customer for June.
select * from sakila.rental_june;
select concat(first_name, ' ', last_name) customer_full_name, count(rental_id) as rental_per_costumer 
from sakila.rental_june rm
left join sakila.customer c 
on rm.customer_id = c.customer_id
group by rm.customer_id
order by count(rental_id) desc;


-- 5. Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
		-- a.Check the number of rentals for each customer for May
create table sakila.customer_rentals_may
select concat(first_name, ' ', last_name) customer_full_name, count(rental_id) as rental_per_costumer 
from sakila.rental_may rm
left join sakila.customer c 
on rm.customer_id = c.customer_id
group by rm.customer_id
order by count(rental_id) desc;

select* from sakila.customer_rentals_may;

		-- b.Check the number of rentals for each customer for June
create table sakila.customer_rentals_june
select concat(first_name, ' ', last_name) customer_full_name, count(rental_id) as rental_per_costumer 
from sakila.rental_june rm
left join sakila.customer c 
on rm.customer_id = c.customer_id
group by rm.customer_id
order by count(rental_id) desc;

select* from sakila.customer_rentals_june;
select * from sakila.actor;



-- 6.Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
		-- **Hint**: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. 
        -- Here is a link to the documentation for the [merge function](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.merge.html).