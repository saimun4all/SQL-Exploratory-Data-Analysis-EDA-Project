-- Find the Total Sales

SELECT
	SUM(sales_amount) AS TotalSales
FROM `EDA.db`.gold_fact_sales;


-- Find how many items are sold

SELECT
	SUM(quantity) AS TotalQuantity
FROM `EDA.db`.gold_fact_sales;


-- Find the average selling price

SELECT
	AVG(price) AS AvgSellingPrice
FROM `EDA.db`.gold_fact_sales;


-- Find the total number of orders


SELECT COUNT(DISTINCT order_number) AS TotalOrders
FROM `EDA.db`.gold_fact_sales;


-- Find the total number of products

SELECT COUNT(DISTINCT product_key) AS TotalProducts
FROM `EDA.db`.gold_fact_sales;


-- Find the total number of customers

SELECT COUNT(DISTINCT customer_key) AS TotalCustomers
FROM `EDA.db`.gold_fact_sales;


-- Find the total number of customers that has placed an order

SELECT COUNT(DISTINCT customer_key)
FROM `EDA.db`.gold_fact_sales
WHERE order_number IS NOT NULL


******* GENERATE REPORT THAT SHOWS ALL KEY METRICS OF THE BUSINESS *******

SELECT
	'Total Sales' AS measure_name,
	SUM(sales_amount) AS measure_value
FROM `EDA.db`.gold_fact_sales
UNION ALL
SELECT
	'Total Quantity' AS measure_name,
	SUM(quantity) AS measure_value
FROM `EDA.db`.gold_fact_sales
UNION ALL
SELECT
	'Average Price',	
	AVG(price)
FROM `EDA.db`.gold_fact_sales
UNION ALL
SELECT 
	'Total Nr. Orders',
	COUNT(DISTINCT order_number)
FROM `EDA.db`.gold_fact_sales
UNION ALL
SELECT
	'Total Nr. Products',
	COUNT(DISTINCT product_key)
FROM `EDA.db`.gold_fact_sales
UNION ALL
SELECT
	'Total Nr. Customers',
	COUNT(DISTINCT customer_key)
FROM `EDA.db`.gold_fact_sales;



-- Sum of Sales across categories

-- SELECT  
-- p.category,
-- SUM(s.sales_amount)
-- FROM `EDA.db`.gold_fact_sales s
-- INNER JOIN `EDA.db`.gold_dim_products p
-- ON s.product_key = p.product_key
-- GROUP BY p.category 