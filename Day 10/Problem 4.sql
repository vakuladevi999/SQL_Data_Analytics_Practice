-- Q:- Count all employees who joined in 2023.

-- Creating Customers_ table
-- Q:- Find all employees hired on weekends.

-- Creating Employees_ table
CREATE TABLE Employees_
(EmployeeID INT,JoiningDate DATE)

-- Inserting values into Customers_ table
INSERT INTO Employees_ VALUES
(1,'2023-02-05'),
(2,'2023-05-02'),
(3,'2023-08-02'),
(4,'2024-02-02'),
(5,'2024-05-01');

-- Ans:-
SELECT * FROM Employees_
WHERE DATEPART(WEEKDAY,JoiningDate) IN (1,7);;