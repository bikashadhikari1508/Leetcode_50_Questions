SELECT 
    ROUND(COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id


-- SOLVED BY MS SQL SERVER
    
WITH first_login AS
(
    SELECT
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        1.0 * COUNT(a.player_id) / COUNT(f.player_id),
        2
    ) AS fraction
FROM first_login f
LEFT JOIN Activity a
    ON f.player_id = a.player_id
    AND DATEDIFF(day, f.first_date, a.event_date) = 1;
