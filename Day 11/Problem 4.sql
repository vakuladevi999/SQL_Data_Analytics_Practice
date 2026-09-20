-- Q:- Find employees whose salary is same as thier maneger salary.

-- Creating Employees_ table
CREATE TABLE Employees___
(EmployeeID INT,ManagerID INT,Salary INT)

-- Inserting values into Employees_ table
INSERT INTO Employees___ (EmployeeID, Salary) VALUES
(1,20000),
(2,25000);

INSERT INTO Employees___ VALUES
(3,1,10000),
(4,2,15000),
(5,1,20000);

-- Ans:-
SELECT
	E.EmployeeID,
	E.ManagerID,
	E.Salary AS EmployeeSalary,
	M.Salary AS ManagerSalary
FROM Employees___ AS E
LEFT JOIN Employees___ AS M
ON E.ManagerID = M.EmployeeID
WHERE E.Salary = M.Salary;

