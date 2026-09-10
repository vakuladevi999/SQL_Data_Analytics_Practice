-- Q:-Find the monthly sales and running total of sales for the year 2022.

-- Creating Sales_ Table
CREATE TABLE Sales_
(OrderDate DATE,Sales INT)

-- Inserting Values Into Sales_ Table
INSERT INTO Sales_ VALUES
('2022-02-05',20000),
('2022-03-05',15000),
('2022-04-05',30000),
('2022-05-05',10000),
('2022-06-05',22000),
('2022-07-05',16000),
('2022-08-05',80000),
('2022-09-05',65000),
('2022-10-05',20000),
('2022-11-05',15000),
('2023-02-05',20000),
('2023-03-05',15000);

-- Ans:-
SELECT
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	SUM(Sales) AS TotalSales,
	SUM(SUM(Sales)) OVER(ORDER BY YEAR(OrderDate),MONTH(OrderDate) ) AS RunningTotalSales
FROM Sales_
WHERE YEAR(OrderDate) = 2022
GROUP BY 
	YEAR(OrderDate),
	MONTH(OrderDate);