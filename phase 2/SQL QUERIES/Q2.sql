WITH cte AS (
    SELECT referee.id, COUNT(match.id) as matches
    FROM referee
    JOIN referee_team 
    ON referee.id = referee_team.head_id
    JOIN match
    ON referee_team.id = match.referee_team_id
    GROUP BY referee.id
)
SELECT TOP 1 *
FROM cte
ORDER BY matches DESC;
