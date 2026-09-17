-- Q:- Find month-over-month growth sales percentage.

-- Createt MonthlySales table
CREATE TABLE MonthlySales
(Month INT,Sales INT);

-- Inserting values into MonthlySales table
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
SELECT
	*,
	ROUND(CAST((Sales-Prev_Month_Sales) AS FLOAT)
	/Prev_Month_Sales*100,2) AS Growth_Per
FROM (
	SELECT 
		Month,
		Sales,
		LAG(Sales) OVER(ORDER BY Month ASC) AS Prev_Month_Sales
	FROM MonthlySales )t