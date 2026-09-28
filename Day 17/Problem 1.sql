-- Q:- Let's Pivot EmployeeSales table

-- Creating EmployeeSales table
CREATE TABLE EmployeeSales
(EID INT,Year INT,Sales INT)

-- Inserting values into EmployeeSales table
INSERT INTO EmployeeSales VALUES
(1,2020,10000),
(1,2021,12000),
(2,2020,13000),
(2,2021,10000);

-- Ans:-
SELECT
	EID,
	[2020],
	[2021]
FROM (
	SELECT
		EID,
		Year,
		Sales
	FROM EmployeeSales ) AS Employee
	PIVOT
	(
		SUM(Sales)
		FOR YEAR IN ([2020], [2021])
	) AS PivotTable