-- 01_data_cleaning.sql
-- prepare and clean data for analysis

-- gain initial understanding of data
SELECT * FROM sales LIMIT 10;

-- need to convery date column from TEXT format
ALTER TABLE sales ADD COLUMN Purchase_DateTime DATETIME;

-- update new column by converting old text date
UPDATE sales
SET Purchase_DateTime = strftime('%Y-%m-%d %H:%M:%S', Purchase_Date);

-- check for NULLS in key columns
SELECT
    COUNT(*) AS total_rows,
    COUNT(CASE WHEN User_ID IS NULL THEN 1 END) AS null_users,
    COUNT(CASE WHEN Product_ID IS NULL THEN 1 END) AS null_products,
    COUNT(CASE WHEN Final_Price_Rs IS NULL THEN 1 END) AS null_prices
FROM sales;

-- check if Final_Price_Rs is correctly calculated for data validation purposes
SELECT
    Price_Rs,
    Discount_Percent,
    Final_Price_Rs,
    (Price_Rs * (1 - Discount_Percent / 100)) AS calculated_price,
    Final_Price_Rs - (Price_Rs * (1 - Discount_Percent / 100)) AS difference
FROM sales
LIMIT 20;