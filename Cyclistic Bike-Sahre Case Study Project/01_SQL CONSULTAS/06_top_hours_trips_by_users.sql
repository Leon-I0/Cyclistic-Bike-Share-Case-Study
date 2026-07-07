SELECT
member_casual,
hour,
count(*) as num_trips 
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean`
group by member_casual, hour
order by member_casual, num_trips desc
