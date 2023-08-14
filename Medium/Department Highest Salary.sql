# Subquery method (1734 ms)

SELECT d.name AS Department, e.name AS Employee, e.salary
FROM Employee e
JOIN Department d
ON d.id = e.departmentId
WHERE (e.departmentId, e.salary) IN
(
    SELECT departmentId, MAX(salary) FROM Employee
    GROUP BY departmentId
)

# CTE method (1163 ms)

WITH tmp AS(
	SELECT d.name AS 'Department', e.name AS 'Employee', e.salary AS 'Salary',
    DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS 'Salary_Rank'
	FROM Employee AS e
	JOIN Department AS d
	ON e.departmentId = d.id 
    )
SELECT Department, Employee, Salary
FROM tmp
WHERE Salary_Rank = 1;