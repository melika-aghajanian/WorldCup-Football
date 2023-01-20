WITH cte AS (
    SELECT human.name, human.age
    FROM player
    JOIN goal
    ON player.id = goal.player_id
    JOIN human
    ON player.id = human.id
)
SELECT TOP 1 *
FROM cte
ORDER BY age DESC;
