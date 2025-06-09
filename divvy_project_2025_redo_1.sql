03_clean_backup_combined_divvy_pro255.sql
 
SELECT start_time
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
DROP COLUMN started_at;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN end_time TIME;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET end_time = time(ended_at);

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
DROP COLUMN ended_at;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN trip_month_name
VARCHAR(10);

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN ride_duration_minutes
INT;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET ride_duration_minutes = 
TIMESTAMPDIFF(MINUTE, start_time,end_time);

DELETE FROM divvy_trips_pro2025.backup_combined_divvy_pro255
WHERE ride_duration_minutes < 0;

DELETE FROM divvy_trips_pro2025.backup_combined_divvy_pro255
WHERE ride_duration_minutes > 100;

DELETE FROM divvy_trips_pro2025.backup_combined_divvy_pro255
WHERE ride_duration_minutes > 60;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET trip_month_name = MONTHNAME(ride_date);

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN day_of_week VARCHAR(10);

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET day_of_week = CASE 
DAYOFWEEK(ride_date)
WHEN 1 THEN 'Sunday'
WHEN 2 THEN 'Monday'
WHEN 3 THEN 'Tuesday'
WHEN 4 THEN 'Wednesday'
WHEN 5 THEN 'Thursday'
WHEN 6 THEN 'Friday'
WHEN 7 THEN 'Saturday'
END;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
RENAME COLUMN member_casual TO 
subscription_type;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN ride_date DATE
 AFTER ride_id;
 
ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN start_time time
AFTER ride_date;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN end_time time
AFTER start_time;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN ride_duration_minutes int
AFTER end_time;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN day_of_week VARCHAR(10)
AFTER ride_duration_minutes;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN trip_month_name VARCHAR(10)
AFTER day_of_week;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
MODIFY COLUMN subscription_type MEDIUMTEXT
AFTER trip_month_name;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET
ride_id = 
TRIM(ride_id),
rideable_type = 
TRIM(rideable_type),
start_station_name = 
TRIM(start_station_name),
start_station_id =
TRIM(start_station_id),
end_station_name = 
TRIM(end_station_name),
end_station_id =
TRIM(end_station_id),
subscription_type =
TRIM(subscription_type),
trip_month_name =
TRIM(trip_month_name),
day_of_week =
TRIM(day_of_week);

SELECT start_station_name
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
WHERE start_station_name IS NULL;

04_analyze_backup_combined_divvy_pro255.sql
 
SELECT subscription_type, COUNT(*) AS
num_trips
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
GROUP BY subscription_type;

SELECT MAX(ride_duration_minutes) AS
max_ride_duration_minutes,
MIN(ride_duration_minutes)
min_ride_duration_minutes
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;

DELETE FROM divvy_trips_pro2025.backup_combined_divvy_pro255
WHERE ride_duration_minutes < 1;

SELECT subscription_type,
avg(ride_duration_minutes) AS
average_duration_minutes
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
GROUP BY subscription_type;

SELECT start_station_name, COUNT(*)
AS number_of_trips
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
GROUP BY start_station_name
ORDER BY number_of_trips DESC
LIMIT 20;

SELECT dayname(ride_date)
AS day_of_week, COUNT(*) AS
number_of_trips
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
GROUP BY DAYNAME(ride_date);

SELECT MONTHNAME(ride_date) AS
MONTH, COUNT(*) AS number_of_trips
FROM divvy_trips_pro2025.backup_combined_divvy_pro255
GROUP BY MONTHNAME(ride_date);
