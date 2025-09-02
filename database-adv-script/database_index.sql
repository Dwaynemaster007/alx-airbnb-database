-- Query to analyze before creating an index
EXPLAIN ANALYZE
SELECT
    p.name,
    r.rating
FROM
    properties AS p
JOIN
    reviews AS r ON p.id = r.property_id
WHERE
    r.rating > 4;

-- Create an index on the rating column in the reviews table
CREATE INDEX idx_reviews_rating ON reviews (rating);

-- Query to analyze after creating the index
EXPLAIN ANALYZE
SELECT
    p.name,
    r.rating
FROM
    properties AS p
JOIN
    reviews AS r ON p.id = r.property_id
WHERE
    r.rating > 4;
