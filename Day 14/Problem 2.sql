-- For each region, find the total sales amount and the salespersons in that region.

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

SELECT * FROM (
	SELECT
		Region,
		SalesPersonID,
		SUM(Amount) OVER(PARTITION BY Region) RegionAmount,
		SUM(Amount) OVER(PARTITION BY Region,SalesPersonID) RegionSpAmount
	FROM Region )t
ORDER BY RegionAmount;





