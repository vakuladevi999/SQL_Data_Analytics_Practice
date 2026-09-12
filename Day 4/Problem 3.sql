-- Q:-Find customers who placed orders in at least 4 consecutive months without missing a month.

-- Creating Orders Table
CREATE TABLE Orders
(OrderID INT,CustomerID INT,OrderDate DATE,Sales INT)

-- Inserting Values Into Orders Table
INSERT INTO Orders VALUES
(1,101,'2025-01-01',20000),
(2,101,'2025-02-01',30000),
(3,101,'2025-03-01',40000),
(4,101,'2025-04-01',12000),
(5,102,'2025-01-01',40000),
(6,102,'2025-02-01',20000),
(7,102,'2025-03-01',30000),
(8,102,'2025-04-01',22000),
(9,103,'2025-01-01',50000),
(10,103,'2025-02-01',40000),
(11,103,'2025-03-01',20000);

WITH CustomerOrderHistory AS
(
    SELECT
        OrderID,
        CustomerID,
        OrderDate AS CurrentOrderDate,
        LAG(OrderDate) OVER
        (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ) AS PreviousOrderDate
    FROM Orders
),

OrderDateDifference AS
(
    SELECT
        *,
        DATEDIFF(
            MONTH,
            PreviousOrderDate,
            CurrentOrderDate
        ) AS MonthDifference
    FROM CustomerOrderHistory
)

SELECT
    CustomerID,
    COUNT(MonthDifference) AS ConsecutiveMonthCount
FROM OrderDateDifference
WHERE MonthDifference = 1
GROUP BY CustomerID
HAVING COUNT(MonthDifference) >= 3;
