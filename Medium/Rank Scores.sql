SELECT score,
DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores;

#===============================

# Difference between DENSE_RANK() and RANK()
# The following statement uses both DENSE_RANK()and RANK() functions to assign a rank to each row of the result set:

SELECT score,
DENSE_RANK() OVER (ORDER BY score DESC) AS 'dense_rank',
RANK() OVER (ORDER BY score DESC) AS 'rank',
FROM Scores;

Output:
+-------+------+------------+
| score | rank | dense_rank |
+-------+------+------------+
| 4.00  | 1    |     1      |
| 4.00  | 1    |     1      |
| 3.85  | 2    |     2      |
| 3.65  | 3    |     3      |
| 3.65  | 3    |     3      |
| 3.50  | 4    |     4      |
+-------+------+------------+