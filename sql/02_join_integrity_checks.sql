/*
===============================================================================
Join Integrity Checks
===============================================================================

Purpose:
This script checks whether the fact table correctly joins to the dimension
tables of the PostgreSQL star schema.

The goal is to verify that all foreign keys in fact_sales have a matching
record in the related dimension tables.

Relationships checked:
- fact_sales.customer_id   -> dim_customers.customer_id
- fact_sales.product_id    -> dim_products.product_id
- fact_sales.order_date_id -> dim_date.date_id
- fact_sales.ship_date_id  -> dim_date.date_id

Expected result:
All missing_* values should be 0.
===============================================================================
*/

SELECT
    'missing_customers' AS check_name,
    COUNT(*) AS missing_records
FROM fact_sales fs
LEFT JOIN dim_customers dc
    ON fs.customer_id = dc.customer_id
WHERE dc.customer_id IS NULL
/*
*/
UNION ALL
/*
*/
SELECT
    'missing_products' AS check_name,
    COUNT(*) AS missing_records
FROM fact_sales fs
LEFT JOIN dim_products dp
    ON fs.product_id = dp.product_id
WHERE dp.product_id IS NULL
/*
*/
UNION ALL
/*
*/
SELECT
    'missing_order_dates' AS check_name,
    COUNT(*) AS missing_records
FROM fact_sales fs
LEFT JOIN dim_date dd
    ON fs.order_date_id = dd.date_id
WHERE dd.date_id IS NULL
/*
*/
UNION ALL
/*
*/
SELECT
    'missing_ship_dates' AS check_name,
    COUNT(*) AS missing_records
FROM fact_sales fs
LEFT JOIN dim_date dd
    ON fs.ship_date_id = dd.date_id
WHERE dd.date_id IS NULL
/*
*/
ORDER BY check_name;