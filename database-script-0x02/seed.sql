-- Seed the 'users' table with sample data
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_1', 'host'),
    ('b4a621d8-3e47-4971-8c46-8e50b44573b9', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_2', 'guest'),
    ('c7d3f2a1-6a84-4b5e-9f0e-7d6f5a3b2c1d', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_3', 'admin');

-- Seed the 'properties' table with sample data
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
    ('d9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Cozy Downtown Apartment', 'A charming apartment in the heart of the city.', 'New York, NY', 150.00),
    ('e8c9b0a7-6d5f-4e1a-8c2b-4f9e8d3c1b2a', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Lakeside Cabin Retreat', 'Escape to a peaceful cabin by the lake.', 'Lake Tahoe, CA', 250.50);

-- Seed the 'bookings' table with sample data
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    ('f1a2b3c4-9d8e-4f7a-8b6c-5e4d3c2b1a0b', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2025-10-01', '2025-10-05', 600.00, 'confirmed'),
    ('a9b8c7d6-e5f4-3a2b-1c0d-9e8f7a6b5c4d', 'e8c9b0a7-6d5f-4e1a-8c2b-4f9e8d3c1b2a', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2025-11-10', '2025-11-15', 1252.50, 'pending');

-- Seed the 'payments' table with sample data
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
    ('b5c4d3e2-1a0b-9c8d-7e6f-5g4h3i2j1k0l', 'f1a2b3c4-9d8e-4f7a-8b6c-5e4d3c2b1a0b', 600.00, 'credit_card');

-- Seed the 'reviews' table with sample data
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
    ('c1d2e3f4-5g6h-7i8j-9k0l-1m2n3o4p5q6r', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 5, 'Great location and very clean apartment. Highly recommended!');

-- Seed the 'messages' table with sample data
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
    ('d7e6f5a4-c3b2-a1d9-8e7f-6d5c4b3a2e1f', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hello, looking forward to my stay!');
