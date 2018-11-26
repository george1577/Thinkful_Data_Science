-- What are the three longest trips on rainy days?
WITH trip_plus
AS (
SELECT (CASE WHEN start_date IS NOT NULL THEN SUBSTRING(start_date,1,10) END) AS date,
        *
FROM trips
)
SELECT t.*
FROM trip_plus AS t
LEFT JOIN weather AS w
ON t.date = w.date
WHERE w.events = 'Rain'
ORDER BY t.duration DESC
LIMIT 3









-- Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
WITH station_trip
AS (
SELECT s.name,
       COUNT(*) AS number_trips
FROM trips AS t
LEFT JOIN stations AS s
ON t.start_station = s.name
GROUP BY s.name
)
SELECT s.*
FROM station_trip AS s
LEFT JOIN stations AS st
ON s.name = st.name
ORDER BY st.dockcount

-- (Challenge) What's the length of the longest trip for each day it rains anywhere?
WITH trip_plus
AS (
SELECT (CASE WHEN start_date IS NOT NULL THEN SUBSTRING(start_date,1,10)
       END) AS date,
        *
FROM trips
)
SELECT t.date,
       MAX(duration) AS longest_trip_length
FROM trip_plus AS t
LEFT JOIN weather AS w
ON t.date = w.date
WHERE w.events LIKE 'Rain'
GROUP BY t.date
