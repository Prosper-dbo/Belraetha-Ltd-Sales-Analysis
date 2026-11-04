--Determine which region generates the highest total sales.

SELECT
    Region,
    SUM(Sales) AS TotalSales
FROM Others
GROUP BY Region
ORDER BY TotalSales DESC;