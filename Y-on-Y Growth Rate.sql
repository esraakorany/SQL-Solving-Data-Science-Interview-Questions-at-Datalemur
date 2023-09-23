WITH new AS(
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS year,
        product_id, 
        SUM(spend) AS curr_year_spend 
    FROM user_transactions
    GROUP BY product_id, year
    ORDER BY product_id, year),
pre_table AS(
    SELECT year, 
         product_id,
         curr_year_spend,
         LAG(curr_year_spend) OVER(PARTITION BY product_id ROWS 1 PRECEDING)
         AS prev_year_spend
    FROM new)
    
SELECT year,
    product_id, 
    curr_year_spend,
    prev_year_spend,
    ROUND(100*(curr_year_spend-prev_year_spend)/prev_year_spend,2)
    AS yoy_rate
FROM pre_table;