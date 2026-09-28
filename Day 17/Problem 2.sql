/* Q:- Consecutive Order Periods

For each customer, find the groups of orders where they placed an order every day without missing a day.

Return:
CustomerID
IslandID
StartDate - first day of the group 
EndDate - last day of the group 
TotalOrders - number of orders in the group

Example:if a customer ordered on jan 1, jan 2, jan 3,and then again on jan 7, jan 8,
there are two separate groups. */

-- Creating CustomerOrders table
CREATE TABLE CustomerOrders
(CID INT,OrderDate DATE,Amount INT)

-- Inserting values into CustomerOrders table
INSERT INTO CustomerOrders VALUES
(1,'2025-01-01',2000),
(1,'2025-01-02',3000),
(1,'2025-01-03',4500),
(1,'2025-01-05',7000),
(1,'2025-01-06',1200),
(2,'2025-02-01',1000),
(2,'2025-02-02',3000),
(2,'2025-02-04',7500),
(2,'2025-02-05',4000),
(2,'2025-02-07',3200),
(3,'2025-03-01',2900),
(3,'2025-03-02',400),
(3,'2025-03-03',2500),
(3,'2025-03-04',1400),
(3,'2025-03-05',1500);*/

-- Ans:-
WITH CTE AS (
SELECT
	CID,
	OrderDate,
	LAG(OrderDate) OVER(PARTITION BY CID ORDER BY OrderDate) AS PreviousOrderDate,
	DATEDIFF(DAY,LAG(OrderDate) OVER(PARTITION BY CID ORDER BY OrderDate),OrderDate) AS DaysInDiffernce
FROM CustomerOrders ),

CTE1 AS (
SELECT
	*,
	CASE 
		WHEN DaysInDiffernce = 1 THEN 0
	ELSE 1  
	END AS New
FROM CTE ),

CTE2 AS (
SELECT
	*,
	SUM(New) OVER(PARTITION BY CID ORDER BY OrderDate) AS IslandID
FROM CTE1)

SELECT
	CID,
	IslandID,
	MIN(OrderDate) AS StartDate,
	MAX(OrderDate) AS EndDate,
	COUNT(*) AS TotalOrders
FROM CTE2
GROUP BY 
	CID,
	IslandID
ORDER BY CID;