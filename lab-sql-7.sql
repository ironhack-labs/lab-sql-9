-- Instructions
-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

-- Create a table rentals_may to store the data from rental table with information for the month of May.
-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

use sakila;
CREATE TABLE if not exists rentals_may like sakila.rental;

INSERT INTO rentals_may
	SELECT * From rental
    where month(rental_date)=5;
    
SELECT * From sakila.rentals_may;
    
-- Create a table rentals_june to store the data from rental table with information for the month of June.
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

CREATE TABLE if not exists rentals_june like sakila.rental;

INSERT INTO rentals_june
	SELECT * From rental
    where month(rental_date)=6;
    
SELECT * From sakila.rentals_june;

-- Check the number of rentals for each customer for May.

SELECT 
customer_id,
count(customer_id) as number_of_films
From sakila.rentals_may
group by customer_id
order by number_of_films desc;



-- Check the number of rentals for each customer for June.

SELECT 
customer_id,
count(customer_id) as number_of_films
From sakila.rentals_june
group by customer_id
order by number_of_films desc

-- Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

-- Check the number of rentals for each customer for May

-- Check the number of rentals for each customer for June

-- Hint: You can store the results from the two queries in two separate dataframes.
			-- import pymysql
			-- from sqlalchemy import create_engine
            -- import pandas as pd
			-- import getpass
			-- password = getpass.getpass()
			-- connection_string = 'mysql+pymysql://root:' + password + '@localhost/sakila'
			-- engine = create_engine(connection_string)
			-- data_may = pd.read_sql_query('SELECT customer_id,count(customer_id) as number_of_films From sakila.rentals_may group by customer_id order by number_of_films desc;',engine)
			-- data_may
            -- data_june = pd.read_sql_query('SELECT customer_id,count(customer_id) as number_of_films From sakila.rentals_june group by customer_id order by number_of_films desc;',engine)
			-- data_june

-- Write a function that checks if customer borrowed more or less films in the month of June as compared to May.

-- Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.