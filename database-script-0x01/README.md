Airbnb Database Schema
This SQL script defines the normalized schema for the Airbnb clone project.

📂 Files
schema.sql – Contains all CREATE TABLE statements, primary/foreign keys, indexes, and constraints.
README.md – Overview and documentation of the schema.
📌 Entities
users
properties
bookings
payments
reviews
messages
⚙️ Features
UUIDs used as primary keys
Foreign key constraints between entities
ENUM constraints implemented via CHECK
Indexed columns: email, property_id, booking_id
✅ Normalized
This schema is normalized to Third Normal Form (3NF) with no transitive dependencies or redundancy.
