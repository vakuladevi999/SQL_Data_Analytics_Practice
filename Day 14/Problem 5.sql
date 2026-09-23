/* For each salesperson, count the distinct customers they have served,
   along with their cities and categories. */

-- Creating SalesPerson table
CREATE TABLE SalesPerson
(SPName VARCHAR(30),CustomerID INT,City VARCHAR(20),Category VARCHAR(20))

-- Inserting values into SalesPerosn table
INSERT INTO SalesPerson VALUES
('Mukesh',1,'Chennai','Electronics'),
('Mukesh',2,'Mumbai','Furniture'),
('Mukesh',1,'Chennai','Furniture'),
('Chandra',3,'Pune','Electronics'),
('Chandra',4,'Hyderabad','Furniture'),
('Chandra',5,'Kolkata','Stationary');

-- Ans:-
SELECT
SPName,
COUNT(DISTINCT CustomerID) AS Customers,
COUNT(DISTINCT City) AS Cities,
COUNT(DISTINCT Category) AS Categories
FROM SalesPerson
GROUP BY SPName