/* Q:- Combine the 2024 and 2025 sales data.
for each salesperson,calculte their monthly
sales and also calculte their total sales
across the entire period. */

-- Creating Sales2024 table
CREATE TABLE Sales2024
(SalesPersonID INT,Amount INT,DATE DATE)

-- Inserting values into Sales2024 table
INSERT INTO Sales2024 VALUES
(1,20000,'2024-01-02'),
(2,15000,'2024-05-05'),
(3,10000,'2024-06-06'),
(1,40000,'2024-08-02'),
(2,88000,'2024-09-05'),
(3,75000,'2024-10-06');

-- Creating Sales2025 table
CREATE TABLE Sales2025
(SalesPersonID INT,Amount INT,DATE DATE)

-- Inserting values into Sales2025 table
INSERT INTO Sales2025 VALUES
(1,20000,'2025-01-02'),
(2,15000,'2025-05-05'),
(3,10000,'2025-06-06'),
(1,40000,'2025-08-02'),
(2,88000,'2025-09-05'),
(3,75000,'2025-10-06');

-- Ans:-
WITH CombineData AS (
SELECT * FROM Sales2024
UNION ALL
SELECT * FROM Sales2025 ),

CTE AS (
SELECT 
	SalesPersonID,
	DATETRUNC(MONTH,Date) AS OrderMonth,
	SUM(Amount) AS MonthlySales,
	SUM(SUM(Amount)) OVER(PARTITION BY SalesPersonID) AS TotalPeriodSales
FROM CombineData
GROUP BY 
	SalesPersonID,
	DATETRUNC(MONTH,Date))

SELECT * FROM CTE;

