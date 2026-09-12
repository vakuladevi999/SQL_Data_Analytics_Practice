-- Q:- Identify first record per customer.

-- Creating Customers_ Table
CREATE TABLE Customers_
(CustomerID INT,CustomerName VARCHAR(25),OrderDate DATE,Sales INT)

-- Inserting Values Into Customers_ Table
INSERT INTO Customers_ VALUES
(1,'Priya','2025-01-02',2000),
(1,'Priya','2025-02-03',3000),
(1,'Priya','2025-03-02',2500),
(2,'Pavithra','2025-05-02',3000),
(2,'Pavithra','2025-06-03',4500),
(2,'Pavithra','2025-07-02',1000),
(3,'Praveen','2025-04-02',5000),
(3,'Praveen','2025-04-03',6000),
(3,'Praveen','2025-08-02',9500),
(3,'Praveen','2025-09-05',12000);

-- Ans:-
SELECT
	CustomerID,
	MIN(OrderDate) AS [First Order Date]
FROM Customers_
GROUP BY CustomerID