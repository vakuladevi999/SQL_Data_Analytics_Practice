-- Q:- Customers who made purchases but never returned products.

-- Creating Customers table
CREATE TABLE Customers
(CustomerID INT,CustomerName VARCHAR(20))

-- Inserting values into Customers table
INSERT INTO Customers VALUES
(1,'Ravi'),
(2,'Chandra'),
(3,'Mukesh'),
(4,'Gopal'),
(5,'Prakash'),
(6,'Pallavi'),
(7,'Praveen'),
(8,'Lokesh');

-- Creating Returns table
CREATE TABLE Returns
(CustomerID INT)

-- Inserting values inot Returns table
INSERT INTO Returns VALUES
(1),(3),(4),(6);

-- Ans:-
SELECT
	CustomerID,
	CustomerName
FROM Customers
WHERE CustomerID NOT IN
(SELECT CustomerID FROM Returns);