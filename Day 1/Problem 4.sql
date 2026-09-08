-- Problem:- 4

-- Q:- Find SpID's placed by salespersons who do not exist in the SalesPersons table.

-- Creting SalesPersons Table
CREATE TABLE SalesPersons 
(SpID INT PRIMARY KEY,
 SpName VARCHAR(20))

-- Inserting Values Into SalesPersons Table
INSERT INTO SalesPersons VALUES
(1,'Vyshnav'),
(2,'Vybhav'),
(3,'Kummar'),
(4,'Chandra');

-- Creating Orders Table
CREATE TABLE Orders 
(SpID INT, Sales INT)

-- Inserrting Values Into Orders Table
INSERT INTO Orders VALUES
(1,1000),
(5,1200),
(2,2000),
(3,4500),
(4,6000),
(6,2000);

-- Ans:-
SELECT
	O.SpID
FROM Orders AS O
LEFT JOIN SalesPersons AS S
ON O.SpID = S.SpID
WHERE S.SpID IS NULL