
-- Creating Orders table
CREATE TABLE Orders(OrderID INT,CustomerID INT,Amount INT,OrderDate DATE)

-- Inserting values into Orders table
INSERT INTO Orders VALUES
(1,1,20000,'2025-03-06'),
(2,2,12000,'2025-06-02'),
(3,1,14000,'2025-06-04'),
(4,4,4000,'2025-04-06'),
(5,8,4500,'2025-05-06'),
(6,7,7000,'2025-06-09'),
(7,6,4500,'2025-07-16'),
(8,5,6000,'2025-08-09'),
(9,4,4600,'2025-09-12'),
(10,6,4800,'2025-10-02');

-- Creating Orders2 table
CREATE TABLE Orders2(OrderID INT,CustomerID INT,Amount INT,OrderDate DATE)

-- Inserting values into Orders2 table
INSERT INTO Orders2 VALUES
(1,1,10000,'2026-03-06'),
(2,2,22000,'2026-06-02'),
(3,1,54000,'2026-06-04'),
(4,4,1000,'2026-04-06'),
(5,8,1500,'2026-05-06'),
(6,7,4000,'2026-06-09'),
(7,6,5500,'2026-07-16'),
(8,5,4000,'2026-08-09'),
(9,4,6600,'2026-09-12'),
(10,6,1800,'2026-10-02');

-- Q:- Find orders in Orders2 whose amount is higher than any one amount in orders.
-- Ans:-
SELECT * FROM Orders2
WHERE Amount > ANY  (SELECT Amount FROM Orders);

/* Q:- Find orders in Orders2 where the order amount 
is greater than all order amounts in the Orders table. */
-- Ans:-
SELECT * FROM Orders2
WHERE Amount > ALL  (SELECT Amount FROM Orders);


