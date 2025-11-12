-- 03_product_analysis.sql

-- Query 1: Top 10 Best-Selling Products
SELECT
    Product_ID,
    COUNT(Product_ID) AS Units_Sold,
    SUM(Final_Price_Rs) AS Product_Revenue
FROM sales
GROUP BY Product_ID
ORDER BY Product_Revenue DESC
LIMIT 10;

-- Query 2: Top 3 Products WITHIN Each Category
WITH Ranked_Products AS (
    SELECT
        Product_ID,
        Category,
        SUM(Final_Price_Rs) AS Product_Revenue,
        ROW_NUMBER() OVER(PARTITION BY Category ORDER BY SUM(Final_Price_Rs) DESC) as rank
    FROM sales
    GROUP BY Product_ID, Category
)
SELECT
    Category,
    Product_ID,
    Product_Revenue,
    rank
FROM RankedProducts
WHERE rank <= 3
ORDER BY Category, rank;