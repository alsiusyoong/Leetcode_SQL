# CTE Method (955 ms)

WITH tmp AS
(
    SELECT id, client_id, driver_id, status, request_at
    FROM Trips
    WHERE client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'client')
    AND driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'driver')
    AND request_at BETWEEN "2013-10-01" AND "2013-10-03"
)
SELECT request_at as Day,
ROUND(COUNT(IF(status LIKE "cancelled%", 1, NULL))/(COUNT(status)),2) 
as 'Cancellation Rate'
FROM tmp
GROUP BY request_at

# Subquery Method (1093 ms)

SELECT T.request_at as Day,
ROUND(COUNT(IF(T.status LIKE "cancelled%", 1, NULL))/(COUNT(T.status)),2) 
as 'Cancellation Rate'
FROM Trips T
WHERE
T.client_id NOT IN
(SELECT U.users_id from Users U WHERE U.banned = "Yes" and U.role = "client")
AND
T.driver_id NOT IN
(SELECT U.users_id from Users U WHERE U.banned = "Yes" and U.role = "driver")
AND
T.request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY request_at;