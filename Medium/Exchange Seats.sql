# CTE method (719 ms)

WITH tmp AS
(
    SELECT id, student, 
    LEAD(student, 1) OVER (ORDER BY id) AS next,
    LAG(student, 1) OVER (ORDER BY id) AS prev  
    FROM Seat
)
SELECT id,
CASE 
    WHEN id % 2 =1 THEN COALESCE(next, student) ELSE COALESCE(prev, student) END AS student
FROM tmp
ORDER BY id