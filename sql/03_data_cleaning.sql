-- ================================================
-- STEP 1: Preview the raw data
-- ================================================

SELECT * FROM customer_staging LIMIT 10;

-- ================================================
-- STEP 2: Check for NULL / empty values
-- ================================================
SELECT
    COUNT(*) FILTER (WHERE id = '' OR id IS NULL)             AS missing_id,
    COUNT(*) FILTER (WHERE income = '' OR income IS NULL)     AS missing_income,
    COUNT(*) FILTER (WHERE education = '' OR education IS NULL) AS missing_education,
    COUNT(*) FILTER (WHERE marital_status = '' OR marital_status IS NULL) AS missing_marital
FROM customer_staging;

-- ================================================
-- STEP 3: Create the clean table
-- ================================================
CREATE TABLE customers_clean AS
SELECT
    CAST(id AS INT)                                        AS customer_id,
    CAST(year_birth AS INT)                                AS birth_year,
    2024 - CAST(year_birth AS INT)                         AS age,
    INITCAP(LOWER(education))                              AS education,
    INITCAP(LOWER(marital_status))                         AS marital_status,
    CASE
        WHEN income = '' OR income IS NULL THEN NULL
        ELSE CAST(REPLACE(income, ',', '') AS NUMERIC)
    END                                                    AS income,
    CAST(kidhome AS INT)                                   AS kids_at_home,
    CAST(teenhome AS INT)                                  AS teens_at_home,
   TO_DATE(dt_customer, 'DD-MM-YYYY')                      AS join_date,
    CAST(recency AS INT)                                   AS days_since_last_purchase,
    CAST(mnt_wines AS INT)                                 AS spend_wine,
    CAST(mnt_fruits AS INT)                                AS spend_fruits,
    CAST(mnt_meat_products AS INT)                         AS spend_meat,
    CAST(mnt_fish_products AS INT)                         AS spend_fish,
    CAST(mnt_sweet_products AS INT)                        AS spend_sweets,
    CAST(mnt_gold_prods AS INT)                            AS spend_gold,
    CAST(num_web_purchases AS INT)                         AS web_purchases,
    CAST(num_store_purchases AS INT)                       AS store_purchases,
    CAST(num_web_visits_month AS INT)                      AS web_visits_per_month,
    CAST(response AS INT)                                  AS accepted_last_campaign,
    CAST(complain AS INT)                                  AS has_complaint
FROM customer_staging
WHERE id IS NOT NULL AND id != '';

-- ================================================
-- STEP 4: Verify the clean table
-- ================================================
SELECT COUNT(*) FROM customers_clean;

SELECT * FROM customers_clean LIMIT 5;