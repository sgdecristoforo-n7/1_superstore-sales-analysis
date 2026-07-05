# Data Cleaning Notes

## Overview

This document summarizes the main data cleaning, data quality checks and modeling steps performed on the Superstore dataset using Python and Pandas.

The goal of this phase was to prepare a clean and consistent dataset for SQL analysis, PostgreSQL import and Power BI reporting.

## Initial Dataset Review

The original Superstore CSV file was loaded using Python and Pandas.

The initial review included:

* checking the dataset structure;
* checking column names;
* checking data types;
* checking non-null values;
* reviewing the main transactional and descriptive fields.

The dataset contained sales transactions with customer, product, order, shipping, sales, quantity, discount and profit information.

## Path Management

A custom function was created to load CSV files using dynamic relative paths.

This made the notebook easier to move within the project repository without breaking the file loading process.

## Data Type Checks and Preparation

The dataset was inspected to identify columns requiring type correction before analysis.

Date columns were later converted to datetime format to support the creation of the date dimension table.

The `Profit` column required attention because it was initially read as an object column.

## Product ID Anomaly Analysis

A key data quality issue was found in the relationship between `Product ID` and `Product Name`.

Some `Product ID` values were associated with more than one `Product Name`.

The analysis showed that:

* 32 Product IDs had more than one associated Product Name;
* each anomalous Product ID had a maximum of 2 associated Product Names;
* 343 rows were linked to Product IDs with non-unique product names.

This issue was important because different product names linked to the same Product ID also showed different sales and profit values.

## Scenario Analysis for Product ID Anomalies

Since there was no reliable external source or business rule to determine the correct Product Name for each anomalous Product ID, two scenarios were explored:

### Scenario A

Keep the Product Name with the highest number of occurrences for each anomalous Product ID.

In case of ties, sales and profit were used as secondary sorting criteria.

### Scenario B

Keep the Product Name with the lowest number of occurrences for each anomalous Product ID.

In case of ties, sales and profit were used as secondary sorting criteria.

## Final Decision on Product ID Anomalies

The comparison between scenarios did not identify a fully reliable rule for selecting the correct Product Name.

For this reason, the final analytical dataset was created by excluding rows related to anomalous Product IDs.

This conservative approach was chosen to avoid introducing arbitrary assumptions into the final analysis.

## Final Dataset Comparison

Three possible datasets were compared:

### Dataset without anomalous Product IDs

* rows: 9,848
* total sales: 2,227,885.25
* total profit: 278,940.70

### Scenario A

* rows: 10,062
* rows added compared to the anomaly-free dataset: 214
* total sales: 2,295,721.19
* total profit: 286,162.88

### Scenario B

* rows: 9,977
* rows added compared to the anomaly-free dataset: 129
* total sales: 2,257,983.93
* total profit: 285,047.35

The final modeling phase was based on the dataset without anomalous Product IDs.

## Star Schema Preparation

After the anomaly handling phase, the cleaned dataset was transformed into a simple star schema.

The following tables were created:

* `DIM_Customers`
* `DIM_Products`
* `DIM_Date`
* `FACT_Sales`

## Dimension Tables

### `DIM_Customers`

The customer dimension was created by selecting customer and geographical fields and removing duplicate `Customer ID` values.

Main fields:

* `Customer ID`
* `Customer Name`
* `Segment`
* `Country/Region`
* `City`
* `State/Province`
* `Postal Code`
* `Region`

### `DIM_Products`

The product dimension was created by selecting product fields and removing duplicate `Product ID` values.

Main fields:

* `Product ID`
* `Product Name`
* `Category`
* `Sub-Category`

### `DIM_Date`

The date dimension was created using all dates from both `Order Date` and `Ship Date`.

The two date columns were combined, duplicates were removed, and a calendar table was created.

The `date_id` field was generated using the `YYYYMMDD` format.

Main fields:

* `date_id`
* `date`
* `year`
* `quarter`
* `month`
* `month_name`
* `day`
* `day_of_week`

## Fact Table

### `FACT_Sales`

The fact table was created from the final cleaned dataset.

It contains transaction-level sales data and keys used to connect to the dimension tables.

Main fields:

