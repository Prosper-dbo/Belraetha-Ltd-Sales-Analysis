# Belraetha Ltd: Business Performance Analysis

SQL analysis of sales, profit, regional performance, product categories and customer segments for Belraetha Ltd.

| Key performance measure | Result |
|---|---|
| Total sales | $2,297,201.07 |
| Total profit | $286,397.79 |
| Overall profit margin | 12.47% |
| Records with sales above $1,000 | 468 |

> **Data source:** SQL Server table `dbo.Others` in the `Belraetha Ltd` database. Figures are transcribed from the supplied query screenshots. Currency is shown as dollars because the task examples use `$`; the dataset's actual currency was not independently verified.

## Contents

1. [Executive Summary](#1-executive-summary)
2. [Overall Business Performance](#2-overall-business-performance)
3. [Regional Sales Performance](#3-regional-sales-performance)
4. [Sales and Profit by Product Category](#4-sales-and-profit-by-product-category)
5. [Average Sales by Customer Segment](#5-average-sales-by-customer-segment)
6. [Records with Sales Greater Than $1,000](#6-records-with-sales-greater-than-1000)
7. [Top Five Most Profitable Sub-Categories](#7-top-five-most-profitable-sub-categories)
8. [Categories Generating More Than $10,000 in Profit](#8-categories-generating-more-than-10000-in-profit)
9. [Findings and Business Recommendations](#9-findings-and-business-recommendations)
10. [Conclusion](#10-conclusion)
11. [Further Analysis Recommended](#11-further-analysis-recommended)
12. [Data and Methodology Notes](#12-data-and-methodology-notes)
13. [Appendix: SQL Queries](#appendix-sql-queries)

---

## 1. Executive Summary

This analysis evaluates the business performance of Belraetha Ltd using the SQL query results from the supplied screenshots. It covers overall sales and profit, regional sales, product-category performance, average sales by customer segment, high-sales records, the five most profitable sub-categories, and categories above the $10,000 profit threshold.

Total sales are about $2.30 million and total profit is about $286,397.79. Technology leads both sales and profit among categories, and the West region has the highest sales. Furniture needs further investigation: its sales are substantial but its profit margin is low.

### Key findings

- Total sales are **$2,297,201.07** and total profit is **$286,397.79**.
- The **West** region leads regional sales with about **$725,457.93**.
- **Technology** leads category sales and profit, with about $836,154.10 in sales and $145,455.66 in profit.
- **Furniture** generates about $741,999.98 in sales but only $18,451.25 in profit.
- **Home Office** has the highest average sales per dataset row, at about $240.97.
- **Copiers** are the most profitable sub-category, with about $55,617.90 in profit.
- **468** dataset records have sales greater than $1,000.

## 2. Overall Business Performance

The query uses `SUM(Sales)` and `SUM(Profit)` across all records in `dbo.Others`.

| Measure | Result |
|---|---|
| Total sales | $2,297,201.07 |
| Total profit | $286,397.79 |

The overall profit margin is about **12.47%** (total profit ÷ total sales × 100), or roughly $12.47 of profit for every $100 of sales.

**Interpretation:** The business has a substantial revenue base, but revenue alone is not enough. High sales do not automatically turn into high profit, so margins matter.

## 3. Regional Sales Performance

Sales were grouped by region, summed and sorted from highest to lowest.

| Rank | Region | Total sales |
|---|---|---|
| 1 | West | $725,457.93 |
| 2 | East | $678,781.36 |
| 3 | Central | $501,239.88 |
| 4 | South | $391,721.90 |

West contributes about **31.6%** of total company sales, followed by East, Central and South. The gap between West and South is about $333,736.03.

**Business implication:** Management should investigate what supports sales in West and East and whether those practices can be applied in Central and South. The figures alone do not explain regional differences. Customer volume, demand, marketing, pricing and operating costs would need further analysis.

## 4. Sales and Profit by Product Category

| Category | Total sales | Total profit | Approx. profit margin |
|---|---|---|---|
| Technology | $836,154.10 | $145,455.66 | 17.40% |
| Furniture | $741,999.98 | $18,451.25 | 2.49% |
| Office Supplies | $719,046.99 | $122,490.88 | 17.04% |

Technology leads both sales and profit. Office Supplies also performs strongly, earning about $122,490.88 in profit despite having the lowest sales total.

**Furniture is the main concern.** Its 2.49% margin is far below Technology and Office Supplies. Management should look at product costs, discounting, pricing, shipping and the profitability of individual Furniture products. Growing Furniture sales without improving margins may not materially lift overall profit.

## 5. Average Sales by Customer Segment

| Customer segment | Average sales per dataset row |
|---|---|
| Home Office | $240.97 |
| Corporate | $233.82 |
| Consumer | $223.73 |

Home Office has the highest average, followed by Corporate and Consumer. The gap between Home Office and Consumer is about $17.24.

> **Limitation:** The query calculates `AVG(Sales)` grouped by `Segment`. The first screenshot shows repeated `Order_ID` values, so one order can span several rows. These results are therefore *average sales per dataset row*, not necessarily *average sales per order*. To get true average order value, first sum `Sales` for each distinct order, then average those totals within each segment (see [Further Analysis](#11-further-analysis-recommended)).

## 6. Records with Sales Greater Than $1,000

The filter `Sales > 1000` returned **468 records**.

These records mark high-sales entries that can be examined to see which customers, products and regions contribute to larger transactions. The count is of dataset rows, not necessarily 468 distinct orders, because an order ID can appear on more than one row.

## 7. Top Five Most Profitable Sub-Categories

| Rank | Sub-category | Total profit |
|---|---|---|
| 1 | Copiers | $55,617.90 |
| 2 | Phones | $44,516.25 |
| 3 | Accessories | $41,936.78 |
| 4 | Paper | $34,053.34 |
| 5 | Binders | $30,221.64 |

Copiers lead, followed by Phones and Accessories, with Paper and Binders completing the top five. Management should monitor demand, stock availability, inventory turnover and product-level margins before making purchasing decisions based only on total profit.

## 8. Categories Generating More Than $10,000 in Profit

| Category | Total profit | Above $10,000? |
|---|---|---|
| Technology | $145,455.66 | Yes |
| Office Supplies | $122,490.88 | Yes |
| Furniture | $18,451.25 | Yes |

All three categories pass the threshold. Technology contributes the most profit, then Office Supplies. Furniture qualifies but remains the weakest category by margin.

## 9. Findings and Business Recommendations

| Priority | Recommended action | Reason |
|---|---|---|
| High | Investigate Furniture pricing, discounts and costs. | Furniture has high sales but a low profit margin. |
| High | Protect and monitor Technology performance. | Technology leads both sales and profit. |
| High | Study West and East regional sales drivers. | These are the two strongest sales regions. |
| Medium | Monitor Copiers, Phones and Accessories. | They are the three most profitable sub-categories. |
| Medium | Explore targeted Consumer-segment offers. | Consumer has the lowest average sales per row. |
| Medium | Calculate true average order value by segment. | Orders may contain multiple dataset rows. |

These recommendations rest on the patterns visible in the supplied results. Further investigation is needed before attributing performance to specific causes or making major operational changes.

## 10. Conclusion

Belraetha Ltd generated about $2.30 million in sales and $286,397.79 in profit. Technology is the strongest category, West is the leading region by sales, and Copiers are the most profitable sub-category. Home Office has the highest average sales per dataset row.

The most important issue is Furniture's low margin despite substantial sales. Management should examine its cost and pricing structure while continuing to support Technology and Office Supplies. Regional and segment results should also be investigated further to find opportunities for sustainable growth.

**The central conclusion: focus on profitable growth, not sales growth alone.**

## 11. Further Analysis Recommended

- **Profit by region:** check whether the highest-sales region is also the most profitable.
- **Monthly sales and profit trends:** identify seasonality and changes over time.
- **Loss-making products:** find products with negative total profit.
- **Discount analysis:** assess whether discounts are reducing profitability.
- **Customer profitability:** identify the customers contributing the most profit.
- **Shipping performance:** calculate the time between `Order_Date` and `Ship_Date`.
- **Average order value:** aggregate `Sales` by distinct `Order_ID` before calculating segment averages.

## 12. Data and Methodology Notes

- The screenshots show the active database as `Belraetha Ltd` and the table as `dbo.Others`, so `dbo.Others` is the analysis table.
- The first 10 rows were retrieved to inspect the dataset structure. They include repeated `Order_ID` values.
- Regional and category totals are transcribed from the SQL result grids and rounded to two decimal places.
- Profit margin is total profit ÷ total sales × 100.
- The currency symbol is shown as dollars to match the assignment wording. The actual currency was not confirmed.
- The totals, profits and averages here do not establish *why* the business performed as it did. Additional data is needed for that.

---

## Appendix: SQL Queries

All queries run against `dbo.Others` in SQL Server.

### Dataset structure (first 10 records)

```sql
SELECT TOP 10 *
FROM Others;
```

### Overall sales and profit

```sql
SELECT
    SUM(Sales)  AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM Others;
```

### Regional sales

```sql
SELECT
    Region,
    SUM(Sales) AS TotalSales
FROM Others
GROUP BY Region
ORDER BY TotalSales DESC;
```

### Sales and profit by category

```sql
SELECT
    Category,
    SUM(Sales)  AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Category;
```

### Average sales by segment

```sql
SELECT
    Segment,
    AVG(Sales) AS AverageSales
FROM Others
GROUP BY Segment;
```

### Records with sales above $1,000

```sql
SELECT *
FROM Others
WHERE Sales > 1000;
```

### Top five profitable sub-categories

```sql
SELECT TOP 5
    Sub_Category,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Sub_Category
ORDER BY TotalProfit DESC;
```

### Categories with profit above $10,000

```sql
SELECT
    Category,
    SUM(Profit) AS TotalProfit
FROM Others
GROUP BY Category
HAVING SUM(Profit) > 10000;
```
