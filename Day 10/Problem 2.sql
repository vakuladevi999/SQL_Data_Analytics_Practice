-- Q:- Count all employees who joined in 2023.

-- Creating Customers_ table
CREATE TABLE Customers_
(CustomerID INT,JoiningDate DATE)

-- Inserting values into Customers_ table
INSERT INTO Customers_ VALUES
(1,'2023-02-05'),
(2,'2023-05-02'),
(3,'2023-08-02'),
(4,'2024-02-02'),
(5,'2024-05-01');

-- Ans:-
SELECT Count(*) AS TotalEmployees 
FROM Customers_
WHERE YEAR(JoiningDate) = 2023;