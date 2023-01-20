WITH cte AS (
    SELECT 
    head_id,
    COUNT(CASE WHEN goal.is_penalty=1 THEN 1 ELSE NULL END) as penalties_taken
    FROM referee_team
    JOIN match
    ON referee_team.id = match.referee_team_id
    JOIN goal
    ON match.id = goal.match_id
    GROUP BY head_id
)
SELECT head_id, penalties_taken
FROM cte
ORDER BY penalties_taken DESC;
