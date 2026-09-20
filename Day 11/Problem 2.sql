-- Q:- Count employees who joined in the last 6 months.

-- Creating EmployeesJoining table
CREATE TABLE EmployeesJoining
(EmployeeID INT, JoiningDate DATE);

-- Inserting values into EmployeesJoining table
INSERT INTO EmployeesJoining VALUES
(1,'2026-01-01'),
(2,'2026-02-01'),
(3,'2026-03-01'),
(4,'2026-04-01'),
(5,'2026-05-01');

-- Ans:-
SELECT
Count(*) AS Employees
FROM EmployeesJoining
WHERE JoiningDate >= DATEADD(MONTH,-6,GETDATE());
