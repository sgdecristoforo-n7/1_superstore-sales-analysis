# SQL Analysis Summary

## Overview

This section documents the SQL part of the Superstore Retail Sales Analysis project.

The cleaned dataset was imported into PostgreSQL and organized using a simple star schema composed of one fact table and three dimension tables.

## SQL Objectives

The SQL scripts were used to:

* create the PostgreSQL tables;
* define primary keys and foreign keys;
* validate the number of records imported into each table;
* check join integrity between the fact table and the dimension tables;
* run basic business queries on sales, profit and discounts.

## Database Schema

The PostgreSQL schema includes the following tables:

* `fact_sales`
* `dim_customers`
* `dim_products`
* `dim_date`

The fact table contains transactional sales data, while the dimension tables contain descriptive information about customers, products and dates.

## SQL Scripts

### `00_create_tables.sql`

Creates the PostgreSQL star schema.

This script defines:

* customer dimension table;
* product dimension table;
* date dimension table;
* sales fact table;
* primary keys;
* foreign keys.

### `01_table_checks.sql`

Checks the number of rows imported into each table.

This is used to verify that the CSV files exported from Python were correctly loaded into PostgreSQL.

### `02_join_integrity_checks.sql`

Checks whether all records in the fact table have matching records in the related dimension tables.

The script verifies the relationships between:

* `fact_sales.customer_id` and `dim_customers.customer_id`;
* `fact_sales.product_id` and `dim_products.product_id`;
* `fact_sales.order_date_id` and `dim_date.date_id`;
* `fact_sales.ship_date_id` and `dim_date.date_id`.

The expected result is zero missing records for each check.

### `03_basic_business_queries.sql`

Contains simple business queries based on core SQL concepts.

The queries analyze:

* sales and profit by product category;
* sales and profit by region;
* average discount, sales and profit by customer segment.

## SQL Concepts Used

The SQL section uses the following concepts:

* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `SELECT`
* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `COUNT`
* `SUM`
* `AVG`
* `ROUND`
* `ORDER BY`
* `UNION ALL`
* `IS NULL`

## Notes

The SQL analysis is intentionally focused on clear and explainable queries suitable for a Junior Data Analyst portfolio.

More advanced SQL techniques, such as window functions, subqueries and common table expressions, were not included in this version of the project.

---

# Riepilogo Analisi SQL

## Panoramica

Questa sezione documenta la parte SQL del progetto di analisi vendite Superstore.

Il dataset pulito con Python/Pandas è stato importato in PostgreSQL e organizzato in un semplice schema a stella composto da una tabella fact e tre tabelle dimensionali.

## Obiettivi della parte SQL

Gli script SQL sono stati usati per:

* creare le tabelle in PostgreSQL;
* definire chiavi primarie e chiavi esterne;
* controllare il numero di record importati in ogni tabella;
* verificare l'integrità dei join tra la tabella fact e le tabelle dimensionali;
* eseguire query business di base su vendite, profitto e sconti.

## Schema del database

Lo schema PostgreSQL include le seguenti tabelle:

* `fact_sales`
* `dim_customers`
* `dim_products`
* `dim_date`

La tabella fact contiene i dati transazionali di vendita, mentre le tabelle dimensionali contengono informazioni descrittive su clienti, prodotti e date.

## Script SQL

### `00_create_tables.sql`

Crea lo schema a stella in PostgreSQL.

Questo script definisce:

* la tabella dimensionale dei clienti;
* la tabella dimensionale dei prodotti;
* la tabella dimensionale delle date;
* la tabella fact delle vendite;
* le chiavi primarie;
* le chiavi esterne.

### `01_table_checks.sql`

Controlla il numero di righe importate in ogni tabella.

Questo controllo serve a verificare che i CSV esportati da Python siano stati caricati correttamente in PostgreSQL.

### `02_join_integrity_checks.sql`

Controlla che tutti i record presenti nella tabella fact abbiano una corrispondenza nelle relative tabelle dimensionali.

Lo script verifica le relazioni tra:

* `fact_sales.customer_id` e `dim_customers.customer_id`;
* `fact_sales.product_id` e `dim_products.product_id`;
* `fact_sales.order_date_id` e `dim_date.date_id`;
* `fact_sales.ship_date_id` e `dim_date.date_id`.

Il risultato atteso è zero record mancanti per ogni controllo.

### `03_basic_business_queries.sql`

Contiene semplici query business basate sui concetti SQL principali.

Le query analizzano:

* vendite e profitto per categoria prodotto;
* vendite e profitto per regione;
* sconto medio, vendite e profitto per segmento cliente.

## Concetti SQL utilizzati

La sezione SQL utilizza i seguenti concetti:

* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `SELECT`
* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `COUNT`
* `SUM`
* `AVG`
* `ROUND`
* `ORDER BY`
* `UNION ALL`
* `IS NULL`

## Note

L'analisi SQL è volutamente focalizzata su query chiare, semplici e spiegabili, adatte a un portfolio per una posizione da Junior Data Analyst.

Tecniche SQL più avanzate, come window functions, subquery e common table expressions, non sono state incluse in questa versione del progetto.
