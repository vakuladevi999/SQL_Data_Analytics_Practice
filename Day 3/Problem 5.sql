-- Q:-Find the highest salary (each department wise).

-- Creating Departments Table
CREATE TABLE Departments 
(DepartmentID INT PRIMARY KEY,DepartmentName VARCHAR(20));

-- Inserting Values Into Departments Table
INSERT INTO Departments VALUES
(101,'Sales'),
(102,'IT'),
(103,'HR'),
(104,'Finance'),
(105,'Administration');

-- Creating Employees Table
CREATE TABLE Employees 
(EmployeeID INT PRIMARY KEY,EmployeeName VARCHAR(20),EmployeeSalary INT)

-- Inserting Values Into Employees Table
INSERT INTO Employees VALUES
(1,'Pavithra',20000),
(2,'Rajesh',50000),
(3,'Pallavi',60000),
(4,'Kiran',45000),
(5,'Ravi',75000),
(6,'Spandana',90000),
(7,'prem',65000),
(8,'Lokesh',50000),
(9,'Vyshnav',650000),
(10,'Vybhav',45000);

-- Creating EmployeeDepartment Table
CREATE TABLE EmployeeDepartment 
(EmployeeID INT FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
 DepartmentID INT FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID))

-- Inserting Values Into EmployeeDepartment Table
INSERT INTO EmployeeDepartment VALUES
(1,101),
(2,103),
(3,105),
(4,104),
(5,101),
(6,102),
(7,105),
(8,102),
(9,103),
(10,103);

SELECT
	DepartmentName,
	EmployeeName
FROM (
	SELECT
		E.EmployeeName,
		E.EmployeeSalary,
		D.DepartmentName,
		ROW_NUMBER() OVER(PARTITION BY D.DepartmentName ORDER BY E.EmployeeSalary DESC) AS EmployeeRank
	FROM EmployeeDepartment AS ED
	JOIN Employees AS E
	ON   E.EmployeeID = ED.EmployeeID
	JOIN Departments AS D
	ON   D.DepartmentID = ED.DepartmentID )t
WHERE EmployeeRank = 1