-- Query 1 (non-correlated): properties whose average rating is greater than 4.0
SELECT
    property_id,
    name
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Query 2 (correlated): users who have made more than 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3;
