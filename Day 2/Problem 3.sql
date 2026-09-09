-- Q:- Find each seller's latest sales data and total sales on that date

-- Creating Sellers Table
CREATE TABLE Sellers
(SPID INT,SPName VARCHAR(20),Date DATE,Sales INT)

-- Inserting Values Into Sellers Table
INSERT INTO Sellers VALUES
(101,'Rahul','2025-03-03',40000),
(101,'Rahul','2025-05-04',50000),
(101,'Rahul','2025-05-04',20000),
(102,'Ravi','2025-02-03',70000),
(102,'Ravi','2025-03-04',40000),
(102,'Ravi','2025-03-04',50000),
(103,'Rajesh','2025-06-03',40000),
(103,'Rajesh','2025-06-04',80000),
(103,'Rajesh','2025-07-04',90000);

-- Ans:-
WITH SellersRecentOrderDate AS (
SELECT
	SPID,
	SPName,
	MAX(Date) AS RecentOrderDate
FROM Sellers
GROUP BY 
	SPID,
	SPName )

SELECT
	S.SPID,
	S.Date,
	SUM(S.Sales) AS TotalSales
FROM SellersRecentOrderDate AS SROD
JOIN Sellers AS S
ON SROD.SPID = S.SPID
WHERE SROD.RecentOrderDate = S.Date
GROUP BY 
	S.SPID,
	S.Date
ORDER BY TotalSales DESC