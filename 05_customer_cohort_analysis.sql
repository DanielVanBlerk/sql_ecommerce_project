-- 05_customer_cohort_analysis.sql
-- Cohort meaning a group of users who made their first purchase in the same month

WITH UserFirstPurchase AS (
    SELECT
        User_ID,
        strftime('%Y-%m', MIN(Purchase_DateTime)) AS cohort_month
    FROM sales
    GROUP BY User_ID
),
MonthlyActivity AS (
    SELECT
        s.User_ID,
        strftime('%Y-%m', s.Purchase_DateTime) AS activity_month,
        ufp.cohort_month
    FROM sales s
    JOIN UserFirstPurchase ufp ON s.User_ID = ufp.User_ID
),
CohortSize AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT User_ID) AS total_users
    FROM UserFirstPurchase
    GROUP BY cohort_month
),
Retention AS (
    SELECT
        cohort_month,
        activity_month,
        COUNT(DISTINCT User_ID) AS active_users
    FROM MonthlyActivity
    GROUP BY cohort_month, activity_month
)
SELECT
    r.cohort_month,
    r.activity_month,
    c.total_users,
    r.active_users,
    (r.active_users * 100.0 / c.total_users) AS retention_percentage
FROM Retention r
JOIN CohortSize c ON r.cohort_month = c.cohort_month
ORDER BY r.cohort_month, r.activity_month;

-- Final table shows users who joined in e.g 2023-01
-- What % came back in 2023-02, 2023-03 etc.