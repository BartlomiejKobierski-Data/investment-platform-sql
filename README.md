# investment-platform-sql
SQL portfolio project - investment platform data analysis
Investment Platform SQL — Data Analyst Portfolio Project
Overview
This project simulates a database for a financial investment platform operating on the Polish (GPW) and US (NASDAQ) stock markets. It demonstrates SQL skills relevant to data analyst roles in the finance and banking sector.
Business Context
The database models a retail investment platform where clients manage portfolios, execute buy/sell transactions, and track performance across multiple stocks and sectors.
Database Schema
The project consists of 5 interconnected tables:
Table	Description
`stocks`	Listed companies with sector and exchange information
`stock_prices`	Historical OHLCV price data (6-month period)
`clients`	Platform users segmented as Standard, Premium, or VIP
`portfolios`	Client investment portfolios
`transactions`	Buy/sell transaction history with auto-calculated value
Analytical Queries
The project includes 6 analytical queries showcasing a range of SQL techniques:
Total invested capital per client — aggregations with JOINs across multiple tables
ROI per SELL transaction — CTE (Common Table Expression) to calculate return on investment vs. average buy price
Client ranking by profit — Window functions: `RANK()` and `RANK() OVER (PARTITION BY)` for overall and segment-level rankings
Monthly transaction volume by sector — Cumulative SUM using window functions, grouped by time and sector
Top performing stocks (6-month growth) — Multi-step CTE to calculate price change percentage
Client activity analysis — Days since last transaction per client
SQL Skills Demonstrated
Complex `JOIN` operations across 5 tables
Common Table Expressions (CTEs)
Window functions (`RANK`, `SUM OVER`, `PARTITION BY`)
Aggregations and `GROUP BY`
Date arithmetic
Computed/generated columns
Data integrity via `CHECK` constraints and foreign keys
Tech Stack
Database: PostgreSQL 18
Tool: pgAdmin 4
Sample Data
10 stocks (PKO, Pekao, CD Projekt, KGHM, Allegro, LPP, PZU, Apple, Microsoft and more)
8 clients across 3 segments (Standard, Premium, VIP)
8 portfolios
26 transactions spanning December 2025 — May 2026
How to Run
Install PostgreSQL
Create a new database: `investment_platform`
Open Query Tool in pgAdmin
Run the full `investment_platform_schema.sql` script
About
This project was built as part of a data analytics learning path, targeting junior data analyst roles in Warsaw's finance and banking sector. The dataset and queries are designed to reflect real-world business scenarios in investment portfolio management.
