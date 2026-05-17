# 🧹 SQL Data Cleaning Project

### Customer Personality Analysis | PostgreSQL + Power BI

---

## 📌 Project Overview

An end-to-end data analysis project where I cleaned and analysed
a real-world customer dataset using PostgreSQL, then visualised
the insights in Power BI.

**Dataset:** Customer Personality Analysis — Kaggle  
**Records:** 2,240 customers  
**Tools:** PostgreSQL 18 · VS Code · SQLTools · Power BI · Git

---

## 🗂️ Project Structure

sql-data-cleaning-project/
│
├── sql/
│ ├── 01_create_staging.sql # Create raw staging table
│ ├── 02_check_import.sql # Verify data loaded correctly
│ ├── 03_data_cleaning.sql # Clean and transform data
│ └── 04_analysis.sql # Business analysis queries
│
├── screenshots/ # Query results & dashboard
├── .gitignore
└── README.md

---

## 🔧 Data Cleaning Steps

- Imported raw CSV into a TEXT-based staging table
- Fixed date format from `DD-MM-YYYY` to proper DATE type
- Removed commas from income values and cast to NUMERIC
- Standardised education and marital status to Title Case
- Handled NULL and empty income values
- Created clean `customers_clean` table with correct data types

---

## 📊 Analysis Performed

| #   | Analysis                   | Key Finding                   |
| --- | -------------------------- | ----------------------------- |
| 1   | Total Customers            | 2,240 customers               |
| 2   | Income by Education        | PhD holders earn most         |
| 3   | Top Spenders               | Top 10 customers identified   |
| 4   | Spending by Marital Status | Married customers spend most  |
| 5   | Campaign Response Rate     | Response rate calculated      |
| 6   | Complaint Analysis         | Low vs high spenders compared |
| 7   | Age Group Breakdown        | 4 age segments analysed       |
| 8   | Top Spending Categories    | Wine is #1 category           |

---

## 🚀 How to Run This Project

1. Install PostgreSQL 18 and VS Code
2. Clone this repo
3. Run SQL scripts in order (01 → 04)
4. Import the dataset from Kaggle:
   [Customer Personality Analysis](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis)
5. Open Power BI and connect to `customers_clean` table

---

## 📈 Power BI Dashboard

_Coming soon — dashboard screenshots will be added here_

---

## 👤 Author

**Thobani** | Aspiring Data Analyst  
GitHub: [@Thobani613](https://github.com/Thobani613)
