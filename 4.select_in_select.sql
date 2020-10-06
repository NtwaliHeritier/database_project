1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2.
select name from world where continent='Europe' and gdp/population>(select gdp/population from world where name='United Kingdom')

3.
select name, continent from world where continent = (select continent from world where name='Argentina') or continent= (select continent from world where name='Australia') order by name

4.
select name from world where population > (select population from world where name='Canada') and population < (select population from world where name='Poland')

5.
select name, concat(round(population*100/(select population from world where name='Germany')), '%') from world where continent='Europe'

6.
select name from world where gdp> all(select gdp from world where continent='Europe' and gdp>0)

7.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE x.continent=y.continent
          AND area>0)

8.
select continent, name from world x where left(name, 2)<=all(select left(name, 2) from world y where x.continent=y.continent)

9.
select name, continent, population from world where continent not in (select distinct continent from world where population>25000000)

10.
select name, continent from world x where population/3>all(select population from world y where x.continent=y.continent and population>0 and y.name not like x.name)