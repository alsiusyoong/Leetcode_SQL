# Subquery method (1526 ms)

SELECT name AS Employee
FROM Employee e
WHERE managerId IS NOT NULL
AND salary >
(
    SELECT salary 
    FROM Employee 
    WHERE id = e.managerId
)