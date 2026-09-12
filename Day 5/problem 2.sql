-- Q:- Identify customers without any records in orders__ table.

-- Creating Customers__ Table
CREATE TABLE Customers__
(CustomerID INT PRIMARY KEY IDENTITY(101,1),CustomerName VARCHAR(20))

-- Inserting Values Into Customers__ Table
INSERT INTO Customers__ (CustomerName) VALUES
('Pavithra'),
('Rahul'),
('Mallesh'),
('Mukendra'),
('Lokesh'),
('Chandra'),
('Ravi');

-- Creating Orders__ Table
CREATE TABLE Orders__
(OrderID INT PRIMARY KEY IDENTITY(1,1),CustomerID INT FOREIGN KEY REFERENCES Customers__ (CustomerID),Sales INT)

-- Inserting Values Into Orders__ Table
INSERT INTO Orders__ (CustomerID,Sales) VALUES
(101,2000),
(102,3000),
(105,4000),
(106,4500),
(107,5000);

-- Ans:-
SELECT 
C.CustomerID
FROM Customers__ AS C
LEFT JOIN Orders__ AS O
ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL