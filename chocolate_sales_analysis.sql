-- =====================================================================
-- Chocolate Sales Analysis (MySQL)
-- Tables: sales, customers, stores, products (+ calendar)
-- Author: Olayinka Oyeleye
-- =====================================================================


-- ---------------------------------------------------------------------
-- 1. OVERALL KPIs
-- ---------------------------------------------------------------------
-- Headline numbers: orders, unique customers, revenue, profit, margin
SELECT COUNT(*) AS total_orders,
       COUNT(DISTINCT customer_id) AS total_customers,
       SUM(revenue) AS total_revenue,
       SUM(profit) AS total_profit,
       (SUM(profit) / SUM(revenue)) * 100 AS profit_margin
FROM sales;


-- ---------------------------------------------------------------------
-- 2. CUSTOMER ANALYSIS
-- ---------------------------------------------------------------------
-- Loyalty members vs non-members (customer count)
SELECT loyalty_member, COUNT(*) AS total_customers
FROM customers
GROUP BY loyalty_member;

-- Revenue by loyalty membership
SELECT customers.loyalty_member, SUM(sales.revenue) AS total_revenue
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
GROUP BY customers.loyalty_member;

-- Revenue by gender
SELECT customers.gender, SUM(sales.revenue) AS total_revenue
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
GROUP BY customers.gender
ORDER BY total_revenue DESC;

-- Revenue by age group (CASE WHEN banding)
-- NOTE: uses COUNT(DISTINCT ...) so the column counts customers, not order rows
SELECT CASE
           WHEN age < 30 THEN 'under 30'
           WHEN age BETWEEN 30 AND 45 THEN '30-45'
           WHEN age BETWEEN 46 AND 60 THEN '46-60'
           ELSE 'over 60'
       END AS age_group,
       COUNT(DISTINCT customers.customer_id) AS total_customers,
       SUM(sales.revenue) AS total_revenue
FROM customers
JOIN sales ON customers.customer_id = sales.customer_id
GROUP BY age_group
ORDER BY total_revenue DESC;


-- ---------------------------------------------------------------------
-- 3. STORE AND COUNTRY ANALYSIS
-- ---------------------------------------------------------------------
-- Revenue by store
SELECT stores.store_name, SUM(sales.revenue) AS total_revenue
FROM sales
JOIN stores ON sales.store_id = stores.store_id
GROUP BY stores.store_name
ORDER BY total_revenue DESC;

-- Revenue by country
SELECT stores.country, SUM(sales.revenue) AS total_revenue
FROM sales
JOIN stores ON sales.store_id = stores.store_id
GROUP BY stores.country
ORDER BY total_revenue DESC;

-- Profit by country
SELECT stores.country, SUM(sales.profit) AS total_profit
FROM sales
JOIN stores ON sales.store_id = stores.store_id
GROUP BY stores.country
ORDER BY total_profit DESC;


-- ---------------------------------------------------------------------
-- 4. PRODUCT ANALYSIS
-- ---------------------------------------------------------------------
-- Top 5 products by revenue
SELECT products.product_name,
       SUM(sales.revenue) AS total_revenue,
       SUM(sales.profit) AS total_profit
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Bottom 5 products by revenue
SELECT products.product_name,
       SUM(sales.revenue) AS total_revenue,
       SUM(sales.profit) AS total_profit
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Revenue and profit by category
SELECT products.category,
       SUM(sales.revenue) AS total_revenue,
       SUM(sales.profit) AS total_profit
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY products.category
ORDER BY total_revenue DESC;

-- Revenue and profit by brand
SELECT products.brand,
       SUM(sales.revenue) AS total_revenue,
       SUM(sales.profit) AS total_profit
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY products.brand
ORDER BY total_revenue DESC;


-- ---------------------------------------------------------------------
-- 5. DISCOUNT ANALYSIS
-- ---------------------------------------------------------------------
-- Does discounting change average revenue and profit per order?
SELECT discount,
       AVG(sales.revenue) AS avg_revenue,
       AVG(sales.profit) AS avg_profit,
       COUNT(*) AS number_of_orders
FROM sales
GROUP BY discount
ORDER BY discount;


-- ---------------------------------------------------------------------
-- 6. TIME TREND
-- ---------------------------------------------------------------------
-- Monthly revenue (order_date is stored as text, so it is converted first)
SELECT YEAR(STR_TO_DATE(order_date, '%d/%m/%Y')) AS year,
       MONTH(STR_TO_DATE(order_date, '%d/%m/%Y')) AS month,
       SUM(revenue) AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month ASC;


-- ---------------------------------------------------------------------
-- 7. PERFORMANCE VS TARGET
-- ---------------------------------------------------------------------
-- Monthly revenue and profit against targets (2.5M revenue, 1M profit)
SELECT YEAR(STR_TO_DATE(order_date, '%d/%m/%Y')) AS year,
       MONTH(STR_TO_DATE(order_date, '%d/%m/%Y')) AS month,
       SUM(revenue) AS actual_revenue,
       2500000 AS revenue_target,
       ROUND(SUM(revenue) / 2500000 * 100, 2) AS revenue_percent,
       SUM(profit) AS actual_profit,
       1000000 AS profit_target,
       ROUND(SUM(profit) / 1000000 * 100, 2) AS profit_percent
FROM sales
GROUP BY year, month
ORDER BY year, month ASC;
