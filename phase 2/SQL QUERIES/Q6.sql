WITH cte AS (
    SELECT match.id, COUNT(substitute.player_id_in) as subs
    FROM match
    JOIN substitute
    ON match.id = substitute.match_id
    GROUP BY match.id
)
SELECT COUNT(*)
FROM cte
WHERE subs < 5;
