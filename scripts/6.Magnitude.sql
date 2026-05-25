-- Find the total customers by countries

SELECT
	country,
	COUNT(customer_key) AS TotalCustomers
FROM
	`EDA.db`.gold_dim_customers
GROUP BY country
ORDER BY TotalCustomers DESC;

-- Find the total customers by gender

SELECT
	gender,
	COUNT(gender) AS GenderBreakdown
FROM
	`EDA.db`.gold_dim_customers
GROUP BY gender;

-- Find the total products by category

SELECT
	category,
	COUNT(product_key) AS TotalProdCategory
FROM
	`EDA.db`.gold_dim_products
GROUP BY category
ORDER BY TotalProdCategory DESC;

-- What is the average cost in each category
SELECT
	category,
	ROUND(AVG(cost),2) AS AvgCost
FROM
	`EDA.db`.gold_dim_products
GROUP BY category
ORDER BY AvgCost DESC;


SELECT
	p.category,
	SUM(s.sales_amount) AS TotalRevenue
FROM
	`EDA.db`.gold_fact_sales s 
LEFT JOIN `EDA.db`.gold_dim_products p
ON s.product_key = p.product_key
GROUP BY p.category
ORDER BY TotalRevenue DESC;

















