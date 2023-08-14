# Join method (1010 ms)

SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE customerId IS NULL

# Without join (1177 ms)

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
)