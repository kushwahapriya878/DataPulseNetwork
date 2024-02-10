---Table---
Conferences
Countries
Leaders
Regions

use coptracker;
select * from conferences;
select * from countries;
select * from leaders;
select * from regions;

--Questions--
-- 1) List all countries in the "Asia" region ?
-- 2) Find the leader of India ?
-- 3) Count the number of conferences in each region ?
-- 4) Find conferences held in year 2022 ?
-- 5) List conferences with regional groups in Africa ?
-- 6) List all conferences with alternative names ?
-- 7) List all conferences held in a specific location (e.g., 'Berlin') ?
-- 8) Leadership Analysis with Region Labels ?
-- 9) Find the Difference in Years between the First and Last Conference ?
-- 10) Show the Next Conference for Each Conference ?
-- 11) When and where was the COP 28 conference held?
-- 12)Combine place and Region for Conference Locations ?

-- 1) List all countries in the "Asia" region ?
select * from countries c 
inner join regions r on c.RegionID = r.RegionID
where RegionName = 'Asia'

-- 2) Find the leader of India ?
select l.LeaderName from leaders l 
inner join countries c on l.CountryID = c.CountryID
where c.CountryName = 'India'

-- 3) Count the number of conferences in each region ?

select RegionalGroups, count(ConferenceID) as No_of_Conferences from conferences
group by 1;

-- 4) Find conferences held in year 2022 ?
select * from conferences
where Year = '2022'

-- 5) List conferences with regional groups in Africa ?
select * from conferences
where RegionalGroups like '%Africa%'

-- 6) List all conferences with alternative names ?
select * from conferences
where AlternativeName is not null;

-- 7) List all conferences held in a specific location (e.g., 'Berlin') ?
select * from conferences
where Location = 'Berlin';

-- 8) Leadership Analysis with Region Labels ?
select l.LeaderID, l.LeaderName, 
case 
when RegionID = 1 then 'Europe and USA'
when RegionID = 2 then 'Middle East'
when RegionID = 3 then 'Asia'
when RegionID = 4 then 'Africa'
when RegionID = 5 then 'Latin America'
when RegionID = 6 then 'Others' end as RegionLabel 
from leaders l 
inner join countries c on l.CountryID = c.CountryID
order by l.LeaderID;

-- 9) Find the Difference in Years between the First and Last Conference ?
select max-min as Year_diff from
(select min(year) as min, max(year) as max  from conferences) t 

-- 10) Show the Next Conference for Each Conference ?

select ConferenceID, Name,
       lead(Name) over(order by Year asc) as NextConference from conferences;

-- 11) When and where was the COP 28 conference held?

select * from Conferences
where Name = 'COP 28';

-- 12)Combine place and Region for Conference Locations ?
select ConferenceID, Name, concat(Location,' ',RegionalGroups) as ConferenceLocation
 from Conferences;





