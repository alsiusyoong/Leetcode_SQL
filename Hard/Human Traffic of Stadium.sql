# CTE Method (694 ms)

WITH tmp AS
(
    SELECT *, id - row_number() OVER() AS id_diff
    FROM Stadium
    WHERE people > 99
)
SELECT id, visit_date, people
FROM tmp
WHERE id_diff in (SELECT id_diff FROM tmp GROUP BY id_diff HAVING COUNT(*) > 2)
ORDER BY id, visit_date ASC