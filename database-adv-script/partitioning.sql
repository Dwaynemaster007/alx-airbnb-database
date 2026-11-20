-- Range-partition bookings by start_date (PostgreSQL declarative partitioning).
-- The partition key has to be part of the primary key.
DROP TABLE IF EXISTS bookings_partitioned;

CREATE TABLE bookings_partitioned (
    booking_id  UUID NOT NULL,
    property_id UUID NOT NULL REFERENCES properties (property_id),
    user_id     UUID NOT NULL REFERENCES users (user_id),
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status      VARCHAR(10) NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE bookings_default PARTITION OF bookings_partitioned DEFAULT;

CREATE INDEX ON bookings_partitioned (start_date);

-- Copy the existing bookings in
INSERT INTO bookings_partitioned
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings;

-- Only the bookings_2024 partition is scanned (look for it in the plan)
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';

-- The unpartitioned table, for comparison
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';
