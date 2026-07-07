SELECT  
member_casual,
avg(distance_km) as avg_distance
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean_01` 
group by member_casual
order by avg_distance desc