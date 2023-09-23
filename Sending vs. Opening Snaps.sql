WITH calc AS(
    SELECT ag.age_bucket, 
        SUM(CASE WHEN act.activity_type = 'open' THEN time_spent ELSE 0 END) AS open_time,
        SUM(CASE WHEN act.activity_type = 'send' THEN time_spent ELSE 0 END) AS send_time
    FROM activities AS act
    INNER JOIN age_breakdown as ag
    USING (user_id)
    WHERE act.activity_type IN ('open', 'send')
    GROUP BY ag.age_bucket)
SELECT age_bucket,
    ROUND(100.0*send_time/(open_time+send_time),2) AS send_perc,
    ROUND(100.0*open_time/(open_time+send_time),2) AS open_perc
FROM calc;