/*
===============================================================================
Table Row Checks
===============================================================================

Purpose:
This script checks the number of records loaded into each table of the
PostgreSQL star schema.

Tables checked:
- fact_sales
- dim_customers
- dim_products
- dim_date

These checks are used to validate that the CSV exports were correctly imported
into PostgreSQL.
===============================================================================
*/

SELECT
    'fact_sales' AS table_name,
    COUNT(*) AS row_count
FROM fact_sales
/*
*/
UNION ALL
SELECT
    'dim_customers' AS table_name,
    COUNT(*) AS row_count
FROM dim_customers
/*
*/
UNION ALL
SELECT
    'dim_products' AS table_name,
    COUNT(*) AS row_count
FROM dim_products
/*
*/
UNION ALL
SELECT
    'dim_date' AS table_name,
    COUNT(*) AS row_count
FROM dim_date
/*
*/
ORDER BY table_name;