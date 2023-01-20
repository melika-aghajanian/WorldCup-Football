WITH cte AS (
    SELECT match.id, 
	SUM(CASE WHEN goal.time <= 45 THEN 1 ELSE 0 END) as first_half_goals, 
	SUM(CASE WHEN goal.time > 45 THEN 1 ELSE 0 END) as second_half_goals
    FROM match
    JOIN goal
    ON match.id = goal.match_id
    GROUP BY match.id
)
SELECT *
FROM cte
WHERE first_half_goals > second_half_goals;
