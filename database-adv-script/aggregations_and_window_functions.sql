-- Query 1: total number of bookings made by each user (COUNT + GROUP BY)
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b ON b.user_id = u.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- Query 2: rank properties by their total number of bookings (window functions)
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number_by_bookings
FROM properties AS p
LEFT JOIN bookings AS b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY total_bookings DESC;
