/* Q:- Write a query to count the number of employees 
whose names start and end with the sames letter.*/

-- Creating Employees_ table
CREATE TABLE Employees_
(EmployeeID INT,EmployeeName VARCHAR(20))

-- Inserting values into Employees_ table
INSERT INTO Employees_ VALUES
(1,'VyshnavYadhav'),
(2,'YogiReddy'),
(3,'InduKomari'),
(4,'PrakashReddy'),
(5,'PavithraReddy');

-- Ans:-
SELECT COUNT(*) AS TotalEmoloyees
FROM Employees_
WHERE LEFT(EmployeeName,1) = RIGHT(EmployeeName,1)


