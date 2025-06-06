# Divvy Bike Sharing Data Analysis: Uncovering Chicago's Cycling Habits
"This dataset compiles individual trip data from Divvy, Chicago's popular bike-sharing system. It provide a comprehensive look ito rider behaviour, popular routes, analyzeseasonality, and usage patterns across the entirety of 2022 to highlight trends in a major urban bike-sharing system. Originally sourced for the Google Data Analytics Capstone project. This dataset offers rich opportunities for exploring urban mobility."
## Data Source
The data used in this analysis is publicly available from the Divvy Bikes website. Specifically, this project utilized the following dataset(s):
* [Divvy Trip Data - 2022](https://divvy-tripdata.s3.amazonaws.com/index.html
The dataset contains detailedinformation about each trip, including:
* Ride ID
* Start and End Station Names/IDs
* Start and End Times
* Start and End Latitude/Longitude
* Subscription Type (Member/ Casual)
* Rideable Type (classic_bike, electric_bike, docked_bike)
## Key Questions & Objectives
This analysis sought to answer the following questions:
* What are the overall trends in Divvy ridership (e.g.,total trips, total duration)?
* How does ridership vary by time of day, day of week, and month?
* What are the busiest Divvy stations (start and end)?
* What are the most popular routes?
* Is there a difference in riding habits between casual riders and annual members?
* How do different rideable types (classic vs. electric vs. docked) impact trip patterns?
## Methodology & Tools
The analysis was conducted using the following steps:
1. **Data Collection:**
Download raw CSV files from the Divvy website in the Google Data Analytics Capestone Project.
2. **Data Cleaning & Preprocessing:** Handled missing values, converted data types, and filtered irrelevent data.
3. **Feature Engineering:**
Created new features such as 'ride_duration_minutes', 'day_of_week', 'ride_date,'start_time' and 'end_time' (in hours), 'name_of_month', 'month_order' and 'total_trips'.
4. **Exploratory Data Analysis(EDA):** Performed statistical summaries and initial visualizations to understand data distributions and relationships.
5. **In-depth Analysis:** Focused on specific questions related to rider types, temporal patterns, station popularity and ride duration.
**Tools and Technologies:**
* **MySQL(RDBMS):** Primary Structured Query Language.
* **SQL:** For data manipulation, summary statistics and analysis.
* **Power BI Desktop:** For data visualization and reporting.
* **Git & GitHub:** For version control and project hosting.
## Key Findings & Insights
* **Peak Ridership:** Ri
