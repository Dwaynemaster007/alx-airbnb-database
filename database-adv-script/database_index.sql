-- Indexes for columns used in WHERE, JOIN and ORDER BY clauses.
-- Measure a query before and after with EXPLAIN ANALYZE.

-- Before
EXPLAIN ANALYZE
SELECT p.name, r.rating
FROM properties AS p
JOIN reviews AS r ON p.property_id = r.property_id
WHERE r.rating > 4;

-- users: looked up by role
CREATE INDEX IF NOT EXISTS idx_users_role ON users (role);

-- bookings: filtered by date range and status
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings (start_date);
CREATE INDEX IF NOT EXISTS idx_bookings_status ON bookings (status);

-- properties: searched by location and price
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties (location);
CREATE INDEX IF NOT EXISTS idx_properties_price ON properties (price_per_night);

-- reviews: filtered by rating
CREATE INDEX IF NOT EXISTS idx_reviews_rating ON reviews (rating);

-- After
EXPLAIN ANALYZE
SELECT p.name, r.rating
FROM properties AS p
JOIN reviews AS r ON p.property_id = r.property_id
WHERE r.rating > 4;
