WITH cte AS (
    SELECT team.nationality as team_name, human.nationality as coach_nationality
    FROM team
    JOIN coach
    ON team.id = coach.team_id
    JOIN human
    ON coach.id = human.id
)
SELECT team_name
FROM cte
WHERE coach_nationality = team_name
GROUP BY team_name;
