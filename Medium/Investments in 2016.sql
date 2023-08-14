# CTE method (1135 ms)

WITH tmp AS
(
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
),
tmp1 AS 
(
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT * FROM tmp1)
AND (lat, lon) IN (SELECT * FROM tmp)

# Window Function method (948 ms)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
(
    SELECT pid, tiv_2015, tiv_2016, lat, lon,
    COUNT(*) OVER (PARTITION BY tiv_2015) AS filter1,
    COUNT(*) OVER (PARTITION BY lat, lon) AS filter2
    FROM Insurance
) AS tmp
WHERE filter1 > 1 AND filter2 = 1