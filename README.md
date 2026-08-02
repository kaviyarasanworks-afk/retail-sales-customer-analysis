# retail-sales-customer-analysis

## Retail Sales & Customer Analysis (Python + SQL + Power BI)

End-to-end data analytics project on the Online Retail II dataset — from raw data cleaning in Python, through KPI analysis in MySQL, to an interactive Power BI dashboard.

### Project Overview

This project simulates a real-world data analyst workflow: taking a messy raw transactional dataset and turning it into business-ready insights.

**Pipeline:** Kaggle (raw data) → Python / Jupyter Notebook (cleaning + EDA) → MySQL (business KPI queries) → Power BI (dashboard)

### Business questions answered:

* What are total revenue, orders, quantity sold, and average order value (AOV)?
* How does revenue trend by month, quarter, and year?
* Which countries generate the most revenue?
* Who are the top customers by revenue?
* Which products are the best and worst sellers?
* How many transactions are cancellations/returns, and what's their impact?

### Dataset

Source: Online Retail II — UCI/Kaggle

~1M+ transaction records from a UK-based online retailer (Dec 2009 – Dec 2011)

Raw file: Raw_Data_online_retail_II.csv (not included in this repo due to size — see data/README.md for the download link)

### Repository Structure

```
retail-sales-customer-analysis/
├── README.md
├── data/
│   └── README.md                      # Dataset source & download instructions
├── notebooks/
│   └── 01_data_cleaning_eda.ipynb     # Cleaning, feature engineering, EDA, MySQL export
├── sql/
│   └── business_kpi_queries.sql       # KPI, country/year/month, top products & customers
└── dashboard/
    ├── retail_dashboard.pbix          # Power BI file
    └── dashboard_screenshot.png       # Static preview of the dashboard
```

### Data Cleaning & Feature Engineering (Python)

* Removed duplicate rows and nulls
* Converted InvoiceDate to datetime and corrected column data types
* Investigated negative quantities and zero-price records (returns/adjustments)
* Flagged cancelled transactions (Invoice numbers starting with "C")
* Engineered new columns: Revenue, Year, Month, Month_Num, Day, Day_Num, Quarter, TransactionType
* Loaded the cleaned DataFrame into MySQL using SQLAlchemy

### SQL Analysis

#### Key queries in [sql/business_kpi_queries.sql](sql/business_kpi_queries.sql) cover:

* Sales vs. cancellation summary
* Revenue and orders by country, year, month, and quarter
* Average Order Value (AOV)
* Top 10 / Bottom 10 products by quantity
* Top 10 customers by revenue

### Dashboard Highlights

<img width="1453" height="841" alt="dashboard_screenshot_1" src="https://github.com/user-attachments/assets/6d811d1b-dacd-4ca4-9de6-5247f5670563" />




|     Metric          |  Value  |
|---------------------|---------|
| Total Customers     | 6K      |
| Total Orders        | 37K     |
| Total Quantity Sold |	11M     |
| Total Revenue       |	₹17.37M |
| Average Order Value |	₹469.91 |

### How to Reproduce
1. Download the dataset [see data/README.md](data/README.md) and place it in a local data/ folder.
2. Run [notebooks/01_data_cleaning_eda.ipynb](notebooks/01_data_cleaning_eda.ipynb) to clean the data and load it into MySQL.
3. Run the queries in [sql/business_kpi_queries.sql](sql/business_kpi_queries.sql) against the online_retail_db database.
4. Open [dashboard](dashboard/dashboard_screenshot.png) in Power BI Desktop and refresh the data connection.

### Key Insights

* The UK is by far the largest market by revenue, followed by EIRE, the Netherlands, and Germany.
* Revenue peaks in November, consistent with holiday-season buying, with Average Order Value dipping mid-year.
* A small group of top customers and products account for a disproportionate share of total revenue.

### Author
[Kaviyarasan] Data Analyst | [Portfolio/GitHub URL]
