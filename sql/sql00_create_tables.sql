/*
===============================================================================
Create PostgreSQL Star Schema
===============================================================================

Purpose:
This script creates the PostgreSQL star schema used for the Superstore retail
sales analysis.

Schema:
- dim_customers
- dim_products
- dim_date
- fact_sales

The fact table contains transactional sales data.
The dimension tables contain descriptive attributes for customers, products
and dates.

Note:
The dimension tables are created before the fact table because fact_sales
contains foreign keys referencing them.
===============================================================================
*/

CREATE TABLE dim_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(50),
    region VARCHAR(100)
);
/*
*/
CREATE TABLE dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name TEXT,
    category VARCHAR(100),
    sub_category VARCHAR(100)
);
/*
*/
CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    date DATE,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    day INTEGER,
    day_of_week VARCHAR(20)
);
/*
*/
CREATE TABLE fact_sales (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    order_date_id INTEGER,
    ship_date_id INTEGER,
    sales NUMERIC(12, 2),
    quantity INTEGER,
    discount NUMERIC(5, 2),
    profit NUMERIC(12, 2),
/*
*/
    CONSTRAINT fk_fact_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES dim_customers(customer_id),
/*
*/
    CONSTRAINT fk_fact_sales_product
        FOREIGN KEY (product_id)
        REFERENCES dim_products(product_id),
/*
*/
    CONSTRAINT fk_fact_sales_order_date
        FOREIGN KEY (order_date_id)
        REFERENCES dim_date(date_id),
/*
*/
    CONSTRAINT fk_fact_sales_ship_date
        FOREIGN KEY (ship_date_id)
        REFERENCES dim_date(date_id)
);