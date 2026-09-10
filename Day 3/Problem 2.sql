-- Q:-Find customers who have never made a purchase.

-- Creating Customers Table
CREATE TABLE Customers
(CustomerID INT PRIMARY KEY,CustomerName VARCHAR(20))

-- Inserting Values Into Customers Table
INSERT INTO Customers VALUES
(1,'Ravi'),
(2,'Chandra'),
(3,'Mukesh'),
(4,'Gopal'),
(5,'Prakash'),
(6,'Pallavi'),
(7,'Praveen'),
(8,'Lokesh');

-- Creating Sales Table
CREATE TABLE Sales
(OrderID INT PRIMARY KEY,CustomerID INT FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),Sales INT)

-- Inserting Values Into Sales Table
INSERT INTO Sales VALUES
(600,1,2000),
(601,2,3000),
(603,3,4500),
(604,4,6000),
(605,5,7000),
(606,6,8000);

-- Ans:-
SELECT
C.CustomerID
FROM Customers AS C
LEFT JOIN Sales AS S
ON C.CustomerID = S.CustomerID
WHERE S.CustomerID IS NULL;