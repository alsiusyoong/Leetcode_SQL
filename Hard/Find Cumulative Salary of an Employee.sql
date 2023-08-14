# Window Function (747 ms)

SELECT id, month, salary
FROM
(
    SELECT id, month, 
    SUM(salary) OVER (PARTITION BY id ORDER BY month RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) AS salary,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY month DESC) AS month_order
    FROM Employee 
) tmp
WHERE month_order > 1