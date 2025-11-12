-- 02_kpi_overview.sql

-- Query 1: Total Business Overview
SELECT
    COUNT(DISTINCT User_ID) AS Total_Customers,
    COUNT(Product_ID) AS Total_Orders,
    SUM(Final_Price_Rs) AS Total_Revenue,
    AVG(Final_Price_Rs) AS Average_Order_Value,
    MIN(Purchase_DateTime) AS First_Sale_Date,
    MAX(Purchase_DateTime) AS Latest_Sale_Date
FROM sales;

-- Query 2: Revenue by Payment Method
SELECT
    SUM(CASE WHEN Payment_Method = 'Credit Card' THEN Final_Price_Rs ELSE 0 END) AS Credit_Card_Revenue,
    SUM(CASE WHEN Payment_Method = 'Debit Card' THEN Final_Price_Rs ELSE 0 END) AS Debit_Card_Revenue,
    SUM(CASE WHEN Payment_Method = 'UPI' THEN Final_Price_Rs ELSE 0 END) AS UPI_Revenue,
    SUM(CASE WHEN Payment_Method = 'Cash on Delivery' THEN Final_Price_Rs ELSE 0 END) AS COD_Revenue,
    SUM(CASE WHEN Payment_Method = 'Net Banking' THEN Final_Price_Rs ELSE 0 END) AS Net_Banking_Revenue
FROM sales;