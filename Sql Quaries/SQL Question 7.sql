--Identify the Top 5 most profitable product sub-categories.

SELECT TOP 5
    Sub_Category,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Sub_Category
ORDER BY TotalProfit DESC;