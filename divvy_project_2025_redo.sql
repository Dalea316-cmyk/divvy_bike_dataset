01_view_combined_data_table.sql
  
SELECT* 
FROM divvy_trips_pro2025.combined_divvy_pro255;

02_create_table_backup_combined_divvy_pro255.sql
  
CREATE TABLE backup_combined_divvy_pro255 AS
SELECT* FROM divvy_trips_pro2025.combined_divvy_pro255;

03_clean_backup_combined_divvy_pro255.sql
  
ALTER TABLE divvy_trips_pro2025.backup_combined_divvy_pro255
ADD COLUMN ride_date DATE;

UPDATE divvy_trips_pro2025.backup_combined_divvy_pro255
SET ride_date = DATE(started_at);

SELECT ride_date,
STR_TO_DATE(ride_date, '%Y-%m-%d')
FROM divvy_trips_pro2025.backup_combined_divvy_pro255;






