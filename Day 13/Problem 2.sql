/* Q:-
 1.Year-wise average product price.
 2.For each year,show the top 3 products,based on average price. */

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
(10,108,'TV',1000,'2026-08-10');

-- Ans:-
WITH AerageProduct AS (
SELECT
	YEAR(OrderDate) AS OrderYear,
	Product,
	AVG(Amount) AS AverageAmount
FROM OrdersList
GROUP BY 
	YEAR(OrderDate),
	Product ),

RankProducts AS (
SELECT
	*,
	ROW_NUMBER() OVER(PARTITION BY OrderYear ORDER BY AverageAmount DESC) AS rn
FROM AerageProduct )

SELECT
*
FROM RankProducts
WHERE rn <=3
ORDER BY OrderYear DESC;