* `Order ID`
* `Customer ID`
* `Product ID`
* `order_date_id`
* `ship_date_id`
* `Sales`
* `Quantity`
* `Discount`
* `Profit`

## Column Renaming for PostgreSQL

Before export, the final table columns were renamed using lowercase names and underscores.

This was done to make the exported CSV files easier to import and query in PostgreSQL.

Examples:

* `Customer ID` → `customer_id`
* `Product Name` → `product_name`
* `Order Date` reference key → `order_date_id`
* `Ship Date` reference key → `ship_date_id`

## CSV Export

The final tables were exported as CSV files:

* `DIM_Customers.csv`
* `DIM_Products.csv`
* `DIM_Date.csv`
* `FACT_Sales.csv`
* `Normalized.csv`

These files were then used for the PostgreSQL import phase.

## Key Integrity Checks

After creating the fact and dimension tables, key integrity checks were performed in Python.

The goal was to verify that every key in the fact table had a matching key in the related dimension table.

The checks returned empty sets, meaning that the fact table keys had corresponding records in the dimension tables.

## Notes

The data cleaning phase focused not only on preparing the dataset, but also on documenting the reasoning behind relevant data quality decisions.

The main conservative choice was to exclude rows related to anomalous Product IDs from the final analytical dataset, instead of choosing a Product Name based on an arbitrary rule.

---

# Note sulla Pulizia dei Dati

## Panoramica

Questo documento riassume i principali passaggi di pulizia, controllo qualità e modellazione eseguiti sul dataset Superstore usando Python e Pandas.

L'obiettivo di questa fase era preparare un dataset pulito e coerente per l'analisi SQL, l'importazione in PostgreSQL e la reportistica in Power BI.

## Revisione iniziale del dataset

Il file CSV originale Superstore è stato caricato usando Python e Pandas.

La revisione iniziale ha incluso:

* controllo della struttura del dataset;
* controllo dei nomi delle colonne;
* controllo dei tipi di dato;
* controllo dei valori non nulli;
* revisione dei principali campi transazionali e descrittivi.

Il dataset conteneva transazioni di vendita con informazioni su clienti, prodotti, ordini, spedizioni, vendite, quantità, sconti e profitto.

## Gestione dei percorsi

È stata creata una funzione personalizzata per caricare file CSV usando percorsi relativi dinamici.

Questo rende il notebook più facile da spostare all'interno del repository senza rompere il caricamento dei file.

## Controllo e preparazione dei tipi di dato

Il dataset è stato ispezionato per individuare colonne che richiedevano correzioni del tipo di dato prima dell'analisi.

Le colonne data sono state successivamente convertite in formato datetime per supportare la creazione della tabella dimensionale delle date.

La colonna `Profit` ha richiesto attenzione perché inizialmente risultava letta come colonna di tipo object.

## Analisi delle anomalie sui Product ID

Durante i controlli di qualità è emerso un problema nella relazione tra `Product ID` e `Product Name`.

Alcuni valori di `Product ID` erano associati a più di un `Product Name`.

L'analisi ha evidenziato che:

* 32 Product ID avevano più di un Product Name associato;
* ogni Product ID anomalo aveva al massimo 2 Product Name associati;
* 343 righe erano collegate a Product ID con Product Name non univoco.

Questo problema era rilevante perché Product Name diversi associati allo stesso Product ID mostravano anche valori diversi di vendite e profitto.

## Analisi degli scenari sulle anomalie Product ID

Poiché non era disponibile una fonte esterna o una regola business affidabile per determinare il Product Name corretto per ogni Product ID anomalo, sono stati esplorati due scenari.

### Scenario A

Mantenere il Product Name con il maggior numero di occorrenze per ogni Product ID anomalo.

In caso di parità, vendite e profitto sono stati usati come criteri secondari di ordinamento.

### Scenario B

Mantenere il Product Name con il minor numero di occorrenze per ogni Product ID anomalo.

In caso di parità, vendite e profitto sono stati usati come criteri secondari di ordinamento.

## Decisione finale sulle anomalie Product ID

Il confronto tra gli scenari non ha permesso di individuare una regola pienamente affidabile per scegliere il Product Name corretto.

