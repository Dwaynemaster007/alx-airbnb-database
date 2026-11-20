-- Initial query: every booking with its user, property and payment details
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pm.payment_id,
    pm.amount,
    pm.payment_method,
    pm.payment_date
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pm ON pm.booking_id = b.booking_id;

-- Refactored query: only the columns the page needs, only confirmed bookings in a date range,
-- so the indexes on bookings(start_date), bookings(status) and the foreign keys are used
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pm.amount
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pm ON pm.booking_id = b.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= DATE '2024-01-01'
  AND b.start_date < DATE '2025-01-01';
