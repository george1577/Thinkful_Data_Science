-- What are the three longest trips on rainy days?
WITH rain
AS (
SELECT DISTINCT DATE(date) AS date
FROM weather
WHERE events = 'Rain'
)
SELECT t.*
FROM trips AS t
JOIN rain AS r
ON DATE(t.start_date) = r.date
ORDER BY t.duration DESC
LIMIT 3

-- Which station is full most often?
SELECT station_id,
       SUM((CASE WHEN docks_available = 0 THEN 1 END)) AS empty_dock_freq
FROM status
GROUP BY station_id
ORDER BY empty_dock_freq DESC

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
WITH rain
AS (
SELECT DISTINCT DATE(date) AS date
FROM weather
WHERE events = 'Rain'
)
SELECT DATE(t.start_date),
       MAX(duration) AS longest_trip_length
FROM trips AS t
JOIN rain AS r
ON DATE(t.start_date) = r.date
GROUP BY DATE(t.start_date)
ORDER BY longest_trip_length DESC
