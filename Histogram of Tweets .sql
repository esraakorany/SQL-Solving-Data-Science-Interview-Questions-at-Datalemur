SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM 
    (SELECT COUNT(tweet_id) AS tweet_bucket , user_id
    FROM tweets
    WHERE tweet_date BETWEEN '2022-1-1' AND '2022-12-31'
    GROUP BY user_id) AS new 
GROUP BY tweet_bucket;