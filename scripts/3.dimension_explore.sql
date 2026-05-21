-- Explore the dimensions in the database

SELECT  
	DISTINCT(country)
FROM `EDA.db`.gold_dim_customers


-- Explore all products categories "The Major Divisions"

SELECT 
	DISTINCT(category),
	subcategory,
	product_name
FROM `EDA.db`.gold_dim_products
ORDER BY 1, 2, 3