-- Q:- How to find the department that has the highest average salary?

-- Creating Employees__ table
CREATE TABLE Employees__
(EmployeeID INT,EmployeeName VARCHAR(20),Salary INT,DepartmentID int)

-- Inserting values into Employees__ table
INSERT INTO Employees__ VALUES
(1,'Pavithra',20000,1),
(2,'Rahul',12000,1),
(3,'Pallavi',50000,2),
(4,'Chandra',45000,2),
(5,'Priyanka',30000,2),
(6,'Dhanu',15000,3),
(7,'Chinnu',15500,3);

-- Ans:-
SELECT TOP 1
DepartmentID,
AVG(Salary) AS AverageSalary
FROM Employees__
GROUP BY DepartmentID
ORDER BY AverageSalary DESC;
