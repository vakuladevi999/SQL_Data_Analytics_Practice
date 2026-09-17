-- Q:- Find customers who have spent more than 10000.

-- Creating Customers_ table
CREATE TABLE Customers_
(CustomerID INT,CustomerName VARCHAR(20),OrderDate DATE,Sales INT)

-- Inserting values into Customers_ table
INSERT INTO Customers_ VALUES
(1,'Priya','2025-01-02',2000),
(1,'Priya','2025-02-03',3000),
(2,'Pavithra','2025-03-02',2500),
(2,'Pavithra','2025-05-02',3000),
(3,'Pallavi','2025-03-03',4500),
(3,'Pallavi','2025-04-02',5000);

-- Ans:-
SELECT
	CustomerID,
	CustomerName,
	SUM(Sales) AS TotalSales
FROM Customers_
GROUP BY 
	CustomerID,
	CustomerName
HAVING SUM(Sales) > 10000;