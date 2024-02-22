--MALDIVES VS LAKSHADWEEP SQL ANALYSIS

--Table Name
Destination
TouristAttractions
TouristArrivals
IndianTourists

select * from destination;
select * from indiantourists;
select * from touristarrivals;
select * from touristattractions

--Questions
1)Retrieve the number of visitors to the Maldives in 2019?
2)Retrieve the average budget per day and best time to visit for destinations with more than 10,000 tourists in 2022?
3)Retrieve the unique features of tourist attractions in Lakshadweep?
4)Retrieve the number of Indian tourists who visited the Maldives in 2021?
5)Find the destinations with the highest tourism revenue in 2022?

1)Retrieve the number of visitors to the Maldives in 2019?

select d.DestinationID, d.Name,
sum(NumberofVisitors) as Total_visitors
from destination d 
left join touristarrivals t
on d.DestinationID = t.DestinationID
where Year ='2019' and Name = 'Maldives'
group by 1,2

2)Retrieve the average budget per day 
and best time to visit for destinations with more than 10,000 tourists in 2022?

select AverageBudgetPerDay,
BestTimeToVisit,
sum(NumberofVisitors) as Total_tourist
from destination d
left join touristarrivals t
on d.DestinationID = t.DestinationID
where Year='2022' and NumberofVisitors > 10000
group by 1,2;

3)Retrieve the unique features of tourist attractions in Lakshadweep?
select distinct d.Name,
d.UniqueFeatures
from destination d
left join touristattractions t
on d.DestinationID = t.DestinationID
where  d.Name='Lakshadweep'


4)Retrieve the number of Indian tourists who visited the Maldives in 2021?
select d.Name,
it.NumberofTourists as Indian_tourists
from destination d 
left join indiantourists it
on  d.DestinationID = it.destinationID
where it.Year = '2021' and d.Name = 'Maldives'

5)Find the destinations with the highest tourism revenue in 2022?
with cte as(select d.name, (d.AverageBudgetPerDay * t.NumberofVisitors) as highest_tourism_revenue
from destination d
left join touristarrivals t
on d.DestinationID = t.DestinationID
where t.Year = '2022')
select name, highest_tourism_revenue
from cte 
where highest_tourism_revenue = (select max(highest_tourism_revenue) from cte)


select * from touristarrivals;



