/*
===============================================================================
Basic Business Queries
===============================================================================

Purpose:
This script contains simple SQL queries used to analyze sales, profit and
discounts in the Superstore retail dataset.

The queries are intentionally focused on core SQL concepts:
- JOIN
- GROUP BY
- SUM
- AVG
- ROUND
- ORDER BY
===============================================================================
*/


/*
-------------------------------------------------------------------------------
1. Sales and profit by product category
-------------------------------------------------------------------------------
*/

SELECT
    dp.category,
    ROUND(SUM(fs.sales), 2) AS total_sales,
    ROUND(SUM(fs.profit), 2) AS total_profit
FROM fact_sales fs
JOIN dim_products dp
    ON fs.product_id = dp.product_id
GROUP BY dp.category
ORDER BY total_profit DESC;


/*
-------------------------------------------------------------------------------
2. Sales and profit by region
-------------------------------------------------------------------------------
*/

SELECT
    dc.region,
    ROUND(SUM(fs.sales), 2) AS total_sales,
    ROUND(SUM(fs.profit), 2) AS total_profit
FROM fact_sales fs
JOIN dim_customers dc
    ON fs.customer_id = dc.customer_id
GROUP BY dc.region
ORDER BY total_profit DESC;


/*
-------------------------------------------------------------------------------
3. Average discount, sales and profit by customer segment
-------------------------------------------------------------------------------
*/

SELECT
    dc.segment,
    ROUND(AVG(fs.discount), 4) AS avg_discount,
    ROUND(SUM(fs.sales), 2) AS total_sales,
    ROUND(SUM(fs.profit), 2) AS total_profit
FROM fact_sales fs
JOIN dim_customers dc
    ON fs.customer_id = dc.customer_id
GROUP BY dc.segment
ORDER BY total_profit DESC;