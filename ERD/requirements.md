📦 Database Specification – ALX AirBnB Project

🎯 Goal Develop a structured relational database that captures the essential features of an Airbnb-style platform. The design includes support for users, property listings, booking management, payment processing, user reviews, and messaging between users.

📚 Entities and Attributes User user_id: UUID, Primary Key, Indexed first_name: VARCHAR, NOT NULL last_name: VARCHAR, NOT NULL email: VARCHAR, UNIQUE, NOT NULL password_hash: VARCHAR, NOT NULL phone_number: VARCHAR, NULL role: ENUM('guest', 'host', 'admin'), NOT NULL created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Property property_id: UUID, Primary Key, Indexed host_id: UUID, Foreign Key → User(user_id) name: VARCHAR, NOT NULL description: TEXT, NOT NULL location: VARCHAR, NOT NULL pricepernight: DECIMAL, NOT NULL created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

Booking booking_id: UUID, Primary Key, Indexed property_id: UUID, Foreign Key → Property(property_id) user_id: UUID, Foreign Key → User(user_id) start_date: DATE, NOT NULL end_date: DATE, NOT NULL total_price: DECIMAL, NOT NULL status: ENUM('pending', 'confirmed', 'canceled'), NOT NULL created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Payment payment_id: UUID, Primary Key, Indexed booking_id: UUID, Foreign Key → Booking(booking_id) amount: DECIMAL, NOT NULL payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP payment_method: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL

Review review_id: UUID, Primary Key, Indexed property_id: UUID, Foreign Key → Property(property_id) user_id: UUID, Foreign Key → User(user_id) rating: INTEGER, CHECK (rating BETWEEN 1 AND 5), NOT NULL comment: TEXT, NOT NULL created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Message message_id: UUID, Primary Key, Indexed sender_id: UUID, Foreign Key → User(user_id) recipient_id: UUID, Foreign Key → User(user_id) message_body: TEXT, NOT NULL sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

🔐 Constraints & Indexing User Email must be unique. Required fields must not be NULL.

Property host_id must reference a valid user. Key attributes must not be NULL. Booking Must reference a valid user and property. status is constrained to accepted values.

Payment Must be tied to an existing booking.

Review Must reference a valid property and user. rating must be between 1 and 5.

Message Sender and recipient must be existing users.

Indexing Primary keys are indexed by default. Additional indexes: email in User table property_id in Property and Booking booking_id in Booking and Payment
