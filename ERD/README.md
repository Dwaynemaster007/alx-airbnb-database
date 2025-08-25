# ER Diagram and Database Design
The ER diagram can be found [here](https://dbdiagram.io/d/ALX-AirBnB-Database-Schema-68ac4eea1e7a611967780902)

![ERD/]ALX AirBnB Database Schema.png

## Objective
The primary goal of this task was to design the database schema for an AirBnB-like application. This involved identifying the core entities, their attributes, and the relationships that exist between them.

## Implementation
An Entity-Relationship (ER) Diagram was created to visually represent the database structure. The following steps were taken:

1.  **Entity Identification**: The key entities were identified based on the project specification, including `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.
2.  **Attribute Definition**: Attributes for each entity were defined, specifying their data types and constraints (e.g., primary keys, unique constraints, and non-null values).
3.  **Relationship Mapping**: The relationships between entities were established, such as a **one-to-many** relationship between a `User` and their `Properties` (a host can have many properties) and a **many-to-many** relationship between `User` and `Property` via the `Booking` and `Review` tables.

## Result
The resulting schema is documented in the `requirements.md` file, which uses the DBML (Database Markup Language) format. This file serves as a blueprint for the database and can be used to generate a visual ER diagram.
