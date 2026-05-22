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


-- Sum of Sales across categories

SELECT  
p.category,
SUM(s.sales_amount)
FROM `EDA.db`.gold_fact_sales s
INNER JOIN `EDA.db`.gold_dim_products p
ON s.product_key = p.product_key
GROUP BY p.category 