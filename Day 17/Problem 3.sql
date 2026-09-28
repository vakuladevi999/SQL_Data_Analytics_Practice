-- Q:- For each activity stage, find the number of unique users who reached the stage.

-- Creating UserActivity table
CREATE TABLE UserActivity
(UserID VARCHAR(4),Activity VARCHAR(15),ActivityDate DATE)

-- Inserting values into UserActivity
INSERT INTO UserActivity VALUES
('U01','Visit','2026-09-01'),
('U01','Product View','2026-09-01'),
('U01','Add to Cart','2026-09-01'),
('U01','Purchase','2026-09-01'),
('U02','Visit','2026-09-01'),
('U02','Product View','2026-09-01'),
('U02','Add to Cart','2026-09-01'),
('U03','Visit','2026-09-01'),
('U03','Product View','2026-09-01'),
('U04','Visit','2026-09-01'),
('U04','Product View','2026-09-01'),
('U04','Add to Cart','2026-09-01'),
('U05','Visit','2026-09-01'),
('U06','Visit','2026-09-01'),
('U06','Product View','2026-09-01');

-- Ans:-
SELECT
	Activity,
	COUNT(DISTINCT UserID) AS TotalCustomers
FROM UserActivity
GROUP BY Activity
ORDER BY TotalCustomers DESC;
