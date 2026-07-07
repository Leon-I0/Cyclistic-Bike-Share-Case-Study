SELECT 
member_casual,
start_station_name,
count(*) as num_trips 
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean`
group by member_casual, start_station_name
order by num_trips desc
limit 10