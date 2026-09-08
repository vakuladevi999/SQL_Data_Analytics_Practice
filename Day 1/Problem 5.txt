-- Problem:- 5

-- Q:- Find email domains that are used by more than one user.

-- Creating Users Table
CREATE TABLE Users (UserID INT,Email VARCHAR(30))

-- Inserting Values Into Users Table
INSERT INTO Users VALUES
(1,'pavithra1513@gmail.com'),
(2,'vyshnav2000@gmail.com'),
(3,'mukesh111@service.com'),
(4,'lokesh@company.com'),
(5,'prem@service.com');

-- Ans:-
SELECT
	SUBSTRING(Email,CHARINDEX('@',Email,-1),LEN(Email)) AS EmailDomain,
	COUNT(*) AS TotalDomains
FROM Users
GROUP BY SUBSTRING(Email,CHARINDEX('@',Email,-1),LEN(Email))
HAVING COUNT(*) >1