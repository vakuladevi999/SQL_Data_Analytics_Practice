-- Creating Orders tabel
CREATE TABLE Orders
(OrderID INT, CustomerID INT,CategoryID INT, Amount INT,OrderDate DATE)

-- Inserting values into Orders table
INSERT INTO Orders VALUES
(1,101,501,15000,'2025-01-02'),
(2,102,502,14500,'2025-03-03'),
(3,103,503,12000,'2025-02-03'),
(4,101,502,14500,'2025-06-04'),
(5,104,501,6000,'2025-08-01'),
(6,101,503,4500,'2025-09-01'),
(7,102,501,6500,'2025-09-05'),
(8,103,501,3000,'2025-09-14'),
(9,104,501,8500,'2025-10-10');

-- Q1:- Which customer(s) have purchased products from every product category?

-- Ans:-
SELECT
CustomerID
FROM (
	SELECT
		CustomerID,
		COUNT(DISTINCT CategoryID) AS TotalCategoriesByCustomer,
		(SELECT COUNT(DISTINCT CategoryID) FROM Orders) AS TotalCategories
	FROM Orders
	GROUP BY CustomerID )t
WHERE TotalCategoriesByCustomer = TotalCategories;

-- Q2:- Which customers have purchased products from at least two different categories?

-- Ans:-
SELECT
	CustomerID,
	COUNT(DISTINCT CategoryID) AS TotalCategories
FROM Orders
GROUP BY CustomerID
HAVING COUNT(DISTINCT CategoryID) >=2;

-- Q3:- How many total customers and unique customers are there in each product category?

-- Ans:-
SELECT
	CategoryID,
	COUNT(CustomerID) AS TotalCustomers,
	COUNT(DISTINCT CustomerID) AS TotalUniqueCustomers
FROM Orders
GROUP BY CategoryID;

-- Q4:- What is the maximum purchase amount in each category,along with the customerID and categoryID?

-- Ans:-
SELECT
	CustomerID,
	CategoryID,
	Amount
FROM (
	SELECT
		CustomerID,
		CategoryID,
		Amount,
		MAX(Amount) OVER(PARTITION BY CategoryID) AS HighestCategoryAmount
	FROM Orders )t
WHERE Amount = HighestCategoryAmount;

-- Q5:- Which month has the highest purchase amount for each product category?

-- Ans:-
WITH CTE AS (
SELECT
	CategoryID,
	MONTH(OrderDate) AS OrderMonth,
	SUM(Amount) AS TotalPurchases,
    ROW_NUMBER() OVER(PARTITION BY CategoryID ORDER BY SUM(Amount) DESC) AS rn
FROM Orders
GROUP BY 
	CategoryID,
	MONTH(OrderDate) )

SELECT 
	CategoryID,
	OrderMonth,
	TotalPurchases
FROM CTE
WHERE rn = 1;
