-- Q:- Find departments that have more than 2 employees.

-- Creating Employees_ table
CREATE TABLE Employees_
(EmployeeID INT,EmployeeName VARCHAR(30),Salary INT,DepartmentName VARCHAR(10))

-- Inserting values into Employees_ table
INSERT INTO Employees_ VALUES
(1,'Ravi',20000,'Sales'),
(2,'Ramya',45000,'Sales'),
(3,'Rajesh',60000,'Sales'),
(4,'Pavithra',40000,'Finance'),
(5,'Pallavi',20000,'Finance'),
(6,'Praveen',30000,'HR'),
(7,'Priyanka',80000,'HR');

-- Ans:-
SELECT
	DepartmentName,
	COUNT(*) AS TotalEmployees
FROM Employees_
GROUP BY DepartmentName
HAVING COUNT(*) > 2;

