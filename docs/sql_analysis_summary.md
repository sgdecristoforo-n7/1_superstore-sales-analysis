## ----------- ENGLISH -----------

# SQL Analysis Summary

## Overview

This document summarizes the SQL part of the Superstore Retail Sales Analysis project.

After the data cleaning and modeling phase in Python, the cleaned tables were imported into PostgreSQL and organized using a simple star schema composed of one fact table and three dimension tables.

The SQL section was used to validate the imported data, check relationships between tables and run basic business queries.

## SQL Objectives

The SQL scripts were used to:

- create the PostgreSQL tables;
- define primary keys and foreign keys;
- validate the number of records imported into each table;
- check join integrity between the fact table and the dimension tables;
- run basic business queries on sales, profit and discounts.

## Database Schema

The PostgreSQL schema includes the following tables:

- `fact_sales`
- `dim_customers`
- `dim_products`
- `dim_date`

The fact table contains transactional sales data, while the dimension tables contain descriptive information about customers, products and dates.

## SQL Scripts

### `00_create_tables.sql`

This script creates the PostgreSQL star schema.

It defines:

- customer dimension table;
- product dimension table;
- date dimension table;
- sales fact table;
- primary keys;
- foreign keys.

### `01_table_checks.sql`

This script checks the number of rows imported into each table.

It is used to verify that the CSV files exported from Python were correctly loaded into PostgreSQL.

### `02_join_integrity_checks.sql`

This script checks whether all records in the fact table have matching records in the related dimension tables.

The script verifies the relationships between:

- `fact_sales.customer_id` and `dim_customers.customer_id`;
- `fact_sales.product_id` and `dim_products.product_id`;
- `fact_sales.order_date_id` and `dim_date.date_id`;
- `fact_sales.ship_date_id` and `dim_date.date_id`.

The expected result is zero missing records for each check.

### `03_sales_profit_analysis.sql`

This script contains simple business queries based on core SQL concepts.

The queries analyze:

- sales and profit by product category;
- sales and profit by region;
- average discount, sales and profit by customer segment.

## SQL Concepts Used

The SQL section uses the following concepts:

- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `SELECT`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT`
- `SUM`
- `AVG`
- `ROUND`
- `ORDER BY`
- `UNION ALL`
- `IS NULL`

## Business Queries Included

The business queries were intentionally kept simple and explainable.

They were designed to answer basic analytical questions such as:

- which product categories generate the highest sales and profit;
- which regions generate the highest or lowest profit;
- how average discount, sales and profit vary by customer segment.

These queries provide a SQL-based validation layer before building the Power BI dashboard.

## Notes

The SQL analysis is intentionally focused on clear and explainable queries suitable for a Junior Data Analyst portfolio.



## ----------- ITALIANO -----------

# Riepilogo dell'Analisi SQL

## Panoramica

Questo documento riassume la parte SQL del progetto di analisi delle vendite e della redditività del dataset Superstore.

Dopo la fase di pulizia e modellazione dei dati in Python, le tabelle pulite sono state importate in PostgreSQL e organizzate usando un semplice schema a stella composto da una tabella fact e tre tabelle dimensionali.

La sezione SQL è stata usata per validare i dati importati, controllare le relazioni tra le tabelle ed eseguire query business di base.

## Obiettivi SQL

Gli script SQL sono stati usati per:

- creare le tabelle in PostgreSQL;
- definire chiavi primarie e chiavi esterne;
- validare il numero di record importati in ogni tabella;
- controllare l'integrità delle join tra tabella fact e tabelle dimensionali;
- eseguire query business di base su vendite, profitto e sconti.

## Schema del Database

Lo schema PostgreSQL include le seguenti tabelle:

- `fact_sales`
- `dim_customers`
- `dim_products`
- `dim_date`

La tabella fact contiene i dati transazionali di vendita, mentre le tabelle dimensionali contengono informazioni descrittive su clienti, prodotti e date.

## Script SQL

### `00_create_tables.sql`

Questo script crea lo schema a stella in PostgreSQL.

Definisce:

- tabella dimensionale clienti;
- tabella dimensionale prodotti;
- tabella dimensionale date;
- tabella fact delle vendite;
- chiavi primarie;
- chiavi esterne.

### `01_table_checks.sql`

Questo script controlla il numero di righe importate in ogni tabella.

Viene usato per verificare che i file CSV esportati da Python siano stati caricati correttamente in PostgreSQL.

### `02_join_integrity_checks.sql`

Questo script controlla se tutti i record presenti nella tabella fact hanno record corrispondenti nelle relative tabelle dimensionali.

Lo script verifica le relazioni tra:

- `fact_sales.customer_id` e `dim_customers.customer_id`;
- `fact_sales.product_id` e `dim_products.product_id`;
- `fact_sales.order_date_id` e `dim_date.date_id`;
- `fact_sales.ship_date_id` e `dim_date.date_id`.

Il risultato atteso è zero record mancanti per ciascun controllo.

### `03_sales_profit_analysis.sql`

Questo script contiene semplici query business basate sui concetti SQL fondamentali.

Le query analizzano:

- vendite e profitto per categoria prodotto;
- vendite e profitto per regione;
- sconto medio, vendite e profitto per segmento cliente.

## Concetti SQL Utilizzati

La sezione SQL utilizza i seguenti concetti:

- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `SELECT`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT`
- `SUM`
- `AVG`
- `ROUND`
- `ORDER BY`
- `UNION ALL`
- `IS NULL`

## Query Business Incluse

Le query business sono state mantenute intenzionalmente semplici e spiegabili.

Sono state progettate per rispondere a domande analitiche di base, come:

- quali categorie prodotto generano vendite e profitto più alti;
- quali regioni generano il profitto più alto o più basso;
- come variano sconto medio, vendite e profitto per segmento cliente.

Queste query forniscono un livello di validazione tramite SQL prima della costruzione della dashboard in Power BI.

## Note

L'analisi SQL è intenzionalmente focalizzata su query chiare e spiegabili, adatte a un portfolio Junior Data Analyst.