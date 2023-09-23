WITH table_1 AS (
    SELECT a.artist_name,
        DENSE_RANK() OVER(ORDER BY COUNT(g.rank) DESC) artist_rank
    FROM songs s
    LEFT JOIN global_song_rank g
    USING(song_id)
    LEFT JOIN artists a
    ON s.artist_id = a.artist_id
    WHERE rank <= 10
    GROUP BY a.artist_name)

SELECT artist_name, artist_rank
FROM table_1
WHERE artist_rank <= 5;