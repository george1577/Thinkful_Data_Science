-- What was the hottest day in our data set? Where was that?
SELECT date,
       zip,
       maxtemperaturef AS max_temp
FROM weather
WHERE maxtemperaturef =
(SELECT MAX(maxtemperaturef)
 FROM weather)

-- How many trips started at each station?
SELECT start_station,
       COUNT(*) AS number_trips
FROM trips
GROUP BY start_station

-- What's the shortest trip that happened?
SELECT *
FROM trips
WHERE duration = 
(SELECT MIN(duration)
 FROM trips

-- What is the average trip duration, by end station?
SELECT end_station,
       AVG(duration) AS avg_trip_duration
FROM trips
GROUP BY end_station
