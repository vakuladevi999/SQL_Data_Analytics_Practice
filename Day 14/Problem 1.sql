/* Based on each customer's purchases amount,categorize into the following groups:
   Greater than 10000 - High
   Greater than 6000  - Medium-High
   Greater than 3000  - Medium
   Else Below 3000    - Low */

-- Creating Orders table
CREATE TABLE Orders
(OrderID INT,CustomerID INT,Amount INT)

-- Inserting values into Orders table
INSERT INTO Orders VALUES
(1,101,2000),
(2,102,1200),
(3,105,5000),
(4,106,4500),
(5,107,7000),
(6,108,8000),
(7,109,10000),
(8,110,13000),
(9,111,14500),
(10,112,12500);

-- Ans:-
SELECT
	CASE 
		WHEN Amount > 10000 THEN 'High'
		WHEN Amount > 6000 THEN 'Medium-High'
		WHEN Amount > 3000 THEN 'Medium'
	ELSE 'Low'
	END AS CustomerCategory,
COUNT(*) AS TotalCustomers
FROM Orders
GROUP BY 
	CASE 
		WHEN Amount > 10000 THEN 'High'
		WHEN Amount > 6000 THEN 'Medium-High'
		WHEN Amount > 3000 THEN 'Medium'
	ELSE 'Low'
	END;