## ----------- ENGLISH -----------

# Data Model

## Overview

The cleaned Superstore dataset was transformed from a flat table into a simple star schema.

The goal of this model is to separate transactional sales data from descriptive information about customers, products and dates.

This structure makes the dataset easier to analyze using SQL, PostgreSQL and Power BI.

## Star Schema Structure

The model includes one fact table and three dimension tables:

- `fact_sales`
- `dim_customers`
- `dim_products`
- `dim_date`

## Fact Table

### `fact_sales`

The `fact_sales` table contains transactional sales data.

Main fields:

- `order_id`
- `customer_id`
- `product_id`
- `order_date_id`
- `ship_date_id`
- `sales`
- `quantity`
- `discount`
- `profit`

This table stores the numerical measures used for analysis, such as sales, quantity, discount and profit.

It also contains the foreign keys used to connect each sales transaction to the related customer, product and date records.

## Dimension Tables

### `dim_customers`

The `dim_customers` table contains customer and geographical information.

Main fields:

- `customer_id`
- `customer_name`
- `segment`
- `country_region`
- `city`
- `state_province`
- `postal_code`
- `region`

This table is used to analyze sales and profit by customer segment and geographical area.

### `dim_products`

The `dim_products` table contains product information.

Main fields:

- `product_id`
- `product_name`
- `category`
- `sub_category`

This table is used to analyze sales, profit and margins by product category and sub-category.

### `dim_date`

The `dim_date` table contains calendar information used for time-based analysis.

Main fields:

- `date_id`
- `date`
- `year`
- `quarter`
- `month`
- `month_name`
- `day`
- `day_of_week`

This table supports analysis by year, quarter, month and day.

## Relationships

The relationships between the tables are:

- `fact_sales.customer_id` → `dim_customers.customer_id`
- `fact_sales.product_id` → `dim_products.product_id`
- `fact_sales.order_date_id` → `dim_date.date_id`
- `fact_sales.ship_date_id` → `dim_date.date_id`

In PostgreSQL, both `order_date_id` and `ship_date_id` are defined as foreign keys connected to `dim_date.date_id`.

In the Power BI report, the analysis mainly uses the order date relationship for time-based visuals.

## Model Purpose

The model was designed to support basic business analysis on:

- sales;
- profit;
- quantity;
- discounts;
- customers;
- products;
- geographical areas;
- time periods.

The same structure is used in Power BI to build relationships between the fact table and the dimension tables.

## Notes

This star schema keeps the model simple and suitable for a Junior Data Analyst portfolio.

The structure is intentionally focused on clarity, explainability and compatibility with SQL and Power BI analysis.



## ----------- ITALIANO -----------

# Modello Dati

## Panoramica

Il dataset Superstore pulito è stato trasformato da una tabella piatta in un semplice schema a stella.

L'obiettivo di questo modello è separare i dati transazionali di vendita dalle informazioni descrittive relative a clienti, prodotti e date.

Questa struttura rende il dataset più semplice da analizzare usando SQL, PostgreSQL e Power BI.

## Struttura dello Schema a Stella

Il modello include una tabella fact e tre tabelle dimensionali:

- `fact_sales`
- `dim_customers`
- `dim_products`
- `dim_date`

## Tabella Fact

### `fact_sales`

La tabella `fact_sales` contiene i dati transazionali di vendita.

Campi principali:

- `order_id`
- `customer_id`
- `product_id`
- `order_date_id`
- `ship_date_id`
- `sales`
- `quantity`
- `discount`
- `profit`

Questa tabella contiene le misure numeriche usate per l'analisi, come vendite, quantità, sconto e profitto.

Contiene anche le chiavi esterne usate per collegare ogni transazione di vendita ai relativi record di cliente, prodotto e data.

## Tabelle Dimensionali

### `dim_customers`

La tabella `dim_customers` contiene informazioni sui clienti e sulla localizzazione geografica.

Campi principali:

- `customer_id`
- `customer_name`
- `segment`
- `country_region`
- `city`
- `state_province`
- `postal_code`
- `region`

Questa tabella viene usata per analizzare vendite e profitto per segmento cliente e area geografica.

### `dim_products`

La tabella `dim_products` contiene informazioni sui prodotti.

Campi principali:

- `product_id`
- `product_name`
- `category`
- `sub_category`

Questa tabella viene usata per analizzare vendite, profitto e margini per categoria e sottocategoria prodotto.

### `dim_date`

La tabella `dim_date` contiene informazioni di calendario usate per le analisi temporali.

Campi principali:

- `date_id`
- `date`
- `year`
- `quarter`
- `month`
- `month_name`
- `day`
- `day_of_week`

Questa tabella supporta analisi per anno, trimestre, mese e giorno.

## Relazioni

Le relazioni tra le tabelle sono:

- `fact_sales.customer_id` → `dim_customers.customer_id`
- `fact_sales.product_id` → `dim_products.product_id`
- `fact_sales.order_date_id` → `dim_date.date_id`
- `fact_sales.ship_date_id` → `dim_date.date_id`

In PostgreSQL, sia `order_date_id` sia `ship_date_id` sono definiti come chiavi esterne collegate a `dim_date.date_id`.

Nel report Power BI, l'analisi temporale utilizza principalmente la relazione basata sulla data ordine.

## Scopo del Modello

Il modello è stato progettato per supportare analisi business di base su:

- vendite;
- profitto;
- quantità;
- sconti;
- clienti;
- prodotti;
- aree geografiche;
- periodi temporali.

La stessa struttura è usata in Power BI per costruire le relazioni tra la tabella fact e le tabelle dimensionali.

## Note

Questo schema a stella mantiene il modello semplice e adatto a un portfolio Junior Data Analyst.

La struttura è intenzionalmente focalizzata su chiarezza, spiegabilità e compatibilità con analisi SQL e Power BI.