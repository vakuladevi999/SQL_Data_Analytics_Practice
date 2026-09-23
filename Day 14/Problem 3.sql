-- For each salesperson, count the number of distinct regions they handled.

-- Creating Region table
CREATE TABLE Region
(SalesPersonID INT,Region VARCHAR(5),Amount INT)

-- Inserting values into Region table
INSERT INTO Region VALUES
(1,'East',12000),
(2,'West',10000),
(3,'South',4500),
(4,'North',5000),
(1,'West',1200),
(2,'South',7500),
(3,'North',8500),
(4,'East',9000),
(1,'North',1300),
(2,'South',1400);

-- Ans:-
SELECT
	SalesPersonID,
	COUNT(DISTINCT Region) AS TotalRegions
FROM Region
GROUP BY SalesPersonID;
