-- Q:- How to find the top 3 highest paid employees?

-- Creating SalesPersons table
CREATE TABLE SalesPersons
(EmployeeID INT,FirstName VARCHAR(20),LastName VARCHAR(20),Salary INT);

-- Inserting values into SalesPersons table
INSERT INTO SalesPersons VALUES
(1,'Alice','Smith',15000),
(2,'Pavithra','Yadhav',15000),
(3,'Raju','Kumar',12000),
(4,'Prem','Reddy',14500),
(5,'Pallavi','Chandra',17000),
(6,'Priya','Lokesh',18000);

-- Ans:-
SELECT TOP 3
EmployeeID
FROM SalesPersons
ORDER BY Salary DESC;
