-- Query 1: INNER JOIN - every booking with the user who made it
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name
FROM bookings AS b
INNER JOIN users AS u ON b.user_id = u.user_id
ORDER BY b.start_date;

-- Query 2: LEFT JOIN - every property and its reviews, including properties with no reviews
SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r ON p.property_id = r.property_id
ORDER BY p.name;

-- Query 3: FULL OUTER JOIN - all users and all bookings, including users with no bookings
-- and bookings without a matching user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users AS u
FULL OUTER JOIN bookings AS b ON u.user_id = b.user_id
ORDER BY u.last_name, b.start_date;
