# CTE method (1004 ms)

WITH tmp AS
(
    SELECT candidateId, COUNT(candidateId) AS votes
    FROM Vote
    GROUP BY candidateId 
)
SELECT c.name
FROM tmp
JOIN Candidate c
ON tmp.candidateId = c.id
ORDER BY votes DESC
LIMIT 1