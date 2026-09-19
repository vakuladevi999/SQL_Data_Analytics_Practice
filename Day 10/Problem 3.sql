-- Q:- Retrive customers with orders above average order value.

-- Creating Orders_ table
CREATE TABLE Orders_
(OrderID INT,CustomerID INT,Amount INT);

-- Inserting values into Orders_ table
INSERT INTO Orders_ VALUES
(1,1,1200),
(2,2,3000),
(3,5,1400),
(4,6,4800),
(5,4,1000);

-- Ans:-
SELECT
DISTINCT(CustomerID)
FROM Orders_
WHERE Amount > (SELECT AVG(Amount) FROM Orders_);