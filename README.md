# Data Analytics Portfolio — Olayinka Oyeleye

MSc Accounting and Finance (Merit), University of Hull. Hands-on projects using SQL, Power BI, DAX and Excel.

## Projects

| Project | Tools | Scale | Link |
|---|---|---|---|
| Bank Customer Churn | Power BI, SQL, DAX | 10,000 customers, 26 SQL queries, 4-page dashboard |  |
| Chocolate Sales | Power BI, SQL, Excel | 1M+ rows, 5 relational tables | [add link] |
| Healthcare Admissions | Excel, Power Query, Pivot Tables | 33,556 rows, 7 charts + KPI cards + Year slicer | [add link] |

---

## 1. Bank Customer Churn (Power BI, SQL, DAX)

**Question:** which customers are leaving, and why?

- 4-page dashboard: Executive Overview, Customer Demographics, Customer Churn Analysis, Product and Loyalty Analysis
- 26 SQL queries (SELECT, GROUP BY, CASE WHEN, aggregates)
- Power Query cleaning; churn rate = churned / total customers

**Key findings**
- The 46-55 age group has the highest churn
- Germany has the highest churn by geography
- Diamond card holders have the lowest satisfaction
- Customers who complained churned at close to 100%
- Customers with 2 products churn least

*SQL file:* `bank_churn_analysis.sql` — [add]

---

## 2. Chocolate Sales (Power BI, SQL, Excel)

**Question:** how is the business performing against target, and where are the opportunities?

- Five relational tables, 1M+ rows
- 16 SQL queries across KPIs, customers, stores, products, discounts, trends and targets (`chocolate_sales_analysis.sql`)
- KPI tracking against target

**Key findings**
- Revenue of 25.49M against a 30M target (-13.69% variance)
- Canada is the top market (5.1M); Germany is lowest (3.1M)
- Airport stores contribute the most revenue by store type (29.87%)
- February dips after festive spending and the return to school
- Praline is the highest-profit category; Dark Chocolate is the highest-revenue product
- Loyalty members spend no more than non-members: about 508.80 per customer vs 510.65 (25,104 members, 24,896 non-members)

**Recommendations**
- **Close the gap to target.** Revenue was 25.49M against a 30M target (-13.69%), a shortfall of 4.51M. Growth plans should focus on closing that gap.
- **Focus marketing on weaker markets.** Germany is the lowest market (3.1M) compared with Canada (5.1M). Pilot targeted campaigns in lower-performing countries and measure the results before expanding.
- **Plan campaigns around the February dip.** Revenue falls in February after festive spending, so a promotion in that month could help.
- **Review the loyalty programme.** Members spend about the same per customer as non-members (508.80 vs 510.65), so the programme does not appear to be driving extra spend. Review what members get and whether it needs to change.

---

## 3. Healthcare Admissions Dashboard (Excel)

**Question:** what patterns exist in admissions, billing and medication?

- Data cleaning in Power Query: proper-case names, duplicate check, data types, new Age Range, Month and Year columns
- 7 pivot charts, KPI cards and an interactive Year slicer

**Key findings**
- Billing and patient counts are almost evenly spread across conditions, insurers and medications, which suggests a synthetic dataset
- For Cancer patients, Elective admissions cost about £1,077 more than Urgent
- Patients aged 0-18 are only 491 of 33,556 admissions; 66+ is the largest group (9,936)
- 2020 was the busiest full year (6,875); the May 2024 dip is only because the data ends part-way through that month

*Dataset: Kaggle synthetic healthcare dataset. Findings are illustrative, not clinical.*

---

## Contact
olayinkaoyeleye68@gmail.com | linkedin.com/in/olayinkaoyeleye-033589273
