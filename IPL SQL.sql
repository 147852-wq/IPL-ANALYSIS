SELECT * FROM ipl.ipl_matches_2008_2022;

USE ipl
SELECT * FROM ipl_matches_2008_2022 LIMIT 10;

SELECT season, COUNT(*) AS total_matches
FROM ipl_matches_2008_2022
GROUP BY season
ORDER BY season;

SELECT winning_team, COUNT(*) AS total_wins
FROM ipl_matches_2008_2022
WHERE winning_team  <> ''
GROUP BY winning_team
ORDER BY total_wins DESC;

SELECT 
    (winner = toss_winner) AS toss_decision,
    COUNT(*) AS matches
FROM ipl_matches_2008_2022
GROUP BY toss_decision;

SELECT player_of_match, COUNT(*) AS awards
FROM ipl_matches_2008_2022
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

SELECT season, team1, team2, winner_team, win_by_runs
FROM ipl_matches_2008_2022
ORDER BY win_by_runs DESC
LIMIT 5;





