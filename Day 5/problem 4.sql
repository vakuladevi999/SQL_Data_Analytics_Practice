-- Q:- Identify customer who made highest sales in the month of junuary.

-- Creating CustomersDate
CREATE TABLE CustomersData
(CustomerID INT PRIMARY KEY IDENTITY(1,1),CustomerName VARCHAR(50))

-- Inserting values into CustomersDate
INSERT INTO CustomersData (CustomerName) VALUES
('Priya'),
('Spandana'),
('Lokesh'),
('Ramya'),
('Chandra'),
('Charan');

-- Creating OrdersData table
CREATE TABLE OrdersData
(OrderID INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT FOREIGN KEY REFERENCES CustomersData(CustomerID),
OrderDate DATE,
Sales INT)

-- Inserting values into OrdersData table
INSERT INTO OrdersData (CustomerID,OrderDate,Sales) VALUES
(1,'2025-01-01',6000),
(1,'2025-02-01',7000),
(1,'2025-03-01',5000),
(1,'2025-08-01',1000),
(1,'2025-10-01',1500),
(2,'2025-01-01',4000),
(2,'2025-02-01',5000),
(2,'2025-03-01',6000),
(2,'2025-04-01',2000),
(2,'2025-05-01',3500),
(3,'2025-01-01',4000),
(3,'2025-02-01',8000),
(3,'2025-05-01',4000),
(3,'2025-06-01',2600),
(3,'2025-07-01',2500),
(3,'2025-01-02',3000);

-- Ans:-
SELECT TOP 1
	C.CustomerID,
	MONTH(O.OrderDate) AS MonthDate,
	SUM(O.Sales) AS TotalSales
FROM CustomersData AS C
JOIN OrdersData AS O
ON C.CustomerID = O.CustomerID
WHERE MONTH(O.OrderDate) = 1
GROUP BY 
	C.CustomerID,
	MONTH(O.OrderDate)
ORDER BY TotalSales DESC


