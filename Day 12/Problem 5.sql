-- Q:- Find the percentage of total sales contributed by each category.

-- Creating Orders table
CREATE TABLE Orders
(OrderID INT,CustomerID,Product VARCHAR(20),
Category VARCHAR(20),Amount INT,OrderDate)

-- Inserting values into Orders table
INSERT INTO Orders VALUES
(101,1,'Laptop','Electronics',60000.00,'2024-01-10'),
(102,2,'Mobile','Electronics',25000.00,'2024-01-15'),
(103,1,'Mouse','Accessories',700.00,'2024-02-01'),
(104,3,'Laptop','Electronics',62000.00,'2024-02-10'),
(105,5,'Keyboard','Accessories',1500.00,'2024-03-05'),
(106,7,'Monitor','Electronics',12000.00,'2024-03-10'),
(107,2,'Headphones','Accessories',3000.00,'2024-04-02'),
(108,6,'Laptop','Electronics',58000.00,'2024-04-15'),
(109,7,'Mouse','Accessories',800.00,'2024-04-20'),
(110,5,'Mobile','Electronics',28000.00,'2024-05-01');

-- Ans:-
SELECT
	Category,
	ROUND(CAST(CategoryAmount AS FLOAT) / TotalAmount * 100,2) AS Contribution
FROM (
	SELECT
		Category,
		SUM(Amount) AS CategoryAmount,
		(SELECT SUM(Amount) FROM Orders) AS TotalAmount
	FROM Orders
	GROUP BY Category )t



