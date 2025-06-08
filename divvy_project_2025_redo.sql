SELECT* 
FROM divvy_trips_pro2025.combined_divvy_pro255;

CREATE TABLE backup_combined_divvy_pro255 AS
SELECT* FROM divvy_trips_pro2025.combined_divvy_pro255;

SELECT* 
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;

ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN ride_date DATE;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET ride_date = DATE(started_at);

SELECT ride_date
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;

SELECT ride_date,
STR_TO_DATE(ride_date, '%Y-%m-%d')
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;






