# Subquery method (879 ms)

SELECT DISTINCT num AS ConsecutiveNums
FROM
(
    SELECT id, num,
    lag(num) over (ORDER BY id) AS prev,
    lead(num) over (ORDER BY id) AS next
    FROM logs
) next_prev
WHERE num = prev AND prev = next

# CTE method (937 ms)

WITH tmp AS 
    (
        SELECT num AS V1, 
        LEAD(num,1) Over (ORDER BY id) AS V2, 
        LEAD(num,2) Over (ORDER BY id) AS V3 
        From Logs
    )
SELECT DISTINCT V1 AS ConsecutiveNums 
FROM tmp
WHERE V1=V2 AND V2=V3