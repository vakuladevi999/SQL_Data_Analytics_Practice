-- Q:- Find customers whose sales increased compared to their previous order.

-- Creating CustomerOrders Table
CREATE TABLE CustomerOrders
(CustomerID INT,CustomerSales INT,OrderDate DATE)

-- Inserting Values Into CustomerOrders Table
INSERT INTO CustomerOrders VALUES
(1,1000,'2022-02-03'),
(1,800,'2022-03-04'),
(2,600,'2022-03-05'),
(2,300,'2022-03-09'),
(3,1500,'2022-03-10'),
(3,2000,'2022-04-12');

-- Ans:-
SELECT
*
FROM (
	SELECT
		CustomerID,
		OrderDate,
		CustomerSales AS CurrentSales,
		LAG(CustomerSales) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousSales,
		CASE
			WHEN CustomerSales < LAG(CustomerSales) OVER(PARTITION BY CustomerID ORDER BY OrderDate) THEN 'Decreased'
			WHEN CustomerSales > LAG(CustomerSales) OVER(PARTITION BY CustomerID ORDER BY OrderDate) THEN 'Increased'
			ELSE 'No Change'
		END AS CustomerCategory
	FROM CustomerOrders )t
WHERE CustomerCategory = 'Increased'