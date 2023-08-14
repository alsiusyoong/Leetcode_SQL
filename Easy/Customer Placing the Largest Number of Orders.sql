# Subquery method (1089 ms)

SELECT customer_number 
FROM 
(
    SELECT *, COUNT(order_number) OVER (PARTITION BY customer_number) AS filter1
    FROM Orders
) tmp
ORDER BY filter1 DESC
LIMIT 1

# CTE method (1120 ms)

SELECT customer_number 
FROM 
(
    SELECT *, COUNT(order_number) OVER (PARTITION BY customer_number) AS filter1
    FROM Orders
) tmp
ORDER BY filter1 DESC
LIMIT 1

# Simple (1444 ms)

SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1