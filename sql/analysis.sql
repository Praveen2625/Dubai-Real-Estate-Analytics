-- Average property price by area
SELECT area,
       AVG(price_aed) AS avg_price
FROM properties
GROUP BY area
ORDER BY avg_price DESC;

-- Listings by property type
SELECT property_type,
       COUNT(*) AS total_listings
FROM properties
GROUP BY property_type;

-- Price per square foot
SELECT area,
       AVG(price_aed/size_sqft) AS avg_price_per_sqft
FROM properties
GROUP BY area
ORDER BY avg_price_per_sqft DESC;

-- Top 10 most expensive listings
SELECT listing_id, area, property_type, price_aed
FROM properties
ORDER BY price_aed DESC
LIMIT 10;

-- Average price by bedrooms
SELECT bedrooms,
       AVG(price_aed) AS avg_price
FROM properties
GROUP BY bedrooms
ORDER BY bedrooms;
