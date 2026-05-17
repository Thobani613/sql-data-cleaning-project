-- ================================================
-- 1. Total Customers
-- ================================================
SELECT COUNT(*) AS total_customers
FROM customers_clean;

-- ================================================
-- 2. Average Income by Education Level
-- ================================================
SELECT
    education,
    ROUND(AVG(income), 2) AS avg_income,
    COUNT(*)              AS customer_count
FROM customers_clean
WHERE income IS NOT NULL
GROUP BY education
ORDER BY avg_income DESC;

-- ================================================
-- 3. Total Spending per Customer
-- ================================================
SELECT
    customer_id,
    education,
    marital_status,
    income,
    spend_wine + spend_fruits + spend_meat +
    spend_fish + spend_sweets + spend_gold   AS total_spend
FROM customers_clean
ORDER BY total_spend DESC
LIMIT 10;

-- ================================================
-- 4. Average Spending by Marital Status
-- ================================================
SELECT
    marital_status,
    ROUND(AVG(spend_wine + spend_fruits + spend_meat +
    spend_fish + spend_sweets + spend_gold), 2) AS avg_total_spend,
    COUNT(*) AS customer_count
FROM customers_clean
GROUP BY marital_status
ORDER BY avg_total_spend DESC;

-- ================================================
-- 5. Campaign Response Rate
-- ================================================
SELECT
    accepted_last_campaign,
    COUNT(*)                                    AS customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage
FROM customers_clean
GROUP BY accepted_last_campaign;

-- ================================================
-- 6. Customers with Complaints
-- ================================================
SELECT
    has_complaint,
    COUNT(*)                                    AS customer_count,
    ROUND(AVG(income), 2)                       AS avg_income,
    ROUND(AVG(spend_wine + spend_fruits +
    spend_meat + spend_fish +
    spend_sweets + spend_gold), 2)              AS avg_spend
FROM customers_clean
GROUP BY has_complaint;

-- ================================================
-- 7. Age Groups
-- ================================================
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 45 THEN '30 - 45'
        WHEN age BETWEEN 46 AND 60 THEN '46 - 60'
        ELSE 'Over 60'
    END                                         AS age_group,
    COUNT(*)                                    AS customer_count,
    ROUND(AVG(income), 2)                       AS avg_income,
    ROUND(AVG(spend_wine + spend_fruits +
    spend_meat + spend_fish +
    spend_sweets + spend_gold), 2)              AS avg_spend
FROM customers_clean
GROUP BY age_group
ORDER BY MIN(age);

-- ================================================
-- 8. Top Spending Categories Overall
-- ================================================
SELECT
    'Wine'    AS category, SUM(spend_wine)    AS total_spend FROM customers_clean UNION ALL
SELECT
    'Fruits'  AS category, SUM(spend_fruits)  AS total_spend FROM customers_clean UNION ALL
SELECT
    'Meat'    AS category, SUM(spend_meat)    AS total_spend FROM customers_clean UNION ALL
SELECT
    'Fish'    AS category, SUM(spend_fish)    AS total_spend FROM customers_clean UNION ALL
SELECT
    'Sweets'  AS category, SUM(spend_sweets)  AS total_spend FROM customers_clean UNION ALL
SELECT
    'Gold'    AS category, SUM(spend_gold)    AS total_spend FROM customers_clean
ORDER BY total_spend DESC;