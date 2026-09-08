-- Problem:- 2

-- Q:- Find the gender-wise employee count and percentage in each department.

-- Creating Departments Table
CREATE TABLE Departments (
EmployeeName VARCHAR(25),
Gender VARCHAR(1),
DepartmentName VARCHAR(10))

-- Inserting Values Into Departments Table
INSERT INTO Departments VALUES
('Pallavi','F','Sales'),
('Prakash','M','Sales'),
('Ramana','M','Sales'),
('Vyshnav','M','Sales'),
('Vasu','M','Finance'),
('Vijaya','F','Finance'),
('Pavithra','F','Finance'),
('Siva','M','HR'),
('Rahul','M','HR'),
('Priyanka','F','HR'),
('Priya','F','HR');

-- Ans:-
WITH CTE AS (
SELECT 
	DepartmentName,
	Gender,
	COUNT(*) AS GenderCount
FROM Departments
GROUP BY 
	DepartmentName,
	Gender ),

CTE2 AS ( 
SELECT
	DepartmentName,
	COUNT(*) AS TotalEmployees
FROM Departments
GROUP BY DepartmentName )

SELECT
	C.DepartmentName,
	C.Gender,
	C.GenderCount,
	CONCAT(CAST(C.GenderCount AS FLOAT) / C1.TotalEmployees * 100,'%') AS GenderPercentage
FROM CTE AS C
JOIN CTE2 AS C1
ON C.DepartmentName = C1.DepartmentName