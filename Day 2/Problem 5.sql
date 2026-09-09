 /*Q:- Find total number of orders and total sales for each product,
includind proudcts with no orders if no sales or orders show as zero*/

-- Creating Customers Table
CREATE TABLE Customers 
(CustomerID INT PRIMARY KEY,CustomerName VARCHAR(20))

-- Inserting Values Into Customers Table
INSERT INTO Customers VALUES
(1,'Spandana'),
(2,'Lokesh'),
(3,'Pavithra'),
(4,'Praveen'),
(5,'Ravi'),
(6,'Mallesh'),
(7,'Mohan'),
(8,'Pallavi'),
(9,'Rajesh'),
(10,'Sai');

-- Creating Products Table
CREATE TABLE Products 
(ProductID INT PRIMARY KEY,ProductName VARCHAR(20))

-- Inserting Values Into Products Table
INSERT INTO Products VALUES
(500,'Laptop'),
(501,'Mouse'),
(502,'KeyBoard'),
(503,'Mobile'),
(504,'Charger'),
(505,'Cable');

-- Creating Orders Table
CREATE TABLE Orders(
OrderID INT  PRIMARY KEY,
CustomerID INT FOREIGN KEY(CustomerID) REFERENCES Customers (CustomerID),
ProductID INT FOREIGN KEY(ProductID) REFERENCES Products (ProductID),
Sales INT)

-- Inserting Values Into Orders
INSERT INTO Orders Values
(1000,1,500,2000),
(1001,2,502,6000),
(1002,4,504,9000),
(1003,6,505,4000),
(1004,7,502,6000),
(1005,5,504,4000),
(1006,9,501,5000),
(1007,10,500,8000);

-- Ans:-
SELECT
	P.ProductName,
	COUNT(O.OrderID) AS TotalOrders,
	COALESCE(SUM(O.Sales),0) AS TotalSales
FROM Products AS P
LEFT JOIN Orders AS O
ON P.ProductID = O.ProductID
GROUP BY P.ProductName
