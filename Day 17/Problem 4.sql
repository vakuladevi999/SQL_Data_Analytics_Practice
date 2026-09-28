-- Creating EmployeesMonthlySales
CREATE TABLE EmployeesMonthlySales
(EmployeeID INT,JanSales INT,FebSales INT)

-- Inserting values into EmployeesMonthlySales
INSERT INTO EmployeesMonthlySales VALUES
(1,12000,13000),
(2,5000,6000),
(3,4500,8000);

-- Ans:-
SELECT
	EmployeeID,
	Month,
	Sales
FROM (
SELECT
*
FROM EmployeesMonthlySales) AS SourceTabel
UNPIVOT
(
	Sales
	FOR MONTH IN(JanSales,FebSales)
) AS SS