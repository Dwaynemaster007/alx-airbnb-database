-- AirBnB clone schema (PostgreSQL 13+)
-- Run: psql -d airbnb_clone -f database-script-0x01/schema.sql

-- ENUM-like values are enforced with CHECK constraints
CREATE TABLE IF NOT EXISTS users (
    user_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name    VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number  VARCHAR(20),
    role          VARCHAR(10)  NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS properties (
    property_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id         UUID NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    name            VARCHAR(255) NOT NULL,
    description     TEXT NOT NULL,
    location        VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bookings (
    booking_id  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL REFERENCES properties (property_id) ON DELETE CASCADE,
    user_id     UUID NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status      VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_end_date CHECK (end_date > start_date)
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id     UUID NOT NULL REFERENCES bookings (booking_id) ON DELETE CASCADE,
    amount         DECIMAL(10, 2) NOT NULL,
    payment_date   TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe'))
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL REFERENCES properties (property_id) ON DELETE CASCADE,
    user_id     UUID NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    rating      INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment     TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
    message_id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id    UUID NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    recipient_id UUID NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL,
    sent_at      TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Keep properties.updated_at current (PostgreSQL has no ON UPDATE clause)
CREATE OR REPLACE FUNCTION set_updated_at() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_properties_updated_at ON properties;
CREATE TRIGGER trg_properties_updated_at
    BEFORE UPDATE ON properties
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Indexes on foreign keys (users.email is already indexed by its UNIQUE constraint)
CREATE INDEX IF NOT EXISTS idx_properties_host_id   ON properties (host_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings (property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id     ON bookings (user_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id  ON payments (booking_id);
CREATE INDEX IF NOT EXISTS idx_reviews_property_id  ON reviews (property_id);
CREATE INDEX IF NOT EXISTS idx_reviews_user_id      ON reviews (user_id);
CREATE INDEX IF NOT EXISTS idx_messages_sender_id   ON messages (sender_id);
CREATE INDEX IF NOT EXISTS idx_messages_recipient_id ON messages (recipient_id);
