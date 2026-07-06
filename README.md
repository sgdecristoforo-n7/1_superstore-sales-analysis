## ----- ENGLISH -----

# Superstore Retail Sales Analysis

## Project Overview

This project analyzes retail sales and profitability using the Superstore dataset.

The goal is to prepare a clean analytical dataset, organize it into a simple star schema, import it into PostgreSQL, and run basic SQL queries to support business analysis.

The project is designed as a Junior Data Analyst portfolio project and focuses on:

* data cleaning with Python and Pandas;
* data quality checks;
* anomaly analysis;
* star schema modeling;
* PostgreSQL table creation;
* SQL validation and basic business queries;
* future Power BI dashboard development.

## Business Problem

The business context is based on a retail company that wants to better understand its sales and profitability.

The main business concern is that discounts may be increasing sales while reducing overall profitability.

The analysis focuses on questions such as:

* Which product categories generate the highest sales and profit?
* Which regions perform better or worse?
* How do customer segments differ in terms of sales, profit and average discount?
* Are there data quality issues that could affect the analysis?

## Dataset

The project uses the Superstore Sales dataset from Kaggle.

The original dataset is a flat CSV file containing sales transactions with customer, product, order, shipping, sales, quantity, discount and profit information.

## Tools Used

* Python
* Pandas
* PostgreSQL
* DBeaver
* SQL
* Power BI
* GitHub

## Repository Structure

```
1_superstore-retail-analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── docs/
│   ├── dashboard_insights.md
│   ├── data_cleaning_notes.md
│   ├── data_model.md
│   └── sql_analysis_summary.md
│
├── notebooks/
│   └── NTB_Progetto_1.ipynb
│
├── sql/
│   ├── 00_create_tables.sql
│   ├── 01_table_checks.sql
│   ├── 02_join_integrity_checks.sql
│   └── 03_sales_profit_analysis.sql
│
└── powerbi/
    └── dashboard_screenshot/
```

## Data Cleaning and Preparation

The data cleaning phase was performed using Python and Pandas.

Main activities included:

* loading the original CSV file;
* inspecting the dataset structure;
* checking data types;
* checking non-null values;
* reviewing key transactional and descriptive fields;
* managing file paths with a reusable loading function;
* converting date fields for modeling purposes;
* preparing the dataset for relational modeling.

A detailed explanation is available in:

```
docs/data_cleaning_notes.md
```

## Product ID Anomaly Analysis

A relevant data quality issue was identified in the relationship between `Product ID` and `Product Name`.

Some Product IDs were associated with more than one Product Name.

The analysis found that:

* 32 Product IDs had more than one associated Product Name;
* each anomalous Product ID had a maximum of 2 associated Product Names;
* 343 rows were linked to Product IDs with non-unique Product Names.

Two possible scenarios were explored:

* Scenario A: keep the Product Name with the highest number of occurrences;
* Scenario B: keep the Product Name with the lowest number of occurrences.

Since no reliable business rule was available to determine the correct Product Name, the final analytical dataset was created by excluding rows related to anomalous Product IDs.

This conservative choice was made to avoid introducing arbitrary assumptions into the analysis.

## Data Model

After cleaning and anomaly handling, the dataset was transformed into a simple star schema.

The model includes one fact table and three dimension tables:

* `fact_sales`
* `dim_customers`
* `dim_products`
* `dim_date`

The fact table contains transactional sales data, while the dimension tables contain descriptive information about customers, products and dates.

More details are available in:

```
docs/data_model.md
```

## PostgreSQL and SQL Analysis

The cleaned and modeled tables were exported as CSV files and imported into PostgreSQL.

The SQL section includes scripts to:

* create the PostgreSQL tables;
* define primary keys and foreign keys;
* check the number of rows imported into each table;
* verify join integrity between fact and dimension tables;

SQL scripts are available in:

```
sql/
```

More details are available in:

```
docs/sql_analysis_summary.md
```

## Power BI Dashboard

The dashboard are used to visualize:

* total sales;
* total profit;
* sales and profit by region;
* sales and profit by category;
* customer segment performance;
* discount impact;
* time-based sales and profit trends.

### Screenshots:

![Sales and Profit Overview](../powerbi/dashboard_screenshot/01_sales_and_profit_overview.jpg)

![Discount and Profitability Analysis](../powerbi/dashboard_screenshot/02_discount_and_profitability_analysis.jpg)

*The full dashboard is available here:*

[Download the dashboard](../powerbi/superstore_sales_dashboard.pbix)

*Available also as PDF:*

[Download the dashboard PDF](../powerbi/dashboard_screenshot/superstore_sales_dashboard.pdf)

## Notes

This project is intentionally focused on clear, explainable steps suitable for a Junior Data Analyst portfolio.

The SQL section avoids advanced techniques that are outside the current scope of the project and focuses on core concepts such as table creation, joins, grouping and aggregations.

## ----- ITALIANO -----

# Analisi Vendite Retail Superstore

## Panoramica del progetto

Questo progetto analizza vendite e redditività retail usando il dataset Superstore.

L'obiettivo è preparare un dataset pulito, organizzarlo in un semplice schema a stella, importarlo in PostgreSQL ed eseguire query SQL di base a supporto dell'analisi business.

Il progetto è pensato come portfolio per una posizione da Junior Data Analyst e si concentra su:

