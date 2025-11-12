# E-Commerce Sales Analysis in SQL

This project is a comprehensive analysis of an e-commerce dataset, designed to uncover sales patterns, product performance, and customer behavior. The entire project, from data cleaning to advanced cohort analysis, is performed exclusively using SQL (SQLite) to demonstrate deep mastery of the language for data analytics.

---

## Key Skills Demonstrated

This analysis was built to showcase more than just simple `SELECT` statements. The following advanced SQL concepts are used extensively:

Data Cleaning & Transformation: Using `ALTER TABLE` to add new columns, `UPDATE` with `strftime()` to cleanse and standardize non-standard date formats, and `CASE` statements for data validation.

Common Table Expressions (CTEs): Using the `WITH` clause to create complex, multi-step queries that are highly readable and maintainable (see `04_time_series_analysis.sql` and `05_customer_cohort_analysis.sql`).

  Window Functions:
  `ROW_NUMBER()` and `PARTITION BY` to rank products *within* each category.
  `LAG()` to calculate Month-over-Month revenue growth.

Advanced Aggregation Using `GROUP BY`, `SUM`, `COUNT(DISTINCT)`, and `AVG` to derive key business metrics.

Pivot/Conditional Aggregation: Using `SUM(CASE WHEN ...)` to pivot data and show revenue by payment method in a single row.

Database Management: Creating a database schema, importing data from a CSV, and managing data types.

---

## Tools & Technology

* Database: SQLite
* IDE: Visual Studio Code
* VS Code Extension: [SQLite](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)
* Data Source: `ecommerce_dataset_updated.csv` (From Kaggle.com)

---

## Project Structure

This repository is organized to be read like a report, with each numbered SQL file building upon the last.

`ecommerce_dataset_updated.csv`: The raw source data.

`ecommerce.db`: The SQLite database file containing the cleaned and imported data.

`01_data_cleaning.sql`: SQL script for data validation, converting date/time text into a `DATETIME` format, and checking for NULLs.

`02_kpi_overview.sql`: Calculates high-level Key Performance Indicators (KPIs) such as total revenue, AOV, and revenue by payment method.

`03_product_analysis.sql`: A deep dive into product performance. Includes a query to find the top 3 products within each category using window functions.

`04_time_series_analysis.sql`: Demonstrates time-series analysis by calculating Month-over-Month (MoM) revenue growth using CTEs and the `LAG()` function.

`05_customer_cohort_analysis.sql`: The most advanced analysis in the project. This script builds a retention cohort analysis from scratch to track what percentage of new users from a given month return for repeat purchases in subsequent months.

---

## Key Analyses & Findings

This project answers several critical business questions:

1.  KPI Overview: What are the baseline metrics for total revenue, average order value (AOV), and total customers? Which payment method drives the most revenue?
2.  Product Performance: What are the all-time best-selling products? More importantly, what are the top 3 performing products *within* each category (e.g., 'Electronics', 'Apparel')?
3.  Sales Trends: Is revenue growing or shrinking? This is answered by the Month-over-Month revenue growth percentage calculation.
4.  Customer Retention: Are customers coming back? The cohort analysis provides a detailed grid showing user retention over time, a key indicator of product-market fit and customer loyalty.

---

## How to Run This Project

You can easily explore this analysis on your own machine.

Prerequisites:
* You must have [Visual Studio Code](https://code.visualstudio.com/) installed.
* You must install the [SQLite](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite) extension from the VS Code marketplace.

**Instructions:**

1.  Clone or download this repository.
2.  Open the entire project folder in VS Code.
3.  In the VS Code sidebar, right-click the `ecommerce.db` file and select "Open Database".
4.  A new "SQLITE EXPLORER" tab will open in your sidebar. You can use this to browse the tables and schema.
5.  Open any of the analysis files (e.g., `04_time_series_analysis.sql`).
6.  Highlight any query (or the entire file's text).
7.  Right-click and select "Run Query".
8.  The results will appear in a new tab.

---