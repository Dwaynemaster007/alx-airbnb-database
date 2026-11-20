-- Sample data for the AirBnB clone (run after schema.sql)
-- Run: psql -d airbnb_clone -f database-script-0x02/seed.sql

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice',   'Smith',   'alice.smith@example.com',   'hashed_password_1', '+1-202-555-0101', 'host'),
    ('b4a621d8-3e47-4971-8c46-8e50b44573b9', 'Bob',     'Johnson', 'bob.johnson@example.com',   'hashed_password_2', '+1-202-555-0102', 'guest'),
    ('c7d3f2a1-6a84-4b5e-9f0e-7d6f5a3b2c1d', 'Charlie', 'Brown',   'charlie.brown@example.com', 'hashed_password_3', NULL,              'admin'),
    ('d2b7e8f1-4c3a-4d5e-8f9a-0b1c2d3e4f50', 'Diana',   'Prince',  'diana.prince@example.com',  'hashed_password_4', '+1-202-555-0104', 'guest'),
    ('e3c8f9a2-5d4b-4e6f-9a0b-1c2d3e4f5a61', 'Ethan',   'Hunt',    'ethan.hunt@example.com',    'hashed_password_5', NULL,              'host'),
    ('f4d9a0b3-6e5c-4f7a-8b1c-2d3e4f5a6b72', 'Fiona',   'Gallagher', 'fiona.g@example.com',     'hashed_password_6', NULL,              'guest')
ON CONFLICT DO NOTHING;

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
    ('d9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Cozy Downtown Apartment', 'A charming apartment in the heart of the city.', 'New York, NY',   150.00),
    ('e8c9b0a7-6d5f-4e1a-8c2b-4f9e8d3c1b2a', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Lakeside Cabin Retreat',  'Escape to a peaceful cabin by the lake.',        'Lake Tahoe, CA', 250.50),
    ('1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'e3c8f9a2-5d4b-4e6f-9a0b-1c2d3e4f5a61', 'Beach House',             'Wake up to the sound of the waves.',             'Miami, FL',      320.00),
    ('2b3c4d5e-6f7a-4b8c-9d0e-1f2a3b4c5d6e', 'e3c8f9a2-5d4b-4e6f-9a0b-1c2d3e4f5a61', 'Mountain Loft',           'A quiet loft with mountain views.',              'Denver, CO',     120.00)
ON CONFLICT DO NOTHING;

-- Bob books 4 times (for the "more than 3 bookings" query); Fiona never books
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    ('f1a2b3c4-9d8e-4f7a-8b6c-5e4d3c2b1a0b', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2024-03-01', '2024-03-05',  600.00, 'confirmed'),
    ('a9b8c7d6-e5f4-4a2b-8c0d-9e8f7a6b5c4d', 'e8c9b0a7-6d5f-4e1a-8c2b-4f9e8d3c1b2a', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2024-11-10', '2024-11-15', 1252.50, 'confirmed'),
    ('3c4d5e6f-7a8b-4c9d-8e1f-2a3b4c5d6e7f', '1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2025-01-02', '2025-01-04',  640.00, 'confirmed'),
    ('4d5e6f7a-8b9c-4d0e-9f2a-3b4c5d6e7f80', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', '2025-06-10', '2025-06-12',  300.00, 'pending'),
    ('5e6f7a8b-9c0d-4e1f-8a3b-4c5d6e7f8091', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'd2b7e8f1-4c3a-4d5e-8f9a-0b1c2d3e4f50', '2024-03-20', '2024-03-23',  450.00, 'confirmed'),
    ('6f7a8b9c-0d1e-4f2a-9b4c-5d6e7f8091a2', '1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'd2b7e8f1-4c3a-4d5e-8f9a-0b1c2d3e4f50', '2025-07-01', '2025-07-08', 2240.00, 'canceled')
ON CONFLICT DO NOTHING;

INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
    ('b5c4d3e2-1a0b-4c8d-9e6f-5a4b3c2d1e0f', 'f1a2b3c4-9d8e-4f7a-8b6c-5e4d3c2b1a0b',  600.00, 'credit_card'),
    ('c6d5e4f3-2b1c-4d9e-8f7a-6b5c4d3e2f10', 'a9b8c7d6-e5f4-4a2b-8c0d-9e8f7a6b5c4d', 1252.50, 'paypal'),
    ('d7e6f5a4-3c2d-4e0f-9a8b-7c6d5e4f3a21', '3c4d5e6f-7a8b-4c9d-8e1f-2a3b4c5d6e7f',  640.00, 'stripe'),
    ('e8f7a6b5-4d3e-4f1a-8b9c-8d7e6f5a4b32', '5e6f7a8b-9c0d-4e1f-8a3b-4c5d6e7f8091',  450.00, 'credit_card')
ON CONFLICT DO NOTHING;

-- The Mountain Loft has no reviews (for the LEFT JOIN query)
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
    ('c1d2e3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 5, 'Great location and very clean apartment. Highly recommended!'),
    ('d2e3f4a5-6b7c-4d8e-9f0a-1b2c3d4e5f60', 'd9e2b1c8-8f5a-4e7d-b6c1-5a9e8f1d7c0b', 'd2b7e8f1-4c3a-4d5e-8f9a-0b1c2d3e4f50', 5, 'Perfect for a city break.'),
    ('e3f4a5b6-7c8d-4e9f-8a1b-2c3d4e5f6a71', 'e8c9b0a7-6d5f-4e1a-8c2b-4f9e8d3c1b2a', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 3, 'Beautiful lake, but the heating was weak.'),
    ('f4a5b6c7-8d9e-4f0a-9b2c-3d4e5f6a7b82', '1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 4, 'Lovely house right on the beach.')
ON CONFLICT DO NOTHING;

INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
    ('d7e6f5a4-c3b2-4a1d-8e7f-6d5c4b3a2e1f', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hello, looking forward to my stay!'),
    ('e8f7a6b5-d4c3-4b2e-9f8a-7e6d5c4b3a2f', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b4a621d8-3e47-4971-8c46-8e50b44573b9', 'Welcome! Check-in is from 3 PM.')
ON CONFLICT DO NOTHING;
