# Database Seeding Script

## Objective
The purpose of this task is to populate the database with a set of realistic sample data. This data is crucial for testing the database schema, validating relationships between tables, and providing a realistic environment for application development.

## Script Overview
The `seed.sql` file contains a series of `INSERT` statements that populate each table defined in the schema. The data is designed to demonstrate key relationships:
- **`users`**: Includes a host, a guest, and an admin to show different user roles.
- **`properties`**: The host user is linked to multiple properties.
- **`bookings`**: The guest user is linked to bookings for the properties.
- **`payments`**: A payment record is associated with a specific booking.
- **`reviews`**: A review is written by a user for a property, as a guest would.
- **`messages`**: A sample message is shown between a guest and a host.

This script ensures that all primary key and foreign key relationships are correctly maintained, providing a valid and functional dataset for immediate use.
