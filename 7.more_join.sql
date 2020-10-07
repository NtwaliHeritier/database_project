1.
SELECT id, title
 FROM movie
 WHERE yr=1962

2.
select yr from movie where title='Citizen Kane'

3.
select id, title, yr from movie where title like '%Star Trek%' order by yr

4.
select id from actor where name= 'Glenn Close'

5.
select id from movie where title='Casablanca'

6.
select name from actor where id=any(select actorid from casting where movieid='11768')

7.
select name from actor join casting on actorid=actor.id join movie on movieid=movie.id where title='Alien'

8.
SELECT m.title FROM movie m JOIN casting c
  ON m.id = c.movieid 
   JOIN actor a ON a.id = c.actorid
  WHERE a.name = 'Harrison Ford';

9.
SELECT m.title FROM movie m JOIN casting c
  ON m.id = c.movieid 
   JOIN actor a ON a.id = c.actorid
  WHERE a.name = 'Harrison Ford' and c.ord!=1;

10.
select m.title, a.name from movie m join casting c on m.id=c.movieid join actor a on c.actorid=a.id where m.yr=1962 and c.ord=1

11.