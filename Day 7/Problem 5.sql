-- Q:- Find the top 3 highest paid employees in each department.

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
SELECT * FROM (
	SELECT
		DepartmentName,
		Salary,
		ROW_NUMBER() OVER(PARTITION BY DepartmentName ORDER BY Salary) AS rn
	FROM Employees_ )t
WHERE rn <= 2;



