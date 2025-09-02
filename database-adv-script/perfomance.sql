-- Initial (Potentially Inefficient) Query
-- This query uses multiple joins, which can be slow if not optimized.
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.city AS property_city,
    pm.amount,
    pm.payment_date
FROM
    bookings AS b
JOIN
    users AS u ON b.user_id = u.id
JOIN
    properties AS p ON b.property_id = p.id
JOIN
    payments AS pm ON b.id = pm.booking_id;


-- Refactored (Optimized) Query
-- This version assumes that indexes exist on user_id, property_id, and booking_id.
-- The query structure is already efficient, but performance is dependent on proper indexing.
-- Adding a WHERE clause on an indexed column would further demonstrate optimization.
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.city AS property_city,
    pm.amount,
    pm.payment_date
FROM
    bookings AS b
JOIN
    users AS u ON b.user_id = u.id
JOIN
    properties AS p ON b.property_id = p.id
JOIN
    payments AS pm ON b.id = pm.booking_id
WHERE
    b.start_date >= '2024-01-01' AND b.start_date < '2024-02-01';
