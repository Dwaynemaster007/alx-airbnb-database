-- Create an index on the user_id column in the bookings table.
-- This column is frequently used in joins and foreign key lookups.
CREATE INDEX idx_bookings_user_id ON bookings (user_id);

-- Create an index on the property_id column in the reviews table.
-- This column is heavily used for filtering and joining to properties.
CREATE INDEX idx_reviews_property_id ON reviews (property_id);

-- Create a composite index on the properties table for filtering by location.
-- This is useful for queries that search for properties in a specific city and state.
CREATE INDEX idx_properties_location ON properties (city, state);

-- Create an index on the rating column in the reviews table.
-- This can speed up queries that filter or sort by rating.
CREATE INDEX idx_reviews_rating ON reviews (rating);
