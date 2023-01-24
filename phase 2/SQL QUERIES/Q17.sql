USE Fifa_Project;

WITH cte AS (
    SELECT human.name as coach_name, human.nationality as coach_nationality, team.name as team_name, team.nationality as team_nationality
    FROM coach
    JOIN human
    ON coach.id = human.id
    JOIN team
    ON coach.team_id = team.id
)
SELECT coach_name, coach_nationality
FROM cte
WHERE coach_nationality = team_nationality
GROUP BY coach_name, coach_nationality;
