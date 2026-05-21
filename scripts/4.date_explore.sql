-- ******** Date Exploration in the Database *******

-- Find the date of the first and last date
-- How many years of sales are available

SELECT
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	TIMESTAMPDIFF (YEAR, MIN(order_date), MAX(order_date)) AS order_range_years,
	TIMESTAMPDIFF (MONTH, MIN(order_date), MAX(order_date)) AS order_range_years
FROM	
	gold_fact_sales
	
	
-- Find the youngest and oldest customers
	
SELECT
	MIN(birthdate) AS oldest_birthdate,
	MAX(birthdate) AS youngesty_birthdate,
	TIMESTAMPDIFF(year, MIN(birthdate), CURDATE()) AS oldest_age,
	TIMESTAMPDIFF(year, MAX(birthdate), CURDATE()) AS youngest_age
FROM gold_dim_customers;
