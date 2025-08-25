# Database Normalization Analysis

## Objective

The goal of this task is to review the database schema and apply normalization principles to ensure it is in the Third Normal Form (3NF). Normalization is a process used to organize a database into tables and columns to reduce data redundancy and improve data integrity.

## Normalization Steps and Analysis

Upon reviewing the database schema for the AirBnB project, a step-by-step analysis was performed to determine its normalization status.

### 1. First Normal Form (1NF)

A table is in 1NF if:
- It has a primary key that uniquely identifies each row.
- There are no repeating groups of columns.
- Each column contains an atomic value (a single, non-divisible value).

**Analysis:** The current schema already satisfies 1NF.
- Each entity (`User`, `Property`, `Booking`, etc.) has a unique primary key (`user_id`, `property_id`, `booking_id`, etc.).
- There are no repeating groups of data; for example, a user's phone numbers are not stored in a single field.
- All attributes are atomic; for instance, `first_name` and `last_name` are separate columns, not combined.

### 2. Second Normal Form (2NF)

A table is in 2NF if it is in 1NF and all non-key attributes are fully functionally dependent on the primary key. This rule is most relevant for tables with a composite primary key.

**Analysis:** The current schema satisfies 2NF.
- All non-key attributes in each table are fully dependent on the primary key. For example, in the `Property` table, `name`, `description`, and `pricepernight` are all directly and completely dependent on `property_id`.
- The `Booking` table, with its composite key of `booking_id`, ensures that `start_date`, `end_date`, and `total_price` are all fully dependent on the unique booking identifier.

### 3. Third Normal Form (3NF)

A table is in 3NF if it is in 2NF and there are no transitive dependencies. A transitive dependency occurs when a non-key attribute is dependent on another non-key attribute.

**Analysis:** The current schema already satisfies 3NF.
- Upon careful review, no transitive dependencies were found. All non-key attributes are directly dependent on the primary key and not on any other non-key attribute.
- For example, in the `Booking` table, `total_price` might be calculated from other information, but it is not dependent on another non-key attribute within the `Booking` table itself. It is a direct attribute of the booking record and is dependent on the `booking_id`. Similarly, in the `Review` table, `rating` and `comment` are directly dependent on `review_id` and do not depend on each other.

### Conclusion

The database schema, as defined in the initial ERD, already adheres to the principles of database normalization up to the **Third Normal Form (3NF)**. The design is robust, with clear primary and foreign key relationships that minimize data redundancy and maintain data integrity. Therefore, no adjustments to the schema were necessary for this task.
