# CTE method (1163 ms)

WITH tmp AS
(
    SELECT COUNT(student_id) AS student_number, dept_id
    FROM Student
    GROUP BY dept_id 
)
SELECT d.dept_name, coalesce(tmp.student_number, 0) AS student_number
FROM tmp
RIGHT JOIN Department d
ON tmp.dept_id = d.dept_id
ORDER BY student_number DESC