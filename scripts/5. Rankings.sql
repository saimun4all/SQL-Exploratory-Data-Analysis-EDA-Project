-- Which 5 products generate the highest revenue?

SELECT
	p.product_name,
	SUM(s.sales_amount) AS TotalRevenue
FROM
	`EDA.db`.gold_fact_sales s 
LEFT JOIN `EDA.db`.gold_dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY TotalRevenue DESC
LIMIT 5;


-- Which 5 products generate the highest revenue using Window Function?

SELECT *
	FROM (
		SELECT
		p.product_name,
		SUM(s.sales_amount) AS TotalRevenue,
		ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount) DESC) AS Ranking
	FROM
		`EDA.db`.gold_fact_sales s 
	LEFT JOIN `EDA.db`.gold_dim_products p
	ON s.product_key = p.product_key
	GROUP BY p.product_name) t
WHERE Ranking <= 5;


-- What are the 5 worst-performing products in terms of sales

SELECT
	p.product_name,
	SUM(s.sales_amount) AS TotalRevenue
FROM
	`EDA.db`.gold_fact_sales s 
LEFT JOIN `EDA.db`.gold_dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY TotalRevenue ASC
LIMIT 5;


-- The top 10 customers who have generated the highest revenue

SELECT
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) AS TotalRevenue
FROM
	`EDA.db`.gold_fact_sales s 
LEFT JOIN `EDA.db`.gold_dim_customers c
ON s.customer_key = c.customer_key
GROUP BY
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY TotalRevenue DESC
LIMIT 10;















































