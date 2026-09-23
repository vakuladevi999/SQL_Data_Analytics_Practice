-- Find products that have avilable quantity but have no purchases.

-- Creating Products table
CREATE TABLE Products
(ProductID INT,Quantity INT,Price INT)

-- Inserting values into Products table
INSERT INTO Products VALUES
(1,10,850),
(2,30,1200),
(3,15,1300);

-- Creating OrdersDetails table
CREATE TABLE OrdersDetails
(OrderID INT,ProductID INT,Quantity INT,CustomerID INT)

-- Inserting values into OrdersDetails table
INSERT INTO OrdersDetails VALUES
(1,1,5,1),
(2,2,10,2);

-- Ans:-
SELECT
P.ProductID
FROM Products AS P
LEFT JOIN OrdersDetails AS OD
ON P.ProductID = OD.ProductID
WHERE OD.ProductID IS NULL AND P.Quantity > 0