-- Q:- List orders that have not been shipped yet.

-- Creating Orders__ table
CREATE TABLE Orders__
(OrderID INT,Amount INT,OrderStatus VARCHAR(10))

-- Inserting values into Orders__ table
INSERT INTO Orders__ VALUES
(1,20000,'Pending'),
(2,30000,'Delivered'),
(3,50000,'Pending'),
(4,10000,'Delivered'),
(5,60000,'Delivered');

-- Ans:-
SELECT * FROM Orders__
WHERE OrderStatus = 'Pending'