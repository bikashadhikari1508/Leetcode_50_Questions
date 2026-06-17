# Write your MySQL query statement below
SELECT 
    product_id, 
    first_year, 
    quantity, 
    price
FROM (
    SELECT 
        product_id, 
        year AS first_year, 
        quantity, 
        price,
        -- Calculate the first year for this specific product across all rows
        MIN(year) OVER(PARTITION BY product_id) AS min_year
    FROM Sales
) AS sales_data
WHERE first_year = min_year;