# CTE Method

WITH tmp AS 
(
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31'
) 
SELECT tmp.product_id, p.product_name
FROM tmp
JOIN Product p
ON tmp.product_id = p.product_id

# Without CTE 

SELECT s.product_id, p.product_name
FROM Sales s, Product p
WHERE s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31'