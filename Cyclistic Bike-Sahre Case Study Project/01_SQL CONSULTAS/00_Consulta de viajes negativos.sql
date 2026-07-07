SELECT
    COUNT(*) AS negative_trips
FROM `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistc_clean` 
where trip_duration < 0