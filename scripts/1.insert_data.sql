/*
=============================================================
SQLite Setup Script for DBeaver
=============================================================
Database: DataWarehouseAnalytics (SQLite)
*/

-- Drop existing tables (if they exist)
DROP TABLE IF EXISTS gold_dim_customers;
DROP TABLE IF EXISTS gold_dim_products;
DROP TABLE IF EXISTS gold_fact_sales;

-- Create Tables
CREATE TABLE gold_dim_customers (
    customer_key    INTEGER,
    customer_id     INTEGER,
    customer_number TEXT,
    first_name      TEXT,
    last_name       TEXT,
    country         TEXT,
    marital_status  TEXT,
    gender          TEXT,
    birthdate       DATE,
    create_date     DATE
);

CREATE TABLE gold_dim_products (
    product_key     INTEGER,
    product_id      INTEGER,
    product_number  TEXT,
    product_name    TEXT,
    category_id     TEXT,
    category        TEXT,
    subcategory     TEXT,
    maintenance     TEXT,
    cost            INTEGER,
    product_line    TEXT,
    start_date      DATE
);

CREATE TABLE gold_fact_sales (
    order_number    TEXT,
    product_key     INTEGER,
    customer_key    INTEGER,
    order_date      DATE,
    shipping_date   DATE,
    due_date        DATE,
    sales_amount    INTEGER,
    quantity        INTEGER,
    price           INTEGER
);

-- Create useful indexes for performance
CREATE INDEX IF NOT EXISTS idx_customers_key ON gold_dim_customers(customer_key);
CREATE INDEX IF NOT EXISTS idx_products_key  ON gold_dim_products(product_key);
CREATE INDEX IF NOT EXISTS idx_fact_customer ON gold_fact_sales(customer_key);
CREATE INDEX IF NOT EXISTS idx_fact_product  ON gold_fact_sales(product_key);
CREATE INDEX IF NOT EXISTS idx_fact_orderdate ON gold_fact_sales(order_date);

SELECT '✅ Tables created successfully!' AS status;