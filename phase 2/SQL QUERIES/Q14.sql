WITH cte AS (
    SELECT team.name as team_name, COUNT(CASE WHEN card.color = 'red' THEN 1 ELSE NULL END) as red_cards, COUNT(CASE WHEN card.color = 'yellow' THEN 1 ELSE NULL END) as yellow_cards
    FROM team
    JOIN player
    ON team.id = player.team_id
    JOIN card
    ON player.id = card.player_id
    GROUP BY team.name
)
SELECT top 1 team_name, red_cards + yellow_cards as total_cards
FROM cte
ORDER BY total_cards DESC;
