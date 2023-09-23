SELECT candidate_id
FROM
    (SELECT candidate_id, COUNT(skill) AS skill_num
    FROM candidates
    WHERE skill IN ('Python','Tableau','PostgreSQL')
    GROUP BY candidate_id) AS new
WHERE skill_num = 3
ORDER BY candidate_id;