-- Problem:- 3

-- Q:- Find the highest-paid male and female employee in each department.

-- Creating Employees Table
CREATE TABLE Employees (
EmployeeName VARCHAR(25),
Gender VARCHAR(1),
DepartmentName VARCHAR(10),
Salary INT)

-- Inserting Values Into Employees Table
INSERT INTO Employees VALUES
('Pallavi','F','Sales',12000),
('Prakash','M','Sales',15000),
('Ramana','M','Sales',17000),
('Vyshnav','M','Sales',13000),
('Vasu','M','Finance',14000),
('Vijaya','F','Finance',16000),
('Pavithra','F','Finance',12000),
('Siva','M','HR',14000),
('Rahul','M','HR',16000),
('Priyanka','F','HR',18000),
('Priya','F','HR',13000);

-- Ans:-
SELECT
	EmployeeName,
	Gender,
	DepartmentName,
	Salary
FROM (
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY DepartmentName,Gender ORDER BY Salary DESC) AS EmployeeRank
	FROM Employees )t
WHERE EmployeeRank = 1
ORDER BY DepartmentName,Salary DESC