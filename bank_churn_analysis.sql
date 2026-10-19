-- =====================================================================
-- Bank Customer Churn Analysis (MySQL)
-- Table: customer_churn_records
-- Author: Olayinka Oyeleye
-- =====================================================================


-- ---------------------------------------------------------------------
-- 1. OVERALL KPIs
-- ---------------------------------------------------------------------
-- Total customers, customers churned and overall churn rate
SELECT COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records;

-- Churned vs retained customers
SELECT CASE
           WHEN Exited = 1 THEN 'churned'
           WHEN Exited = 0 THEN 'retained'
       END AS churn_status,
       COUNT(CustomerId) AS customer_count
FROM customer_churn_records
GROUP BY churn_status
ORDER BY customer_count DESC;

-- Average credit score
SELECT ROUND(AVG(CreditScore), 0) AS avg_credit_score
FROM customer_churn_records;

-- Average satisfaction score
SELECT ROUND(AVG(`Satisfaction Score`), 2) AS avg_satisfaction_score
FROM customer_churn_records;

-- Average age
SELECT ROUND(AVG(Age), 2) AS avg_age
FROM customer_churn_records;

-- Average balance
SELECT ROUND(AVG(Balance), 2) AS avg_balance
FROM customer_churn_records;

-- Average estimated salary
SELECT ROUND(AVG(EstimatedSalary), 2) AS avg_estimated_salary
FROM customer_churn_records;


-- ---------------------------------------------------------------------
-- 2. DEMOGRAPHICS
-- ---------------------------------------------------------------------
-- Customers by country
SELECT Geography, COUNT(*) AS total_customers
FROM customer_churn_records
GROUP BY Geography
ORDER BY total_customers DESC;

-- Churn rate by country
SELECT Geography,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY Geography
ORDER BY churn_rate_percent DESC;

-- Churn rate by gender
SELECT Gender,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY Gender;

-- Churn rate by age group (CASE WHEN banding)
SELECT CASE
           WHEN Age <= 25 THEN '18-25'
           WHEN Age <= 35 THEN '26-35'
           WHEN Age <= 45 THEN '36-45'
           WHEN Age <= 55 THEN '46-55'
           ELSE '55+'
       END AS age_group,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY age_group
ORDER BY churn_rate_percent DESC;


-- ---------------------------------------------------------------------
-- 3. ACCOUNT AND RELATIONSHIP
-- ---------------------------------------------------------------------
-- Churn rate by tenure (years with the bank)
SELECT Tenure,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY Tenure
ORDER BY Tenure ASC;

-- Churn rate by number of products held
SELECT NumOfProducts,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY NumOfProducts
ORDER BY churn_rate_percent DESC;

-- Churn rate by active membership
SELECT IsActiveMember,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY IsActiveMember
ORDER BY churn_rate_percent DESC;

-- Churn rate by credit card ownership
SELECT HasCrCard,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY HasCrCard
ORDER BY churn_rate_percent DESC;


-- ---------------------------------------------------------------------
-- 4. BALANCE ANALYSIS
-- ---------------------------------------------------------------------
-- Average balance: churned vs retained
SELECT CASE
           WHEN Exited = 1 THEN 'churned'
           WHEN Exited = 0 THEN 'retained'
       END AS churn_status,
       ROUND(AVG(Balance), 2) AS avg_balance
FROM customer_churn_records
GROUP BY churn_status
ORDER BY avg_balance DESC;

-- Average balance by gender
SELECT Gender,
       ROUND(AVG(Balance), 2) AS avg_balance
FROM customer_churn_records
GROUP BY Gender
ORDER BY avg_balance DESC;


-- ---------------------------------------------------------------------
-- 5. CARD TYPE AND LOYALTY POINTS
-- ---------------------------------------------------------------------
-- Total loyalty points earned
SELECT SUM(`Point Earned`) AS total_points_earned
FROM customer_churn_records;

-- Average loyalty points earned
SELECT ROUND(AVG(`Point Earned`), 2) AS avg_points_earned
FROM customer_churn_records;

-- Customers by card type
SELECT `Card Type`, COUNT(*) AS total_customers
FROM customer_churn_records
GROUP BY `Card Type`
ORDER BY total_customers DESC;

-- Churn rate by card type
SELECT `Card Type`,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY `Card Type`
ORDER BY churn_rate_percent DESC;

-- Average points earned by card type
SELECT `Card Type`,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(AVG(`Point Earned`), 2) AS avg_points_earned
FROM customer_churn_records
GROUP BY `Card Type`
ORDER BY avg_points_earned DESC;

-- Average satisfaction score by card type
SELECT `Card Type`,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(AVG(`Satisfaction Score`), 2) AS avg_satisfaction_score
FROM customer_churn_records
GROUP BY `Card Type`
ORDER BY avg_satisfaction_score DESC;


-- ---------------------------------------------------------------------
-- 6. COMPLAINTS
-- ---------------------------------------------------------------------
-- Total complaints
SELECT SUM(Complain) AS total_complaints
FROM customer_churn_records;

-- Complaint rate across all customers
SELECT COUNT(*) AS total_customers,
       SUM(Complain) AS total_complaints,
       ROUND(SUM(Complain) * 100 / COUNT(*), 2) AS complaint_rate_percent
FROM customer_churn_records;

-- Churn rate: customers who complained vs those who did not
SELECT Complain,
       COUNT(*) AS total_customers,
       SUM(Exited) AS total_churned,
       ROUND(SUM(Exited) * 100 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn_records
GROUP BY Complain
ORDER BY churn_rate_percent DESC;
