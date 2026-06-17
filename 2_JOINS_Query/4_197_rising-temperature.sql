# Write your MySQL query statement below
WITH CTE AS (
    SELECT id, recordDate, temperature, LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
)

SELECT id
FROM CTE
WHERE DATEDIFF(recordDate, prev_date) = 1
AND temperature > prev_temp;