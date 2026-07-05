\# Data Model



\## Overview



The cleaned Superstore dataset was transformed from a flat table into a simple star schema.



The goal of this model is to separate transactional sales data from descriptive information about customers, products and dates.



This structure makes the dataset easier to analyze using SQL and Power BI.



\## Star Schema Structure



The model includes one fact table and three dimension tables:



\* `fact\_sales`

\* `dim\_customers`

\* `dim\_products`

\* `dim\_date`



\## Fact Table



\### `fact\_sales`



The `fact\_sales` table contains transactional sales data.



Main fields:



\* `order\_id`

\* `customer\_id`

\* `product\_id`

\* `order\_date\_id`

\* `ship\_date\_id`

\* `sales`

\* `quantity`

\* `discount`

\* `profit`



This table stores the numerical measures used for analysis, such as sales, quantity, discount and profit.



\## Dimension Tables



\### `dim\_customers`



The `dim\_customers` table contains customer and geographical information.



Main fields:



\* `customer\_id`

\* `customer\_name`

\* `segment`

\* `country\_region`

\* `city`

\* `state\_province`

\* `postal\_code`

\* `region`



\### `dim\_products`



The `dim\_products` table contains product information.



Main fields:



\* `product\_id`

\* `product\_name`

\* `category`

\* `sub\_category`



\### `dim\_date`



The `dim\_date` table contains calendar information used for time-based analysis.



Main fields:



\* `date\_id`

\* `date`

\* `year`

\* `quarter`

\* `month`

\* `month\_name`

\* `day`

\* `day\_of\_week`



\## Relationships



The relationships between the tables are:



\* `fact\_sales.customer\_id` → `dim\_customers.customer\_id`

\* `fact\_sales.product\_id` → `dim\_products.product\_id`

\* `fact\_sales.order\_date\_id` → `dim\_date.date\_id`

\* `fact\_sales.ship\_date\_id` → `dim\_date.date\_id`



\## Notes



The model was designed to support basic business analysis on sales, profit, discounts, customers, products and time periods.



The same structure can also be used in Power BI to build relationships between fact and dimension tables.



\---



\# Modello Dati



\## Panoramica



Il dataset Superstore pulito è stato trasformato da una tabella piatta in un semplice schema a stella.



L'obiettivo del modello è separare i dati transazionali di vendita dalle informazioni descrittive su clienti, prodotti e date.



Questa struttura rende il dataset più facile da analizzare sia con SQL sia con Power BI.



\## Struttura dello schema a stella



Il modello include una tabella fact e tre tabelle dimensionali:



\* `fact\_sales`

\* `dim\_customers`

\* `dim\_products`

\* `dim\_date`



\## Tabella Fact



\### `fact\_sales`



La tabella `fact\_sales` contiene i dati transazionali di vendita.



Campi principali:



\* `order\_id`

\* `customer\_id`

\* `product\_id`

\* `order\_date\_id`

\* `ship\_date\_id`

\* `sales`

\* `quantity`

\* `discount`

\* `profit`



Questa tabella contiene le misure numeriche usate per l'analisi, come vendite, quantità, sconto e profitto.



\## Tabelle Dimensionali



\### `dim\_customers`



La tabella `dim\_customers` contiene informazioni sui clienti e sulla localizzazione geografica.



Campi principali:



\* `customer\_id`

\* `customer\_name`

\* `segment`

\* `country\_region`

\* `city`

\* `state\_province`

\* `postal\_code`

\* `region`



\### `dim\_products`



La tabella `dim\_products` contiene informazioni sui prodotti.



Campi principali:



\* `product\_id`

\* `product\_name`

\* `category`

\* `sub\_category`



\### `dim\_date`



La tabella `dim\_date` contiene informazioni di calendario utili per le analisi temporali.



Campi principali:



\* `date\_id`

\* `date`

\* `year`

\* `quarter`

\* `month`

\* `month\_name`

\* `day`

\* `day\_of\_week`



\## Relazioni



Le relazioni tra le tabelle sono:



\* `fact\_sales.customer\_id` → `dim\_customers.customer\_id`

\* `fact\_sales.product\_id` → `dim\_products.product\_id`

\* `fact\_sales.order\_date\_id` → `dim\_date.date\_id`

\* `fact\_sales.ship\_date\_id` → `dim\_date.date\_id`



\## Note



Il modello è stato progettato per supportare analisi business di base su vendite, profitto, sconti, clienti, prodotti e periodi temporali.



La stessa struttura può essere usata anche in Power BI per costruire le relazioni tra tabella fact e tabelle dimensionali.



