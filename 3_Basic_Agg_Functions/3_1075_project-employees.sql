# Write your MySQL query statement below

SELECT project_id,
    ROUND(
        SUM(experience_years)/COUNT(*), 2) AS average_years 
FROM Project
INNER JOIN Employee 
USING (employee_id)
GROUP BY project_id;