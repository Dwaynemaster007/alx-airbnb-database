-- Query 1: Find the total number of bookings made by each user using COUNT and GROUP BY.
SELECT
    user_id,
    COUNT(id) AS total_bookings
FROM
    bookings
GROUP BY
    user_id
ORDER BY
    total_bookings DESC;

-- Query 2: Rank properties based on the total number of bookings using a window function.
-- This query uses RANK() to handle ties in the number of bookings.
SELECT
    p.id,
    p.name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS ranking
FROM
    properties AS p
LEFT JOIN
    bookings AS b ON p.id = b.property_id
GROUP BY
    p.id, p.name
ORDER BY
    ranking;
