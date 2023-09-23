WITH rank_spend AS (
    SELECT category, product, SUM(spend) AS total_spend,
        RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS order_product
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product)
SELECT category, product, total_spend
FROM rank_spend
WHERE order_product IN (1, 2);