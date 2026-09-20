-- Q:- Find employees who earn more than their manager.

-- Creating Employees_ table
CREATE TABLE Employees_
(EmployeeID INT,ManagerID INT,Salary INT)

-- Inserting values into Employees_ table
INSERT INTO Employees_ (EmployeeID, Salary) VALUES
(1,20000),
(2,25000);

INSERT INTO Employees_ VALUES
(3,1,10000),
(4,2,15000),
(5,1,30000);

-- Ans:-
SELECT
	E.EmployeeID,
	E.ManagerID,
	E.Salary AS EmployeeSalary,
	M.Salary AS ManagerSalary
FROM Employees_ AS E
JOIN Employees_ AS M
ON E.ManagerID = M.EmployeeID
WHERE E.Salary > M.Salary;

