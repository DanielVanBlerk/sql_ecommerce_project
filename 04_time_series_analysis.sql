-- 04_time_series_analysis.sql

-- Query 1: Month-over-Month Revenue and Growth
WITH MonthlySales AS (
    SELECT
        strftime('%Y-%m', Purchase_DateTime) AS sales_month,
        SUM(Final_Price_Rs) AS monthly_revenue
    FROM sales
    GROUP BY sales_month
),
SalesWithLag AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue, 1, 0) OVER(ORDER BY sales_month) AS previous_month_revenue
    FROM MonthlySales
)
SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,
    (monthly_revenue - previous_month_revenue) * 100.0 / previous_month_revenue AS growth_percent
FROM SalesWithLag
ORDER BY sales_month;