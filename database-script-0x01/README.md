# Database Schema Design (DDL)

## Objective
This task involved designing and writing the Data Definition Language (DDL) for the AirBnB database schema. The goal was to translate the Entity-Relationship (ER) diagram and specifications into executable SQL `CREATE TABLE` statements.

## Schema Implementation
The `schema.sql` file contains the complete DDL script. It defines the following tables:
- **`users`**: Stores user information, including a unique email and a `role` attribute.
- **`properties`**: Contains details about properties for rent, with a foreign key linking to the `users` table for the `host`.
- **`bookings`**: Manages all property bookings, linking to both `users` and `properties`.
- **`payments`**: Records payment transactions for bookings.
- **`reviews`**: Stores reviews and ratings for properties, linking to both the `user` who wrote the review and the `property` being reviewed.
- **`messages`**: Facilitates communication between users, with foreign keys for both the `sender` and `recipient`.

## Key Features of the Schema
- **Primary Keys**: Each table is defined with a `UUID` primary key to ensure unique identifiers.
- **Foreign Keys**: Relationships between tables are enforced using `FOREIGN KEY` constraints, ensuring data integrity.
- **Data Types**: Appropriate SQL data types (`UUID`, `VARCHAR`, `TEXT`, `DECIMAL`, `DATE`, `TIMESTAMP`) have been used for each column.
- **Constraints**: Constraints like `NOT NULL`, `UNIQUE`, and `CHECK` have been implemented to maintain data validity. For example, the `reviews` table has a `CHECK` constraint to ensure ratings are between 1 and 5.
- **Indexing**: Indexes have been created on foreign key columns and the `email` column to optimize query performance and speed up data retrieval.
