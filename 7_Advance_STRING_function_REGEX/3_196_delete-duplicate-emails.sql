# Write your MySQL query statement below
Delete p2
FROM Person p1
JOIN Person p2
WHERE p2.id > p1.id
AND p1.email = p2.email;