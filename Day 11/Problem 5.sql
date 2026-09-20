/* Q:- Write a query to find the difference in 
days between startdate and enddate of project. */

-- Creating Projects table
CREATE TABLE Projects
(ProjectID INT,StartDate DATE,EndDate DATE)

-- Inserting values into Projects table
INSERT INTO Projects VALUES
(1,'2025-01-02','2025-06-02'),
(2,'2025-02-02','2025-08-03'),
(3,'2025-03-02','2025-07-05');

-- Ans:-
SELECT
	*,
	DATEDIFF(DAY,StartDate,EndDate) DaysDifference
FROM Projects;