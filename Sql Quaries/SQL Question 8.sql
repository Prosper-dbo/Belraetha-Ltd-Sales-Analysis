--Determine which product categories generated more than $10,000 in total profit.

SELECT
    Category,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Category
HAVING SUM(Profit) > 10000;