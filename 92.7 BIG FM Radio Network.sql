/* Tables */
--Awards
--Hosts
--Onlinepresence
--Partnerships
--Showpartnerships
--Shows
--Stations

select * from awards;
select * from hosts;
select * from onlinepresence;
select * from partnerships;
select * from showpartnerships;
select * from shows;
select * from stations;

/* Questions  */

/* 1)Retrieve all stations in the "East" region?  */
/* 2)List all shows hosted by "Vrajesh Hirjee"?   */
/* 3)Count the number of awards each show has won?  */
/* 4)Find shows that have partnerships with "Spotify"?  /*
/* 5)Retrieve hosts who joined before 2010?  */
/* 6)List the shows and their launch dates in descending order of launch date?  */
/* 7)Find the total count of shows for each host?  */
/* 8)Show the online presence platforms with their links?  */
/* 9)Retrieve the stations in the "South" region launched after 2010?  */
/* 10)Rank hosts based on the number of shows they have hosted?  */

/* 1)Retrieve all stations in the "East" region?  */

select * from stations
where Location = 'East';

/* 2)List all shows hosted by "Vrajesh Hirjee"?   */
select * from hosts s 
inner join shows sh on s.HostID = sh.HostID
where HostName = 'Vrajesh Hirjee'

/* 3)Count the number of awards each show has won?  */

select s.ShowName, count(AwardID) As award_count from shows s 
inner join awards a on s.ShowID = a.ShowID 
group by 1
order by 2;

/* 4)Find shows that have partnerships with "Spotify"?  /*

select * from shows s 
left join showpartnerships sp on s.ShowID = sp.ShowID
left join  partnerships p on sp.PartnershipID = p.PartnershipID
where PartnerName = 'Spotify'

/* 5)Retrieve hosts who joined before 2010?  */

select HostID, HostName, JoinDate from hosts
where JoinDate not between '2020-01-01' and '2020-12-31'

/* 6)List the shows and their launch dates in descending order of launch date?  */

select H.HostID, s.ShowName, st.LaunchDate from shows s 
inner join stations st on s.StationID = st.StationID
order by st.LaunchDate desc; 

/* 7)Find the total count of shows for each host?  */

select HostID, HostName, sum(ShowCount) as No_of_Shows from hosts 
group by 1, 2
order by 3 desc;

/* 8)Show the online presence platforms with their links?  */

select PresenceID, PlatformName, Link  from onlinepresence;

/* 9)Retrieve the stations in the "South" region launched after 2010?  */

select StationID, StationName, LaunchDate from Stations
where Location = 'South' and year(LaunchDate)>'2010'

/* 10)Rank hosts based on the number of shows they have hosted?  */

select HostID, HostName, ShowCount,
       dense_rank() over(order by showCount desc) as Show_rank from hosts
       group by 1, 2;
       order by  3 desc;




















