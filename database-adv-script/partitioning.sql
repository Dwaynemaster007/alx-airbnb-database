-- Create the partitioned bookings table.
-- This example assumes a new table is being created.
CREATE TABLE bookings_partitioned (
    id INT NOT NULL,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price_per_night DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    status VARCHAR(50)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pMax VALUES LESS THAN MAXVALUE
);

-- Note: In a real-world scenario, you would need to migrate data from the original
-- bookings table into the new partitioned table.

-- Test query on the partitioned table.
-- The database will only scan the relevant partition (e.g., p2024).
EXPLAIN ANALYZE
SELECT
    *
FROM
    bookings_partitioned
WHERE
    start_date BETWEEN '2024-03-01' AND '2024-03-31';

-- Test query without partitioning for comparison (simulated).
-- This would scan the entire table, demonstrating the performance benefit of partitioning.
-- You would run this on your original, unpartitioned table.
EXPLAIN ANALYZE
SELECT
    *
FROM
    bookings
WHERE
    start_date BETWEEN '2024-03-01' AND '2024-03-31';
