WITH cte AS (
    SELECT player.id, COUNT(goal.player_id) as goals
    FROM player
    JOIN goal
    ON player.id = goal.player_id
    GROUP BY player.id
)
SELECT TOP 1 *
FROM cte
ORDER BY goals DESC;
