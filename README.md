# Superstore Retail Sales Analysis

## Project Overview

This project analyzes retail sales and profitability using the Superstore dataset.

The goal is to identify sales and profit patterns across product categories, regions, customer segments and discount levels.

## Business Questions

- Which product categories are the most profitable?
- Which regions generate the highest and lowest profit?
- How do discounts affect profitability?
- Which products and customers contribute most to sales and profit?
- How do sales and profit evolve over time?

## Tools Used

- Python / Pandas: data cleaning and preparation
- PostgreSQL: relational modeling and SQL analysis
- Power BI: dashboard and data visualization
- GitHub: project documentation and version control

## Project Structure

data/
notebooks/
sql/
powerbi/
docs/

## Data Preparation

The original dataset was cleaned using Python and Pandas.

Main steps included:

duplicate checks;
missing value checks;
data type correction;
text normalization;
Product ID anomaly analysis;
creation of a star schema.
Data Model

The cleaned dataset was transformed into a star schema:

fact_sales
dim_customers
dim_products
dim_date

## SQL Analysis

SQL queries were written in PostgreSQL to validate the model and perform business analysis.

Main analyses include:

table row checks;
join integrity checks;
sales and profit by category;
sales and profit by region;
profitability by customer segment;
discount impact analysis;
top and bottom products by profit;
monthly sales and profit trend;
top customers by sales.

## Dashboard

A Power BI dashboard was created to visualize the main KPIs and business insights.

Key Insights

To be completed after final Power BI analysis.

Repository Status

Project in progress.
