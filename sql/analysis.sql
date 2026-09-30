-- QUERY 1: Total Inventory
USE dubai_real_estate;
SELECT COUNT(*) AS total_listings
FROM dubai_properties;

-- QUERY 2: Average Property Price
SELECT 
    ROUND(AVG(price_aed), 0) AS average_property_price_aed
FROM dubai_properties;

-- QUERY 3: Average Price by Area
SELECT
    area,
    COUNT(*) AS listings,
    ROUND(AVG(price_aed), 0) AS average_price_aed
FROM dubai_properties
GROUP BY area
ORDER BY average_price_aed DESC;

-- QUERY 4: INVENTORY BY PROPERTY TYPE
SELECT
    property_type,
    COUNT(*) AS total_listings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM dubai_properties),
        2
    ) AS inventory_percentage
FROM dubai_properties
GROUP BY property_type
ORDER BY total_listings DESC;

-- QUERY 5: AVERAGE PRICE PER SQUARE FOOT
SELECT
    area,
    ROUND(
        AVG(price_aed / size_sqft),
        2
    ) AS average_price_per_sqft
FROM dubai_properties
GROUP BY area
ORDER BY average_price_per_sqft DESC;

-- QUERY 6: BEDROOMS VS PROPERTY PRICE
SELECT
    bedrooms,
    COUNT(*) AS listings,
    ROUND(
        AVG(price_aed),
        0
    ) AS average_price_aed
FROM dubai_properties
GROUP BY bedrooms
ORDER BY bedrooms;

-- QUERY 7: YEARLY PRICE TREND
SELECT
    year,
    COUNT(*) AS listings,
    ROUND(
        AVG(price_aed),
        0
    ) AS average_price_aed
FROM dubai_properties
GROUP BY year
ORDER BY year;

-- QUERY 8: TOP 10 MOST EXPENSIVE PROPERTIES
SELECT
    listing_id,
    area,
    property_type,
    bedrooms,
    size_sqft,
    price_aed
FROM dubai_properties
ORDER BY price_aed DESC
LIMIT 10;

-- QUERY 9: AREA INVENTORY CONCENTRATION
SELECT
    area,
    COUNT(*) AS total_listings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM dubai_properties),
        2
    ) AS inventory_share
FROM dubai_properties
GROUP BY area
ORDER BY inventory_share DESC;

-- QUERY 10: TOTAL MARKET VALUE BY AREA
SELECT
    area,
    COUNT(*) AS listings,
    ROUND(
        SUM(price_aed),
        0
    ) AS total_listing_value_aed,
    ROUND(
        AVG(price_aed),
        0
    ) AS average_price_aed
FROM dubai_properties
GROUP BY area
ORDER BY total_listing_value_aed DESC;