-- What's the most expensive listing? What else can you tell me about the listing?
WITH listing_clean
AS (
SELECT *,
	   CAST(TRIM(leading '$' FROM REPLACE(price, ',', '')) AS float) AS price_clean
FROM oslo_listings
)
SELECT *
FROM listing_clean
WHERE price_clean = (SELECT MAX(price_clean) FROM listing_clean)
-- We can see from the table oslo_listings that this particular list has room type as Entire home, host name as Silje, name of the property as Villa Waxwings and it is located in Nordstrand neighborhood

-- What neighborhoods seem to be the most popular?
SELECT neighborhood,
       COUNT(neighborhood) AS count
FROM oslo_listings
GROUP BY neighborhood
ORDER BY count DESC
-- It looks like the neighborhood Grunerlokka is the most popular in Oslo, which has 1691 listing in the dataset

-- What time of year is the cheapest time to go to your city?
SELECT EXTRACT('month' FROM calendar_date) AS month,
       AVG(CAST(TRIM(leading '$' FROM REPLACE(price, ',', '')) AS float)) AS avg_price
FROM oslo_calendar
GROUP BY(month)
ORDER BY avg_price
-- From the query above we can see that Decmeber is the cheapest month to visit throughout the year, which has an average listing price $1019.72

-- What about the busiest?
SELECT EXTRACT('month' FROM calendar_date) AS month,
       COUNT(*) AS count
FROM oslo_calendar
WHERE available LIKE 'f'
GROUP BY(month)
ORDER BY count DESC
-- From the query above we can see that Aug. is also the busiest, it has 204903 listings that have been booked for year 2019 already
