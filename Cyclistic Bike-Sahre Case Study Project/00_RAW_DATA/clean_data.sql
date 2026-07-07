-- ==========================================================
-- Query: Data Cleaning
-- Objective:
-- Create a clean dataset for the Cyclistic case study by:
--   • Removing duplicate rides
--   • Removing trips with zero or negative duration
--   • Creating new analytical columns
-- ==========================================================

CREATE OR REPLACE TABLE  `cyclistic-project-x0.cyclistic_historial_2025_26.cyclistic_clean` AS
SELECT *,
-- Date of the trip
    DATE(started_at) AS start_date,

    -- Time of the trip
    TIME(started_at) AS start_time,

    -- Month number
    EXTRACT(MONTH FROM started_at) AS month,

    -- Month name
    FORMAT_DATE('%B', DATE(started_at)) AS month_name,

    -- Day of week
    FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,

    -- Hour of day
    EXTRACT(HOUR FROM started_at) AS hour,

    -- Trip duration in minutes
    ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND)/ 60, 2)AS trip_duration,

     CASE
    WHEN start_lat IS NULL
      OR start_lng IS NULL
      OR end_lat IS NULL
      OR end_lng IS NULL
    THEN NULL

    ELSE ROUND(
        ST_DISTANCE(
            ST_GEOGPOINT(start_lng, start_lat),
            ST_GEOGPOINT(end_lng, end_lat)
        ) / 1000,
        2
    )
END AS distance_km

FROM `cyclistic-project-x0.cyclistic_historial_2025_26.table 12 meses` 
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0

QUALIFY
ROW_NUMBER() OVER(PARTITION BY ride_id ORDER BY started_at)=1;