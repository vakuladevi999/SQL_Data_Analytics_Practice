-- Q:- Find duplicate OrderID'S in Orders_ table.

-- Creating Orders_ Table
CREATE TABLE Orders_
(OrderID INT,Sales INT)

-- Inserting Values Into Orders_ Table
INSERT INTO Orders_ VALUES
(200,2000),
(201,3000),
(203,4500),
(200,2000),
(204,4000),
(205,6000),
(204,4000);

-- Ans:-
SELECT
	OrderID,
	COUNT(*) AS TotalDuplicateRecords
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER(PARTITION BY OrderID) AS TotalOrders
	FROM Orders_ )t
WHERE TotalOrders >1
GROUP BY OrderID;