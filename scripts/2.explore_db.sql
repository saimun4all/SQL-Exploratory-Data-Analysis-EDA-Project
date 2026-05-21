-- Explore All Object in the Database

SELECT * FROM information_schema.tables;

-- Explore All Columns in the Database

SELECT * FROM information_schema.columns;

SELECT * FROM information_schema.columns
WHERE TABLE_NAME = 'sales';