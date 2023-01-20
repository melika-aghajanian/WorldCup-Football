WITH cte AS (
    SELECT coach.id as coach_id, human.name as coach_name, team.name as team_name, match.stage
    FROM coach
    JOIN team
    ON coach.team_id = team.id
    JOIN match
    ON team.id = match.team1_id OR team.id = match.team2_id
    JOIN human
    ON coach.id = human.id
)
SELECT coach_name
FROM cte
WHERE stage = 'group stage' AND NOT EXISTS (
    SELECT 1
    FROM match
    JOIN team
    ON team.id = match.team1_id OR team.id = match.team2_id
    WHERE (team.name = cte.team_name AND match.stage != 'group stage')
)
GROUP BY coach_name;
