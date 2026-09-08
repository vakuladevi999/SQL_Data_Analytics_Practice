-- Problem:- 1

-- Q:- Find the total sales of the top 2 products for each customer.

-- Creating Sales Table
CREATE TABLE Sales (CustomerID INT,CustomerName VARCHAR(20),Product Varchar(10),Sales INT)

-- Inserting Values Into Sales Table
INSERT INTO Sales VALUES
(1,'Ramana','Laptop',5500),
(1,'Ramana','Mobile',6500),
(1,'Ramana','KeyBoard',1300),
(1,'Ramana','Mouse',780),
(2,'Pavithra','Laptop',45000),
(2,'Pavithra','Mobile',12000),
(2,'Pavithra','Mouse',1200),
(2,'Pavithra','KeyBoard',1500),
(3,'Kiran','Laptop',98000),
(3,'Kiran','Mobile',70000),
(3,'Kiran','Mouse',2000),
(3,'Kiran','KeyBoard',2500);

-- Ans:-
SELECT
	CustomerID,
	CustomerName,
	SUM(Sales) AS TotalTop2Sales
FROM (
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY Sales DESC) AS CustomerRank
	FROM Sales )t
WHERE CustomerRank <=2
GROUP BY 
	CustomerID,
	CustomerName
ORDER BY TotalTop2Sales DESC;