-- Find top 2 customers by total amount they spent.

-- Creating Customers_ table
CREATE TABLE Customers_
(CustomerID INT,CustomerName,Sales INT)

-- Inserting values into Customers_ table
INSERT INTO Customers VALUES
(1,'Priya',2000),
(1,'Priya',3000),
(1,'Priya',4000),
(2,'Chandra',5000),
(2,'Chandra',3000),
(3,'Mukesh',2000),
(3,'Mukesh',1500);

-- Ans:-
SELECT TOP 2
	CustomerID,
	CustomerName,
	SUM(Sales) AS TotalSpent
FROM Customers_
GROUP BY 
	CustomerID,
	CustomerName
ORDER BY TotalSpent DESC;