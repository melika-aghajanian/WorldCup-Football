SELECT stadium.name, stadium.capacity
FROM stadium
JOIN match
ON stadium.id = match.stadium_id
JOIN team as t1
ON match.team1_id = t1.id
JOIN team as t2
ON match.team2_id = t2.id
WHERE ((t1.nationality = 'France' OR t2.nationality = 'France') 
OR (t1.nationality = 'Argentina' OR t2.nationality = 'Argentina'))
AND match.stage != 'group stage'
