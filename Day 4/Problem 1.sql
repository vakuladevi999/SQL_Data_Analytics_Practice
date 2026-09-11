-- Q:- Calculate Month-Over-Month (MoM) Sales Growth.

-- Creating MonthlySales Table
CREATE TABLE MonthlySales 
(Month INT,Sales INT);

-- Inserting Vlaues Into MonthlySales Table
INSERT INTO MonthlySales VALUES
(1,25000),
(2,30000),
(3,12000),
(4,45000),
(5,60000),
(6,78000),
(7,50000),
(8,45000),
(9,55000),
(10,60000),
(11,75000),
(12,80000);

-- Ans:-
WITH [MoM Growth] AS (
SELECT
	Month,
	Sales AS CurrentSales,
	LAG(Sales) OVER(ORDER BY Month) AS PreviousSales
FROM MonthlySales )

	SELECT
		MONTH,
		CurrentSales,
		PreviousSales,
		ROUND(CAST((CurrentSales-PreviousSales) AS FLOAT)/PreviousSales*100,2) AS MoMGrowthPercentage
	FROM [MoM Growth]