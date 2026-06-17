# Write your MySQL query statement below
SELECT s.user_id,
        ROUND(AVG
                (IF
                    (c.action = 'confirmed', 1.00,0)
                    ),
                    2) AS confirmation_rate 
FROM Signups s
LEFT JOIN Confirmations c
USING (user_id)
GROUP BY s.user_id;