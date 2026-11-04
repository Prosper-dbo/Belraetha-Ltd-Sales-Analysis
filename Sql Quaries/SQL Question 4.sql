--Calculate the total sales and total profit for each product category.

SELECT
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Category;