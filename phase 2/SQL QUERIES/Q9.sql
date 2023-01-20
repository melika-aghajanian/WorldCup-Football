WITH cte AS (
    SELECT team.name, COUNT(goal.player_id) as goals_scored, match.id
    FROM team
    JOIN player
    ON team.id = player.team_id
    JOIN goal
    ON player.id = goal.player_id
    JOIN match
    ON goal.match_id = match.id
    GROUP BY team.name, match.id

)
SELECT name, AVG(goals_scored)
FROM cte
GROUP BY name
ORDER BY AVG(goals_scored) DESC;

