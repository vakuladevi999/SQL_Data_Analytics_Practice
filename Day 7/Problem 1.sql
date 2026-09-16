-- Q:- List employees who do not belong to any department.

-- Creting Employees_ table 
CREATE TABLE Employees_
(EmployeeID INT,DepartmentID INT)

-- Inserting values into Employees_ table
INSERT INTO Employees_(EmployeeID) VALUES
(1),
(3);
INSERT INTO Employees_ VALUES
(2,1),
(4,2),
(5,3);

-- Ans:-
SELECT COUNT(*) AS TotalEmployees FROM Employees_
WHERE DepartmentID IS NULL;