# CTE Method (2613 ms)

WITH tmp AS
(
    SELECT departmentId, name, salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rank_s
    FROM Employee
)
SELECT d.name AS Department, tmp.name AS Employee, tmp.salary AS Salary
FROM tmp
JOIN Department d
ON d.id = tmp.departmentId
WHERE rank_s < 4