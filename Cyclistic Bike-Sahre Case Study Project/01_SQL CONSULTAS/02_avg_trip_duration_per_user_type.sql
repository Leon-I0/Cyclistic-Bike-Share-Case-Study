SELECT  
member_casual,
avg(ride_lenght_min) avg_trip_duration_min
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean` 
group by member_casual