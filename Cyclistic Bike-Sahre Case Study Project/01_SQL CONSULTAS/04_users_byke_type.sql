SELECT  
member_casual,
rideable_type,
count(*) as num_trips
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean` 
group by member_casual, rideable_type
order by num_trips desc