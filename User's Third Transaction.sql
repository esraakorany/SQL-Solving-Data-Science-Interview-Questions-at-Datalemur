SELECT user_id, spend, transaction_date 
FROM 
    (SELECT user_id, spend, transaction_date,
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank_num
    FROM transactions) AS new
WHERE rank_num = 3;