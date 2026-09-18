/* Find the customers where the sales amount
is greater than the average sales amount. */

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
SELECT
	CustomerID,
	CustomerName,
	Sales,
	(SELECT AVG(Sales) FROM Customers_) AS AvgSales
FROM Customers_
WHERE Sales > (SELECT AVG(Sales) FROM Customers_) 