WITH cte AS (
    SELECT stadium.id, stadium.name, COUNT(goal.player_id) as penalties
    FROM stadium
    JOIN match
    ON stadium.id = match.stadium_id
    JOIN goal
    ON match.id = goal.match_id
    WHERE goal.is_penalty = 1 AND stadium.city = 'Qatar'
    GROUP BY stadium.id, stadium.name
)
SELECT TOP 1 *
FROM cte
ORDER BY penalties ASC;
