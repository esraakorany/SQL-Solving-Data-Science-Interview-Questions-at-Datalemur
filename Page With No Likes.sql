SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l
USING(page_id)
GROUP BY p.page_id
HAVING COUNT(liked_date) = 0
ORDER BY p.page_id;