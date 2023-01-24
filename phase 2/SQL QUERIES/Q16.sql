USE Fifa_Project;

WITH cte AS (
    SELECT team.name as team_name, match.team1_goals, match.team2_goals, card.color as card_color, match.id as match_id
    FROM team
    JOIN player
    ON team.id = player.team_id
    JOIN card
    ON player.id = card.player_id
    JOIN match
    ON card.match_id = match.id
    WHERE color = 'red'
)
SELECT team_name
FROM cte
WHERE 
(team_name = (SELECT team1_id FROM match WHERE id = cte.match_id) AND team1_goals > team2_goals)
OR
(team_name = (SELECT team2_id FROM match WHERE id = cte.match_id) AND team2_goals > team1_goals)
GROUP BY team_name;
