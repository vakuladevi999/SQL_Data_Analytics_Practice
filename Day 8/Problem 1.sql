/* Q:- How to find the cummulative (running total) 
salary of employees ordered by salary. */

-- Creating Employees table
CREATE TABLE Employees
(EmployeeID INT,EmployeeName VARCHAR(20),EmployeeSalary INT)

-- Inserting values into Employees table
INSERT INTO Employees VALUES
(1,'Pavithra',20000),
(2,'Rajesh',50000),
(3,'Pallavi',60000),
(4,'Kiran',45000),
(5,'Ravi',75000),
(6,'Spandana',90000),
(7,'Prem',65000),
(8,'Lokesh',50000),
(9,'Vyshnav',65000),
(10,'Vybhav',45000);

-- Ans:-
SELECT
	*,
	SUM(EmployeeSalary) OVER(ORDER BY EmployeeSalary) AS RunningTotal
FROM Employees;