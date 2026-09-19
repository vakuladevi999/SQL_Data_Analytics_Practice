-- Q:- Count distinct customers with more than 2500 total they spent.

-- Creating Orders_ table
CREATE TABLE Orders_
(OrderID INT,CustomerID INT,Amount INT)

-- Inserting values into Orders_ table
INSERT INTO Orders_ VALUES
(1,1,1200),
(2,2,3000),
(3,5,1400),
(4,6,4800),
(5,4,1000);

-- Ans:-
SELECT COUNT(DISTINCT CustomerID) AS CustomerID FROM (
	SELECT
		CustomerID,
		SUM(Amount) AS TotalAmount
	FROM Orders_
	GROUP BY CustomerID
	HAVING SUM(Amount)>2500 
)T;