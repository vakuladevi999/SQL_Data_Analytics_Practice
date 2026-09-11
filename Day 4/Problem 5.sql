-- Q:- Rank customers based on their total sales and compare the results of RANK() and DENSE_RANK().

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
	DENSE_RANK() OVER(ORDER BY Sales DESC) AS DenseRank,
	RANK()       OVER(ORDER BY Sales DESC) AS Rank
FROM Orders_