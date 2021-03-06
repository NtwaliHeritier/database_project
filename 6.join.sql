1.
SELECT matchid, player FROM goal 
  WHERE teamid='GER'

2.
SELECT id,stadium,team1,team2
  FROM game where id=1012

3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) where teamid='GER'

4.
select team1, team2, player from game join goal on game.id=goal.matchid where player like 'Mario%'

5.
SELECT player, teamid, coach, gtime
  FROM goal join eteam on teamid=id 
 WHERE gtime<=10

6.
 select mdate, teamname from game join eteam on team1=eteam.id where coach='Fernando Santos'

7.
select player from goal join game on matchid=game.id where stadium='National Stadium, Warsaw'

8.
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' or team2='GER') and teamid!='GER'

9.
SELECT teamname, count(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

10.
select stadium, count(*) from game join goal on game.id=matchid group by stadium

11.
SELECT matchid, count(goal.matchid)
  FROM game JOIN goal ON matchid=id 
 WHERE (team1 = 'POL' OR team2 = 'POL') group by matchid

12.
select matchid, mdate, count(*) from game join goal on id=matchid where teamid='GER' group by id

13.
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=m.team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
 FROM game LEFT JOIN goal ON matchid = id
 GROUP BY id
 ORDER BY mdate, matchid, team1, team2;