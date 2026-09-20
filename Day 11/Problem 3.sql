-- Q:- Count students gender wise.

-- Creating Students table
CREATE TABLE Students
(StudentID INT, Gender VARCHAR(1))

-- Inserting values into Students table
INSERT INTO Students VALUES
(1,'M'),
(2,'M'),
(3,'F'),
(4,'M'),
(5,'F');

-- Ans:-
SELECT
	Gender,
	COUNT(*) AS TotalCount
FROM Students
GROUP BY Gender;