WITH cte AS (
    SELECT match.best_player, player.id, human.name as player_name
    FROM match
    JOIN player
    ON match.best_player = player.id
    JOIN human
    ON player.id = human.id
)
SELECT player_name
FROM cte
GROUP BY player_name;
