create database 120_years_of_Olympic_history_athletes_and_results
use 120_years_of_Olympic_history_athletes_and_results

/* Q.1 How many olympics games have been held?*/
select count(Games) as Total_Games
 from athlete_events


/* Q.2 List down all Olympics games held so far.*/

select row_number() over(), Event as Olympics_games from athlete_events


/* Q.3 Mention the total no of nations who participated in each olympics game? */

select count(distinct city) as  no_of_nations from  athlete_events


/* Q.4 Which year saw the highest and lowest no of countries participating in olympics? */

select Year, count( distinct city) as countries from athlete_events
group by 1
order by countries desc
limit 1

select Year, count( distinct city) as countries from athlete_events
group by 1
order by countries asc
limit 1;


/* Q.5 Identify the sport which was played in all summer olympics. */

with t1 as(
select count(distinct Games) as total_summer_games from athlete_events
where Season = 'Summer')
with t2 as
(select Sport, Games
from athlete_events
where season = 'Summer')
with t3 as
(select Sport, count(Games) as no_of_games
from t2
group by Sport
select *
from t3
join t1 on t1.total_summer_games = t3.no_of_games


/* Q.6 Which Sports were just played only once in the olympics? */

select sport, count(event) as t from athlete_events
group by sport
having count(event) = 1


/* Q.7 Fetch the total no of sports played in each olympic games. */

select Games, count(Sport) as total_sports_played from athlete_events
group by Games


/* Q.8 Fetch details of the oldest athletes to win a gold medal. */

select * from athlete_events
select Name, Year, Medal from athlete_events
where Medal = 'Gold'
order by Year;


/* Q.9 Find the Ratio of male and female athletes participated in all olympic games. */

select sum(case when Sex = "F" then 1 else 0 end) /
sum(case when Sex = "M" then 1 else 0 end) as male_female_ratio
from athlete_events


/* Q.10 Fetch the top 5 athletes who have won the most gold medals. */

select Name, count(Medal) as total_medals
 from athlete_events
 where Medal = "Gold"
 group by Name
 order by 2 desc
 limit 5;


/* Fetch the top 5 athletes who have won the most medals (gold/silver/bronze). */

select Name, count(Medal) as total_medals
from athlete_events
where Medal in("Gold", "Silver", "bronze")
group by Name 
order by 2 desc
limit 5;

/* Q.11 Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won. */
with cte1 as
(select nr.region, count(ae.Medal) as total_medals
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
where ae.Medal in("Gold", "Silver", "Bronze")
group by 1),
 cte2 as
(select *, dense_rank() over(order by total_medals desc) as rnk from cte1)
(select * from cte2
where rnk<= 5)


/* Q.12 List down total gold, silver and broze medals won by each country. */

select nr.region, 
sum(case when ae.Medal = "Gold" then 1 else 0 end) as Gold,
sum(case when ae.Medal = "Silver" then 1 else 0 end) as Silver,
sum(case when ae.Medal = "Bronze" then 1 else 0 end) Bronze 
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
group by 1
order by 2 desc,
		 3 desc,
         4 desc


/* Identify which country won the most gold, most silver and most bronze medals in each olympic games. */

with cte1 as
(select nr.region, 
sum(case when ae.Medal = "Gold" then 1 else 0 end) as Gold,
sum(case when ae.Medal = "Silver" then 1 else 0 end) as Silver,
sum(case when ae.Medal = "Bronze" then 1 else 0 end) Bronze 
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
group by 1
),
cte2 as
(select *, dense_rank() over(order by Gold desc, Silver desc, Bronze desc) as rnk from cte1)
(select * from cte2
where rnk = 1)


/* Q.13 Which countries have never won gold medal but have won silver/bronze medals? */

select region, Gold, Silver, Bronze from
(select nr.region, 
sum(case when ae.Medal = "Gold" then 1 else 0 end) as Gold,
sum(case when ae.Medal = "Silver" then 1 else 0 end) as Silver,
sum(case when ae.Medal = "Bronze" then 1 else 0 end) Bronze 
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
group by 1) t
where Gold = 0 and Silver >= 1 and Bronze >=1 
order by region asc;


/* Q.14 In which Sport/event, India has won highest medals. */

select nr.region, ae.Event, count(ae.Medal) as total_medals
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
where region = "India"
group by 1,2
order by 3 desc limit 1;


/* Q.15 Break down all olympic games where india won medal for Hockey and how many medals in each olympic games. */

select nr.region, ae.Sport, ae.Games, count(ae.Medal) as total_medals
from athlete_events ae 
left join noc_regions_a nr on ae.NOC = nr.NOC
where region = "India" and Sport = "Hockey" and Medal = "Gold"
group by 1,2,3
order by 4 desc;