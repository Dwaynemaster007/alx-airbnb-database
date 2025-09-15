# **<p align="center">🌟 ALX Airbnb Clone Database Project 🌟</p>**
AirBnB Database Schema  This repository contains the database schema for an AirBnB-like application. It includes the Entity-Relationship Diagram (ERD) and detailed database specifications, defining entities like User, Property, and Booking, along with their attributes and relationships.

---

## **💡 Project Overview**

This repository contains the foundational **database design** for an **Airbnb-like booking platform**. As part of the **ALX Software Engineering Program**, this project focuses on building a **robust, scalable, and production-ready relational database** that will power the backend of the application.

The core objective is to simulate a real-world software development process by meticulously designing the database before any code is written.

<br>

## **🎯 Key Goals**

By completing this project, I've demonstrated proficiency in:

- **Entity-Relationship (ER) Modeling**: Designing the core entities and their relationships.
- **Database Normalization**: Ensuring the schema is in the **Third Normal Form (3NF)** to reduce redundancy and improve data integrity.
- **SQL DDL Scripting**: Writing **Data Definition Language** to create tables, primary keys, foreign keys, and constraints.
- **Data Seeding**: Populating the database with realistic sample data for testing.
- **System Documentation**: Creating professional and comprehensive project documentation.

<br>

---

## **🗃️ Project Structure**

The repository is structured to clearly separate each phase of the database design process.

```text
alx-airbnb-database/
├── ERD/
│   ├── ALX AirBnB Database Schema.png  # Visual ER diagram
│   └── requirements.md                # DBML file for the ER diagram
├── normalization.md                   # Explanation of normalization steps
├── database-script-0x01/
│   ├── schema.sql                     # SQL CREATE TABLE statements
│   └── README.md                      # Documentation for schema design
├── database-script-0x02/
│   ├── seed.sql                       # SQL INSERT statements for sample data
│   └── README.md                      # Documentation for data seeding
├── README.md                          # This file
└── .gitignore                         # Git exclusion rules
```
---

## 🚀 Core Database Features

The schema is meticulously designed to support the following functionalities:

-   **User Management**: Separate roles for guests, hosts, and admins.
-   **Property Listings**: A host can create and manage multiple properties.
-   **Booking System**: Guests can book properties for specific dates, with status tracking.
-   **Payment Records**: A dedicated table to track payment transactions for bookings.
-   **User Reviews**: Guests can rate and review properties they have stayed at.
-   **Messaging System**: Facilitates direct communication between users.

---
## 💻 How to Run

This database schema is compatible with **PostgreSQL**. You can use the following steps to set up and populate the database.

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/alx-airbnb-database.git](https://github.com/YOUR_USERNAME/alx-airbnb-database.git)
    cd alx-airbnb-database
    ```
2.  **Create the Database**
    ```sql
    CREATE DATABASE airbnb_clone;
    ```
3.  **Execute the Schema and Seed Scripts**
    ```bash
    psql -d airbnb_clone -f database-script-0x01/schema.sql
    psql -d airbnb_clone -f database-script-0x02/seed.sql
    ```

---
## 📚 Technologies Used

-   **SQL**: Specifically, **PostgreSQL** syntax for DDL and DML.
-   **DBML**: For clear and concise database modeling.
-   **Dbdiagram.io**: For visual diagrams.
-   **Git & GitHub**: For version control and collaboration.

---
<p align="center"><em><br>Powered by the ALX Software Engineering Program. Happy Coding! ✨</em></p>
