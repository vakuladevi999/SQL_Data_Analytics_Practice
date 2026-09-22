/* Q:-
 1.Which month had the highest overall sales?
 2.For that highest sales month,which produts were sold,
   how much did each product sell,and whay was the total monthly sales? */

-- Creating OrdersList table
CREATE TABLE OrdersList 
(OrderID INT,CustomerID INT,Product VARCHAR(20),Amount INT,OrderDate DATE)

-- Inserting values into OrderList table
INSERT INTO OrdersList VALUES
(1,101,'Laptop',20000,'2025-01-02'),
(2,102,'Mouse',3000,'2025-03-05'),
(3,102,'Charger',5000,'2025-05-04'),
(4,105,'Monitor',4000,'2025-07-08'),
(5,108,'TV',9000,'2025-08-09'),
(6,101,'Laptop',10000,'2026-01-20'),
(7,102,'Mouse',5000,'2026-03-12'),
(8,102,'Charger',5000,'2026-05-15'),
(9,105,'Monitor',7000,'2026-07-14'),
(10,108,'TV',1000,'2026-08-10'),
(11,108,'Mouse',20000,'2025-01-08'),
(12,105,'TV',12000,'2025-01-15');
-- Ans:-
SELECT
	Product,
	OrderMonth
FROM (
	SELECT 
		*,
		DENSE_RANK() OVER(ORDER BY TotalAmount DESC) rn
	FROM (
		SELECT
			Product,
			DATETRUNC(MONTH,OrderDate) AS OrderMonth,
			SUM(Amount) OVER(PARTITION BY DATETRUNC(MONTH,OrderDate), product ORDER BY DATETRUNC(MONTH,OrderDate)) AS ProductAmount,
			SUM(Amount) OVER(PARTITION BY DATETRUNC(MONTH,OrderDate)) AS TotalAmount
		FROM OrdersList )t )T
WHERE rn = 1;

