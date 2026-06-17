# Write your MySQL query statement below
SELECT 
    ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage
FROM (
    SELECT 
        order_date, 
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rnk
    FROM Delivery
) AS ranked_delivery
WHERE rnk = 1;



-- using CTE 

WITH first_orders AS
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY customer_id
               ORDER BY order_date
           ) AS rn
    FROM Delivery
)

SELECT
    ROUND(
        AVG(order_date = customer_pref_delivery_date) * 100,
        2
    ) AS immediate_percentage
FROM first_orders
WHERE rn = 1;