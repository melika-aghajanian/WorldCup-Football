WITH cte AS (
    SELECT human.name as player_name, goal.time as goal_time, substitute.time as sub_time
    FROM goal
    JOIN player
    ON goal.player_id = player.id
    JOIN substitute
    ON player.id = substitute.player_id_in
    JOIN human
    ON player.id = human.id
)
SELECT player_name
FROM cte
WHERE goal_time > sub_time
GROUP BY player_name;