Per questo motivo, il dataset analitico finale è stato creato escludendo le righe relative ai Product ID anomali.

Questa scelta conservativa è stata adottata per evitare di introdurre assunzioni arbitrarie nell'analisi finale.

## Confronto tra dataset finali

Sono state confrontate tre possibili versioni del dataset.

### Dataset senza Product ID anomali

* righe: 9.848
* sales totali: 2.227.885,25
* profit totale: 278.940,70

### Scenario A

* righe: 10.062
* righe aggiunte rispetto al dataset senza anomalie: 214
* sales totali: 2.295.721,19
* profit totale: 286.162,88

### Scenario B

* righe: 9.977
* righe aggiunte rispetto al dataset senza anomalie: 129
* sales totali: 2.257.983,93
* profit totale: 285.047,35

La fase finale di modellazione è stata basata sul dataset senza Product ID anomali.

## Preparazione dello schema a stella

Dopo la gestione delle anomalie, il dataset pulito è stato trasformato in un semplice schema a stella.

Sono state create le seguenti tabelle:

* `DIM_Customers`
* `DIM_Products`
* `DIM_Date`
* `FACT_Sales`

## Tabelle dimensionali

### `DIM_Customers`

La dimensione clienti è stata creata selezionando i campi cliente e geografici e rimuovendo i duplicati sulla base di `Customer ID`.

Campi principali:

* `Customer ID`
* `Customer Name`
* `Segment`
* `Country/Region`
* `City`
* `State/Province`
* `Postal Code`
* `Region`

### `DIM_Products`

La dimensione prodotti è stata creata selezionando i campi prodotto e rimuovendo i duplicati sulla base di `Product ID`.

Campi principali:

* `Product ID`
* `Product Name`
* `Category`
* `Sub-Category`

### `DIM_Date`

La dimensione date è stata creata usando tutte le date presenti sia in `Order Date` sia in `Ship Date`.

Le due colonne data sono state combinate, i duplicati sono stati rimossi ed è stata creata una tabella calendario.

Il campo `date_id` è stato generato usando il formato `YYYYMMDD`.

Campi principali:

* `date_id`
* `date`
* `year`
* `quarter`
* `month`
* `month_name`
* `day`
* `day_of_week`

## Tabella fact

### `FACT_Sales`

La tabella fact è stata creata a partire dal dataset finale pulito.

Contiene i dati di vendita a livello transazionale e le chiavi usate per collegarsi alle tabelle dimensionali.

Campi principali:

* `Order ID`
* `Customer ID`
* `Product ID`
* `order_date_id`
* `ship_date_id`
* `Sales`
* `Quantity`
* `Discount`
* `Profit`

## Rinomina colonne per PostgreSQL

Prima dell'esportazione, le colonne delle tabelle finali sono state rinominate usando nomi in minuscolo e underscore.

Questa scelta rende i CSV esportati più semplici da importare e interrogare in PostgreSQL.

Esempi:

* `Customer ID` → `customer_id`
* `Product Name` → `product_name`
* chiave di riferimento da `Order Date` → `order_date_id`
* chiave di riferimento da `Ship Date` → `ship_date_id`

## Esportazione CSV

Le tabelle finali sono state esportate come file CSV:

* `DIM_Customers.csv`
* `DIM_Products.csv`
* `DIM_Date.csv`
* `FACT_Sales.csv`
* `Normalized.csv`

Questi file sono stati poi usati per la fase di importazione in PostgreSQL.

## Controlli di integrità delle chiavi

Dopo la creazione delle tabelle fact e dimensionali, sono stati eseguiti controlli di integrità delle chiavi in Python.

L'obiettivo era verificare che ogni chiave presente nella tabella fact avesse una corrispondenza nella relativa tabella dimensionale.

I controlli hanno restituito set vuoti, quindi le chiavi della tabella fact avevano corrispondenze nelle tabelle dimensionali.

## Note

La fase di pulizia dei dati non si è limitata alla preparazione del dataset, ma ha documentato anche il ragionamento dietro le decisioni rilevanti sulla qualità del dato.

La principale scelta conservativa è stata escludere dal dataset analitico finale le righe relative ai Product ID anomali, invece di scegliere un Product Name sulla base di una regola arbitraria.
