-- Creating Customers table
CREATE TABLE Customers(CustomerID INT, CustomerName VARCHAR(25),Country VARCHAR(25))

-- Inserting values into Customers table
INSERT INTO Customers VALUES
(1,'Pavithra','India'),
(2,'Pallavi','USA'),
(3,'Prem','UK'),
(4,'Lokesh','Chaina'),
(5,'Eswar','India'),
(6,'Manoj','USA'),
(7,'Mallika','UK'),
(8,'Priyanka','India');

-- Creating Orders table
CREATE TABLE Orders(OrderID INT,CustomerID INT,Amount INT,OrderDate DATE)

-- Inserting values into Orders table
INSERT INTO Orders VALUES
(1,1,20000,'2025-03-06'),
(2,2,12000,'2025-06-02'),
(3,1,14000,'2025-06-04'),
(4,4,4000,'2025-04-06'),
(5,8,4500,'2025-05-06'),
(6,7,7000,'2025-06-09'),
(7,6,4500,'2025-07-16'),
(8,5,6000,'2025-08-09'),
(9,4,4600,'2025-09-12'),
(10,6,4800,'2025-10-02');

-- Q:- Identify orders from India.
-- Ans:-
SELECT 
	CustomerID,
	Amount,
	OrderDate
FROM Orders 
WHERE CustomerID IN (
SELECT CustomerID FROM Customers WHERE Country = 'India');

-- Q:- Identify orders expect from India.
-- Ans:-
SELECT 
	CustomerID,
	Amount,
	OrderDate
FROM Orders 
WHERE CustomerID NOT IN (
SELECT CustomerID FROM Customers WHERE Country = 'India');

-- Q:- Check whether a customerID exist in the orders table.
-- Ans:-
SELECT
	CustomerID,
	CustomerName
FROM Customers AS C
WHERE EXISTS (
	SELECT 1
	FROM Orders AS O
	WHERE C.CustomerID = O.CustomerID)

-- Q:- Check whether a customerID not exist in the orders table.
-- Ans:-
SELECT
	CustomerID,
	CustomerName
FROM Customers AS C
WHERE NOT EXISTS (
	SELECT 1
	FROM Orders AS O
	WHERE C.CustomerID = O.CustomerID)
