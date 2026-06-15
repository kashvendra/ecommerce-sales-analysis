-- ============================================================
-- E-Commerce Sales Analysis
-- Author: Kashvendra Kumar
-- Tools: MySQL Workbench
-- Database: ecommerce_analysis
-- Table: ecommerce_sales
-- ============================================================

-- ============================================================
-- QUERY 1: Full Business Summary
-- ============================================================
SELECT
    COUNT(*)                    AS Total_Orders,
    ROUND(SUM(Sales_Amount), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2)       AS Total_Profit,
    ROUND(AVG(Sales_Amount), 2) AS Avg_Order_Value,
    COUNT(DISTINCT Customer_Name) AS Unique_Customers
FROM ecommerce_sales;

-- ============================================================
-- QUERY 2: Revenue and Profit by Category
-- ============================================================
SELECT
    Category,
    COUNT(*)                    AS Orders,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2)       AS Total_Profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- ============================================================
-- QUERY 3: Top 5 Products by Revenue
-- ============================================================
SELECT
    Product_Name,
    SUM(Quantity)               AS Units_Sold,
    ROUND(SUM(Sales_Amount), 2) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- ============================================================
-- QUERY 4: Revenue by Region
-- ============================================================
SELECT
    Region,
    COUNT(*)                    AS Orders,
    ROUND(SUM(Sales_Amount), 2) AS Sales,
    ROUND(SUM(Profit), 2)       AS Profit
FROM ecommerce_sales
GROUP BY Region
ORDER BY Sales DESC;

-- ============================================================
-- QUERY 5: Customer Segment Analysis
-- ============================================================
SELECT
    Customer_Segment,
    COUNT(*)                    AS Orders,
    ROUND(SUM(Sales_Amount), 2) AS Sales,
    ROUND(SUM(Profit), 2)       AS Profit
FROM ecommerce_sales
GROUP BY Customer_Segment
ORDER BY Sales DESC;

-- ============================================================
-- QUERY 6: Monthly Sales Trend
-- ============================================================
SELECT
    SUBSTRING(Order_Date, 4, 2) AS Month,
    ROUND(SUM(Sales_Amount), 2) AS Monthly_Sales
FROM ecommerce_sales
GROUP BY Month
ORDER BY Month;

-- ============================================================
-- QUERY 7: Discount Impact on Profit
-- ============================================================
SELECT
    CASE
        WHEN Discount = 0     THEN 'No Discount'
        WHEN Discount <= 0.05 THEN 'Low 1-5%'
        ELSE                       'High 6-10%'
    END AS Discount_Tier,
    COUNT(*)                    AS Orders,
    ROUND(SUM(Sales_Amount), 2) AS Revenue,
    ROUND(AVG(Profit), 2)       AS Avg_Profit
FROM ecommerce_sales
GROUP BY Discount_Tier
ORDER BY Avg_Profit DESC;

-- ============================================================
-- QUERY 8: Revenue % Share by Category (Window Function)
-- ============================================================
SELECT
    Category,
    ROUND(SUM(Sales_Amount), 2) AS Revenue,
    ROUND(SUM(Sales_Amount) * 100.0 / SUM(SUM(Sales_Amount)) OVER (), 1) AS Revenue_Pct
FROM ecommerce_sales
GROUP BY Category
ORDER BY Revenue DESC;

-- ============================================================
-- QUERY 9: Month-over-Month Growth using LAG() Window Function
-- ============================================================
SELECT
    Month,
    Monthly_Revenue,
    LAG(Monthly_Revenue) OVER (ORDER BY Month)  AS Prev_Month_Revenue,
    ROUND(Monthly_Revenue - LAG(Monthly_Revenue) OVER (ORDER BY Month), 2) AS Growth
FROM (
    SELECT
        SUBSTRING(Order_Date, 4, 2)  AS Month,
        ROUND(SUM(Sales_Amount), 2)  AS Monthly_Revenue
    FROM ecommerce_sales
    GROUP BY Month
) t;

-- ============================================================
-- QUERY 10: Top Product Per Category using RANK() Window Function
-- ============================================================
SELECT Category, Product_Name, Revenue
FROM (
    SELECT
        Category,
        Product_Name,
        ROUND(SUM(Sales_Amount), 2) AS Revenue,
        RANK() OVER (PARTITION BY Category ORDER BY SUM(Sales_Amount) DESC) AS rnk
    FROM ecommerce_sales
    GROUP BY Category, Product_Name
) ranked
WHERE rnk = 1;
