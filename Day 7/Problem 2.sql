-- Q:- Find the month_wise count of employees who joined.

-- Creating Employees_ table
CREATE TABLE Employees__
(EmployeeID INT,EmployeeName VARCHAR(30),DateOfJoin DATE)

-- Inserting values into Employees_ table
INSERT INTO Employees__ VALUES
(1,'Ravi','2025-01-01'),
(2,'Ramya','2025-01-02'),
(3,'Rajesh','2025-02-05'),
(4,'Pavithra','2025-02-06'),
(5,'Pallavi','2025-03-01'),
(6,'Praveen','2025-03-15'),
(7,'Priyanka','2025-03-20');

-- Ans:-
SELECT
	DATETRUNC(MONTH,DateofJoin) AS JoinMonth,
	COUNT(*) AS TotalEmployees
FROM Employees__
GROUP BY DATETRUNC(MONTH,DateofJoin)