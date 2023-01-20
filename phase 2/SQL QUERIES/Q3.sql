SELECT human.name, goal.time as minute
FROM player
JOIN goal
ON player.id = goal.player_id
JOIN human
ON player.id = human.id
WHERE goal.time > 80
