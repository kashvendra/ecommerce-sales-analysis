🛒 E-Commerce Sales Analysis Project
### Tools: Excel | MySQL | Power BI

---

## 📌 Project Overview

End-to-end sales analysis project built on a real e-commerce dataset of **274 orders** worth **₹1,21,06,040 in total revenue**. The goal was to analyse sales performance across categories, regions, customer segments, and time — and present findings through dashboards and SQL queries.

**Workflow:** Raw Data → Data Cleaning → Exploratory Analysis → SQL Querying → Dashboard Visualisation → Business Insights

---

## 📁 Files in this Repository

| File | Description |
|---|---|
| `ecommerce_sales.csv` | Raw dataset — 274 orders |
| `ecommerce_sales_analysis.xlsx` | Excel workbook with pivot tables and dashboard |
| `queries.sql` | All 10 SQL queries with comments |
| `Dashboard1.png` | Excel dashboard screenshot |
| `Dashboard2.png` | Excel dashboard screenshot 2 |
| `sql_01_kpi.png` | Query 1 result — business summary |
| `sql_02_category_analysis.png` | Query 2 result — revenue by category |
| `sql_03_top_products.png` | Query 3 result — top 5 products |
| `sql_04_region_analysis.png` | Query 4 result — revenue by region |
| `sql_05_segment_analysis.png` | Query 5 result — customer segment |
| `sql_06_monthly_trend.png` | Query 6 result — monthly sales |
| `sql_07_month_over_month_growth.png` | Query 7 result — MoM growth (LAG) |
| `sql_08_top_product_per_category.png` | Query 8 result — RANK window function |

---

## 📊 Dataset Details

| Field | Details |
|---|---|
| Total Orders | 274 |
| Time Period | Jan 2024 – Dec 2024 |
| Total Revenue | ₹1,21,06,040 |
| Total Profit | ₹22,07,520 |
| Avg Order Value | ₹44,182 |
| Categories | Electronics, Home & Kitchen, Clothing |
| Regions | North, South, East, West |
| Customer Segments | Consumer, Corporate, Home Office |

---

## 🧹 Phase 1 — Excel

- Imported raw CSV and created Clean_Data sheet
- Checked for duplicates and missing values — none found
- Added calculated columns: Revenue, Profit Margin %, Month
- Built 5 Pivot Tables: Category, Region+Segment, Monthly Trend, Top Products, Customer Segment
- Created Dashboard sheet with 4 charts and 4 KPI summary numbers
- Added 2 interactive slicers — Category filter and Region filter

---

## 🗄️ Phase 2 — SQL (MySQL)

10 queries written covering:

| # | Query | Concepts Used |
|---|---|---|
| 1 | Business summary | COUNT, SUM, AVG, ROUND |
| 2 | Revenue by category | GROUP BY, ORDER BY |
| 3 | Top 5 products | GROUP BY, LIMIT |
| 4 | Revenue by region | GROUP BY, ORDER BY |
| 5 | Customer segment analysis | GROUP BY, ORDER BY |
| 6 | Monthly sales trend | SUBSTRING, GROUP BY |
| 7 | Discount impact on profit | CASE WHEN, GROUP BY |
| 8 | Revenue % share by category | Window Function — SUM OVER() |
| 9 | Month-over-month growth | Window Function — LAG() |
| 10 | Top product per category | Window Function — RANK() PARTITION BY |

### Key SQL Results

```
Total Orders:     274
Total Revenue:    ₹1,21,06,040
Total Profit:     ₹22,07,520
Avg Order Value:  ₹44,182

Category Breakdown:
Electronics    → ₹1,01,70,230  (84% of revenue)
Home & Kitchen → ₹14,29,350
Clothing       → ₹5,06,460

Region Breakdown:
West  → ₹39,55,930  (highest)
South → ₹35,81,895
North → ₹26,56,920
East  → ₹19,11,295
```

---

## 📈 Phase 3 — Power BI

*(Dashboard in progress — will be uploaded soon)*

Planned visuals:
- 4 KPI Cards — Revenue, Profit, Orders, Avg Order Value
- Line Chart — Monthly Revenue Trend
- Clustered Bar Chart — Category Revenue vs Profit
- Map Visual — Revenue by Region
- Donut Chart — Customer Segment Mix
- SalesRep Leaderboard Table
- 2 Slicers — Region and Category filters

---

## 💡 Key Business Insights

1. Electronics contributed **84% of total revenue** despite being 1 of 3 categories
2. West region generated the **highest revenue** across all 4 regions
3. Home Office segment had the **highest revenue** despite fewer customers than Consumer
4. Orders with **no discount had higher average profit** than discounted orders
5. Used **RANK() PARTITION BY** window function to find top product per category

---

## 🛠️ Tools and Skills

| Tool | Usage |
|---|---|
| Microsoft Excel | Data cleaning, Pivot Tables, Dashboard, Charts, Slicers |
| MySQL Workbench | Table creation, data import, 10 SQL queries |
| Power BI Desktop | Interactive dashboard *(coming soon)* |
| SQL Concepts | GROUP BY, CASE WHEN, LAG(), RANK(), PARTITION BY, SUM OVER() |

---

## 👤 Author

**Kashvendra Kumar**
B.Tech — Computer Science & Engineering | Techno India University (2025)
📧 kashvendra@gmail.com
🔗 [LinkedIn](https://linkedin.com/in/kashvendra-kumar-47a433222)**
