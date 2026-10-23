# Data Analytics Portfolio — Olayinka Oyeleye

MSc Accounting and Finance (Merit), University of Hull. Hands-on projects using SQL, Power BI, DAX and Excel.

## Projects

| Project | Tools | Scale | Link |
|---|---|---|---|
| Bank Customer Churn | Power BI, SQL, DAX | 10,000 customers, 26 SQL queries, 4-page dashboard | (bank_churn_analysis.sql)|
| Chocolate Sales | Power BI, SQL, Excel | 1M+ rows, 5 relational tables | (chocolate_sales_analysis.sql) |
| Healthcare Admissions | Excel, Power Query, Pivot Tables | 33,556 rows, 7 charts + KPI cards + Year slicer |[view Excel file]([Healthcare-dashboard.xlsx](https://github.com/user-attachments/files/33871472/Healthcare-dashboard.xlsx)
 |

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

**Recommendations**
- **Prioritise customers aged 46-55.** This group churns at 50.6%, more than double the 20.4% overall rate. Pilot proactive check-ins and products suited to this life stage, such as savings and retirement planning.
- **Fix complaint handling.** Customers who complained churned at close to 100%. Treat every complaint as a retention risk: resolve it quickly and follow up afterwards to confirm the customer is satisfied.
- **Investigate churn in Germany.** It has the highest churn of the three countries. Compare service, pricing and competition with France and Spain before launching a targeted retention campaign.
- **Encourage a second product.** Customers with 2 products churn least. Offer relevant second products to single-product customers.
- **Review the Diamond card offer.** Diamond holders report the lowest satisfaction. Survey them to find out whether the benefits match what they expect.
*SQL file:* `bank_churn_analysis.sql` — [view SQL](bank_churn_analysis.sql)

<img width="800" alt="Bank churn customer-overview page 1" src="https://github.com/user-attachments/assets/0954d37a-12bf-4662-a20f-e67cfff7536b" />
<img width="800" alt="bank churn customer-page2 (Customer Demographics)" src="https://github.com/user-attachments/assets/8c346292-c223-4f4d-b815-e2b511e0b3b0" />
<img width="800" alt="Bank churn customer - page 3 (customer churn analysis)" src="https://github.com/user-attachments/assets/0c111be7-ef6d-4aad-b9ca-2dcf5e2cc606" />
<img width="800" alt="Bank churn customer- page 4 product and loyalty analysis" src="https://github.com/user-attachments/assets/a92fb591-d351-411d-a864-31f545bdbbd6" />


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

<img width="800" alt="chocolate-overview" src="https://github.com/user-attachments/assets/9b1841c1-e610-4f93-b7b1-39fb39100396" />
<img width="800" alt="chocolate-overview page 2(customer   store analysis)" src="https://github.com/user-attachments/assets/fd72fec6-ba37-46bc-a98e-6f4c72a00abf" />
<img width="800" alt="chocolate sales -overview page 3 (kpi Tracking)" src="https://github.com/user-attachments/assets/72ebc4c7-e728-4f0b-bf9e-b4009026386b" />


## 3. Healthcare Admissions Dashboard (Excel)

**Question:** what patterns exist in admissions, billing and medication?

- Data cleaning in Power Query: proper-case names, duplicate check, data types, new Age Range, Month and Year columns
- 7 pivot charts, KPI cards and an interactive Year slicer

**Key findings**
- Billing and patient counts are almost evenly spread across conditions, insurers and medications, which suggests a synthetic dataset
- For Cancer patients, Elective admissions cost about £1,077 more than Urgent
- Patients aged 0-18 are only 491 of 33,556 admissions; 66+ is the largest group (9,936)
- 2020 was the busiest full year (6,875); the May 2024 dip is only because the data ends part-way through that month

**Recommendations**
- **Plan services around older patients.** Patients aged 66+ are the largest group (9,936 admissions). Pilot more community health checks for older adults to reduce avoidable admissions.
- **Review elective cancer costs.** Elective admissions cost about £1,077 more than urgent ones for cancer patients. Investigate what drives the gap before changing how these admissions are managed.
- **Focus cost reviews on admission type, not condition.** Average billing is almost identical across medical conditions (about £25.2k to £25.9k), so admission type is the more useful place to look for savings.
- **Report only complete months.** The May 2024 dip is because the data ends part-way through the month. Excluding partial months stops trends being misread as a fall in admissions.

<img width="800" alt="Health care dashboard" src="https://github.com/user-attachments/assets/06c15ba4-deb9-4a21-87d9-94374e82ffb5" />

*Dataset: Kaggle synthetic healthcare dataset. Findings are illustrative, not clinical.*

---

## Contact
olayinkaoyeleye68@gmail.com | linkedin.com/in/olayinkaoyeleye-033589273
