// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table users {
  user_id uuid [pk] // Changed primary key syntax to 'pk'
  first_name varchar(50) [not null] // Added length constraints for Varchar
  last_name varchar(50) [not null]
  email varchar(100) [not null, unique, note: 'Unique and indexed for fast lookups'] // Added note
  password_hash varchar(255) [not null]
  phone_number varchar(20) [null]
  role user_role [not null] // Renamed enum for clarity
  created_at timestamp [default: `now()`]

  indexes {
    email
  }
}

// Renamed 'role' enum to 'user_role' to avoid conflicts with reserved words in some SQL dialects
enum user_role {
  guest
  host
  admin
}

Table properties {
  property_id uuid [pk] // Changed primary key syntax to 'pk'
  host_id uuid [not null, ref: > users.user_id] // Added not null constraint
  name varchar(255) [not null]
  description text [not null]
  location varchar(255) [not null]
  price_per_night decimal(10, 2) [not null]
  created_at timestamp [default: `now()`]
  updated_at timestamp [default: `now()`] // Corrected 'On Update' syntax
  // Note: The `ON UPDATE CURRENT_TIMESTAMP` syntax is specific to MySQL. In a database-agnostic tool like DBML, `default: now()` is the best practice.
}

Table bookings {
  booking_id uuid [pk]
  property_id uuid [not null, ref: > properties.property_id] // Added not null
  user_id uuid [not null, ref: > users.user_id] // Added not null
  start_date date [not null]
  end_date date [not null]
  total_price decimal(10, 2) [not null]
  status booking_status [not null]
  created_at timestamp [default: `now()`]

  indexes {
    property_id
    user_id // Added index for user_id to optimize searches by user
    (start_date, end_date) // Added a composite index for date-range queries
  }
}

enum booking_status {
  pending
  confirmed
  canceled
}

Table payments {
  payment_id uuid [pk]
  booking_id uuid [not null, unique, ref: > bookings.booking_id] // Enforced one payment per booking with 'unique'
  amount decimal(10, 2) [not null]
  payment_date timestamp [default: `now()`]
  payment_method payment_method [not null]

  indexes {
    booking_id
  }
}

enum payment_method {
  credit_card
  paypal
  stripe
}

Table reviews {
    review_id uuid [pk]
    property_id uuid [not null, ref: > properties.property_id]
    user_id uuid [not null, ref: > users.user_id]
    rating integer [not null, note: 'CHECK: rating >= 1 AND rating <= 5'] // Corrected
    comment text [not null]
    created_at timestamp [default: `now()`]

    indexes {
        (user_id, property_id) [unique, note: 'Ensures a user can only review a property once']
    }
}

Table messages {
  message_id uuid [pk]
  sender_id uuid [not null, ref: > users.user_id] // Added not null
  recipient_id uuid [not null, ref: > users.user_id] // Added not null
  message_body text [not null]
  sent_at timestamp [default: `now()`]

  indexes {
    sender_id
    recipient_id
  }
}
