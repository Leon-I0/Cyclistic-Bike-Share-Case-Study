SELECT  
member_casual,
day_of_week,
count(*) as num_trips
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean` 
group by member_casual, day_of_week
order by num_trips desc