--Determine the average sales per order for each customer segment.

SELECT
    Segment,
    AVG(Sales) AS AverageSales
FROM Others
GROUP BY Segment;