* pulizia dati con Python e Pandas;
* controlli di qualità del dato;
* analisi delle anomalie;
* modellazione a schema a stella;
* creazione tabelle in PostgreSQL;
* validazione e query SQL di base;
* successivo sviluppo dashboard in Power BI.

## Problema di business

Il contesto business riguarda un'azienda retail che vuole comprendere meglio vendite e redditività.

Il sospetto principale è che gli sconti possano aumentare il fatturato ma ridurre la marginalità complessiva.

L'analisi si concentra su domande come:

* Quali categorie prodotto generano più vendite e profitto?
* Quali regioni performano meglio o peggio?
* Come si comportano i segmenti cliente in termini di vendite, profitto e sconto medio?
* Esistono problemi di qualità del dato che possono influenzare l'analisi?

## Dataset

Il progetto utilizza il dataset Superstore Sales da Kaggle.

Il dataset originale è un file CSV piatto contenente transazioni di vendita con informazioni su clienti, prodotti, ordini, spedizioni, vendite, quantità, sconti e profitto.

## Strumenti utilizzati

* Python
* Pandas
* PostgreSQL
* DBeaver
* SQL
* Power BI
* GitHub

## Struttura del repository

```
1_superstore-retail-analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── docs/
│   ├── dashboard_insights.md
│   ├── data_cleaning_notes.md
│   ├── data_model.md
│   └── sql_analysis_summary.md
│
├── notebooks/
│   └── NTB_Progetto_1.ipynb
│
├── sql/
│   ├── 00_create_tables.sql
│   ├── 01_table_checks.sql
│   ├── 02_join_integrity_checks.sql
│   └── 03_sales_profit_analysis.sql
│
└── powerbi/
    └── dashboard_screenshot/
```

## Pulizia e preparazione dei dati

La fase di pulizia è stata eseguita con Python e Pandas.

Le attività principali hanno incluso:

* caricamento del CSV originale;
* ispezione della struttura del dataset;
* controllo dei tipi di dato;
* controllo dei valori non nulli;
* revisione dei principali campi transazionali e descrittivi;
* gestione dei percorsi tramite una funzione di caricamento riutilizzabile;
* conversione delle colonne data per la modellazione;
* preparazione del dataset per la modellazione relazionale.

La spiegazione dettagliata è disponibile in:

```
docs/data_cleaning_notes.md
```

## Analisi anomalie Product ID

È stato individuato un problema di qualità del dato nella relazione tra `Product ID` e `Product Name`.

Alcuni Product ID erano associati a più di un Product Name.

L'analisi ha mostrato che:

* 32 Product ID avevano più di un Product Name associato;
* ogni Product ID anomalo aveva al massimo 2 Product Name associati;
* 343 righe erano collegate a Product ID con Product Name non univoco.

Sono stati esplorati due scenari:

* Scenario A: mantenere il Product Name con il maggior numero di occorrenze;
* Scenario B: mantenere il Product Name con il minor numero di occorrenze.

Poiché non era disponibile una regola business affidabile per determinare il Product Name corretto, il dataset analitico finale è stato creato escludendo le righe relative ai Product ID anomali.

Questa scelta conservativa è stata adottata per evitare di introdurre assunzioni arbitrarie nell'analisi.

## Modello dati

Dopo la pulizia e la gestione delle anomalie, il dataset è stato trasformato in un semplice schema a stella.

Il modello include una tabella fact e tre tabelle dimensionali:

* `fact_sales`
* `dim_customers`
* `dim_products`
* `dim_date`

La tabella fact contiene i dati transazionali di vendita, mentre le tabelle dimensionali contengono informazioni descrittive su clienti, prodotti e date.

Maggiori dettagli sono disponibili in:

```
docs/data_model.md
```

## PostgreSQL e analisi SQL

Le tabelle pulite e modellate sono state esportate come CSV e importate in PostgreSQL.

La sezione SQL include script per:

* creare le tabelle PostgreSQL;
* definire chiavi primarie e chiavi esterne;
* controllare il numero di righe importate in ogni tabella;
* verificare l'integrità dei join tra fact table e tabelle dimensionali;

Gli script SQL sono disponibili in:

```
sql/
```

Maggiori dettagli sono disponibili in:

```
docs/sql_analysis_summary.md
```

## Dashboard Power BI

La dashboard serve a visualizzare:

* vendite totali;
* profitto totale;
* vendite e profitto per regione;
* vendite e profitto per categoria;
* performance dei segmenti cliente;
* impatto degli sconti;
* andamento temporale di vendite e profitto.

### Screenshots:

![Sales and Profit Overview](../powerbi/dashboard_screenshot/01_sales_and_profit_overview.jpg)

![Discount and Profitability Analysis](../powerbi/dashboard_screenshot/02_discount_and_profitability_analysis.jpg)

*La dashboard completa è disponibile qui:*

[Download the dashboard](../powerbi/superstore_sales_dashboard.pbix)

*Disponibile anche come PDF:*

[Download the dashboard PDF](../powerbi/dashboard_screenshot/superstore_sales_dashboard.pdf)

## Note

Il progetto è volutamente focalizzato su passaggi chiari e spiegabili, adatti a un portfolio per Junior Data Analyst.

La sezione SQL evita tecniche avanzate fuori dal perimetro attuale e si concentra su concetti fondamentali come creazione tabelle, join, raggruppamenti e aggregazioni.