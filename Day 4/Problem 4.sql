-- Q:- Assign a unique sequential number to each customer based on their sales.

-- Creating Orders_ Table
CREATE TABLE Orders_ (CustomerID INT,Sales INT)

-- Inserting Values Into Orders_ Table
INSERT INTO Orders_ VALUES
(1,10000),
(2,12000),
(3,12000),
(4,15000),
(5,16000);

-- Ans:-
SELECT
	*,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS RowNumberRank
FROM Orders_