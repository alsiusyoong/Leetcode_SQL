# CTE method (662 ms)

WITH tmp AS
(
    SELECT 
    id,
    temperature,
    recordDate,
    LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date
    FROM Weather 
    ORDER BY recordDate
)
SELECT id FROM tmp
WHERE temperature > previous_temp
AND datediff(recordDate, previous_date) = 1

# 2 table method (839 ms)

SELECT w1.id
FROM Weather w1, Weather w2
WHERE dateDiff(w1.recordDate, w2.recordDate) = 1 
AND w1.temperature > w2.temperature;