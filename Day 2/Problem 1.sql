-- Q: Find students who enrolled in a course but have not paid any fees.

-- Creating Cources Table
CREATE TABLE Cources 
(CourceID INT PRIMARY KEY,CourceName VARCHAR(20))

-- Inserting Values Into Cources Table
INSERT INTO Cources VALUES
(101,'Java'),
(102,'Python'),
(103,'SQL'),
(104,'Power BI'),
(105,'Excel');

-- Creating Students Table
CREATE TABLE Students
(StudentID INT PRIMARY KEY,StudentName VARCHAR(20))

-- Inserting Values Into Students Table
INSERT INTO Students VALUES
(1,'Raj'),
(2,'Pavithra'),
(3,'Kumar'),
(4,'Mohan'),
(5,'Priya'),
(6,'Pallavi'),
(7,'Tirumal'),
(8,'Prem'),
(9,'Eswar'),
(10,'Lokesh');

-- Creating CourceEnrollment Table
CREATE TABLE CorceEnrollment 
(EnrollmentID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
CourceID INT FOREIGN KEY REFERENCES Cources(CourceID),
EnrollmentDate DATE)

-- Inserting Values Into CourceEnrollment Table
INSERT INTO CorceEnrollment VALUES
(201,1,102,'2025-02-03'),
(202,1,103,'2025-03-03'),
(203,2,101,'2025-02-01'),
(204,3,105,'2025-03-04'),
(205,4,104,'2025-04-04'),
(206,5,102,'2025-06-02'),
(207,6,102,'2025-08-05'),
(208,7,104,'2025-09-02'),
(209,8,105,'2025-10-12'),
(210,9,102,'2025-12-12');

-- Creating Fees Table
CREATE TABLE Fees 
(EnrollementID INT FOREIGN KEY REFERENCES CorceEnrollment(EnrollmentID),
Fees INT)

-- Inserting Values Into Fees Table
INSERT INTO Fees VALUES
(201,15000),
(202,5000),
(205,6000),
(206,7000),
(207,6000),
(208,8000),
(209,4000);

-- Ans:-
SELECT
	S.StudentID,
	S.StudentName,
	C.CourceName,
	F.Fees
FROM Students AS S
INNER JOIN CorceEnrollment AS CE
ON S.StudentID = CE.StudentID
INNER JOIN Cources AS C
ON C.CourceID = CE.CourceID
LEFT JOIN Fees AS F
ON F.EnrollementID = CE.EnrollmentID
WHERE F.EnrollementID IS NULL