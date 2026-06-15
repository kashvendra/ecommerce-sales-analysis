-- KPI Analysis
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Items_Sold,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Sales_Amount),2) AS Avg_Order_Value,
    ROUND(AVG(Unit_Price),2) AS Avg_Unit_Price
FROM ecommerce_sales;

-- Sales by Category
SELECT
    Category,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top Products
SELECT
    Product_Name,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Region Analysis
SELECT
    Region,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales_Amount),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM ecommerce_sales
GROUP BY Region
ORDER BY Sales DESC;

-- Customer Segment Analysis
SELECT
    Customer_Segment,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales_Amount),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM ecommerce_sales
GROUP BY Customer_Segment
ORDER BY Sales DESC;

-- Monthly Trend
SELECT
    SUBSTRING(Order_Date,4,2) AS Month,
    ROUND(SUM(Sales_Amount),2) AS Monthly_Sales
FROM ecommerce_sales
GROUP BY Month
ORDER BY Month;

-- Monthly_Revenue
SELECT
    Month,
    Monthly_Revenue,
    LAG(Monthly_Revenue) OVER (ORDER BY Month) AS Prev_Month_Revenue,
    ROUND(Monthly_Revenue - LAG(Monthly_Revenue) OVER (ORDER BY Month), 2) AS Growth
FROM (
    SELECT
        SUBSTRING(Order_Date, 4, 2) AS Month,
        ROUND(SUM(Sales_Amount), 2) AS Monthly_Revenue
    FROM ecommerce_sales
    GROUP BY Month
) t;

--Top Product Per Category using RANK()
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
