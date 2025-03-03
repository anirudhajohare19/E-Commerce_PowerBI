CREATE DATABASE SwiftCartDB;
USE SwiftCartDB;

CREATE TABLE ecommerce_data (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Customer_Name VARCHAR(255),
    Product_ID VARCHAR(50),
    Product_Name VARCHAR(255),
    Category VARCHAR(100),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Payment_Type VARCHAR(50),
    Total_Amount DECIMAL(10,2),
    Rating INT,
    Sentiment_Score DECIMAL(5,2),
    Sentiment_Label VARCHAR(50),
    Order_Status VARCHAR(50),
    Discount_Applied DECIMAL(10,2),
    Profit_Margin DECIMAL(10,2),
    Quantity_Ordered INT,
    Customer_Type VARCHAR(50),
    Delivery_Days INT,
    Region VARCHAR(50),
    Return_Reason VARCHAR(255),
    Customer_Satisfaction_Score DECIMAL(5,2)
);



SELECT * FROM ecommerce_data;

-- Exploratory Data Analysis (EDA) ---

-- 1 Checking the Data Structure
DESCRIBE ecommerce_data;


-- 2 Checking Missing Values
SELECT column_name, COUNT(*) - COUNT(column_name) AS missing_values
FROM ecommerce_data
GROUP BY column_name;

-- 3 Finding Duplicate Records
SELECT Order_ID, COUNT(*)
FROM ecommerce_data
GROUP BY Order_ID
HAVING COUNT(*) > 1;



-- Objective 1 : Product Return & Refund Optimization --

-- 1 Monthly Return Trends
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, COUNT(*) AS Total_Returns
FROM ecommerce_data
WHERE Order_Status = 'Returned'
GROUP BY Month
ORDER BY Month;

-- 2 Most Returned Products
SELECT Product_Name, COUNT(*) AS Return_Count
FROM ecommerce_data
WHERE Order_Status = 'Returned'
GROUP BY Product_Name
ORDER BY Return_Count DESC
LIMIT 5;

-- 3 Return Reasons Breakdown
SELECT Return_Reason, COUNT(*) AS Return_Count
FROM ecommerce_data
WHERE Order_Status = 'Returned'
GROUP BY Return_Reason
ORDER BY Return_Count DESC;

-- ----------------------------------------------------------------------

-- Objective 2 : Profitability vs. Discounts --

-- 1 Profitability by Product Category
SELECT Category, ROUND(SUM(Profit_Margin), 2) AS Total_Profit
FROM ecommerce_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 2 Discount Impact on Profit Margins
SELECT Discount_Applied, 
       ROUND(AVG(Profit_Margin), 2) AS Avg_Profit_Margin
FROM ecommerce_data
GROUP BY Discount_Applied
ORDER BY Discount_Applied;

-- 3 Discount Effect on Order Volume
SELECT Discount_Applied, COUNT(Order_ID) AS Total_Orders
FROM ecommerce_data
GROUP BY Discount_Applied
ORDER BY Discount_Applied;

-- ----------------------------------------------------------------------

-- Objective 3 : Shipping & Delivery Performance Analysis --alter

-- 1 Average Delivery Days per Shipping Mode
SELECT Ship_Mode, ROUND(AVG(Delivery_Days), 2) AS Avg_Delivery_Days
FROM ecommerce_data
GROUP BY Ship_Mode
ORDER BY Avg_Delivery_Days DESC;

-- 2 Late Delivery Percentage by Shipping Mode
SELECT Ship_Mode, 
       COUNT(CASE WHEN Delivery_Days > 5 THEN 1 END) * 100.0 / COUNT(*) AS Late_Delivery_Percentage
FROM ecommerce_data
GROUP BY Ship_Mode;

-- 3 Customer Satisfaction vs. Delivery Speed
SELECT Delivery_Days, ROUND(AVG(Customer_Satisfaction_Score), 2) AS Avg_Satisfaction
FROM ecommerce_data
GROUP BY Delivery_Days
ORDER BY Delivery_Days;

-- 4 Sales & Revenue Analysis

-- 1 Total Sales and Revenue per Region
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2 Monthly Sales Trend
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Sales) AS Monthly_Sales
FROM ecommerce_data
GROUP BY Month
ORDER BY Month;





