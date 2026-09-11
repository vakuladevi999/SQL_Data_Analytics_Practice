-- Q:- Calculte Year-Over-Year (YoY) Sales Growth.

-- Creating YearlySales Table
CREATE TABLE YearlySales
(YEAR INT, Sales INT);

-- Inserting Values Into YearlySales Table
INSERT INTO YearlySales VALUES
(2020,5000000),
(2021,5500000),
(2022,4500000),
(2023,6500000),
(2024,6000000),
(2025,7000000);

-- Ans:-
WITH [YoY Growth] AS (
SELECT
	YEAR,
	Sales AS CurrentSales,
	LAG(Sales) OVER(ORDER BY Year) AS PreviousSales
FROM YearlySales )

	SELECT
		YEAR,
		CurrentSales,
		PreviousSales,
		ROUND(CAST((CurrentSales-PreviousSales) AS FLOAT) /PreviousSales*100,2) AS YoYGrowthPercentage
	FROM [YoY Growth]