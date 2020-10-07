1.
select count(id) from stops

2.
select id from stops where name='Craiglockhart'

3.
select stops.id, stops.name from stops join route on stops.id=route.stop where route.num='4' and route.company='LRT'

4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num having count(*)=2

5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
 AND b.stop=149;

6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id) where stopa.name='Craiglockhart' and stopb.name='London Road'

7.
select a.company, a.num from route a join route b on (a.company=b.company and a.num=b.num) where a.stop=115 and b.stop=137 

8.
select a.company, a.num from route a join route b on (a.company=b.company and a.num=b.num) join stops c on a.stop=c.id join stops d on b.stop=d.id where c.name='Craiglockhart' and d.name='Tollcross'

9.
SELECT stopb.name, a.company, a.num
  FROM route a JOIN route b ON
   (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop = stopa.id)
    JOIN stops stopb ON (b.stop = stopb.id)
 WHERE stopa.name = 'Craiglockhart';

10.
SELECT first.num, first.company, first.name, second.num, second.company
  FROM (SELECT a.company, a.num, stopb.id intermediate, stopb.name
             FROM route a JOIN route b ON
                (a.company=b.company AND a.num=b.num)
              JOIN stops stopa ON (a.stop = stopa.id)
              JOIN stops stopb ON (b.stop = stopb.id)
            WHERE stopa.name = 'Craiglockhart') first
  JOIN (SELECT c.company, c.num, c.stop intermediate
             FROM route c JOIN route d ON
               (c.company=d.company AND c.num=d.num)
              JOIN stops stopd ON (d.stop = stopd.id)
            WHERE stopd.name = 'Lochend') second
   ON (first.intermediate = second.intermediate)
ORDER BY first.num, first.name, second.num;