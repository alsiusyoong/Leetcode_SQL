# Using Count (1127 ms)

SELECT DISTINCT email 
FROM Person
GROUP BY email
HAVING COUNT(email) > 1

# CTE method (863 ms)

WITH tmp AS
(
    SELECT id, email,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY email DESC) AS dup_count
    FROM Person
)
SELECT DISTINCT email 
FROM tmp
WHERE dup_count > 1