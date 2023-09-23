WITH july AS(
    SELECT * 
    FROM user_actions
    WHERE event_date BETWEEN '2022-7-1' AND '2022-7-31'),
    
june AS(
    SELECT * 
    FROM user_actions
    WHERE event_date BETWEEN '2022-6-1' AND '2022-6-30')

SELECT 
    EXTRACT(MONTH FROM july.event_date) AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM july 
INNER JOIN june
USING(user_id)
GROUP BY month;
  