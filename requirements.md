
Entities and Attributes: 
1. User
•	user_id (PK)
•	first_name
•	last_name
•	email (Unique)
•	password_hash
•	phone_number (nullable)
•	role (ENUM: guest, host, admin)
•	created_at
2. Property
•	property_id (PK)
•	host_id (FK → User.user_id)
•	name
•	description
•	location
•	pricepernight
•	created_at
•	updated_at
3. Booking
•	booking_id (PK)
•	property_id (FK → Property.property_id)
•	user_id (FK → User.user_id)
•	start_date
•	end_date
•	total_price
•	status (ENUM: pending, confirmed, canceled)
•	created_at
4. Payment
•	payment_id (PK)
•	booking_id (FK → Booking.booking_id)
•	amount
•	payment_date
•	payment_method (ENUM: credit_card, paypal, stripe)
5. Review
•	review_id (PK)
•	property_id (FK → Property.property_id)
•	user_id (FK → User.user_id)
•	rating (INTEGER 1–5)
•	comment
•	created_at
6. Message
•	message_id (PK)
•	sender_id (FK → User.user_id)
•	recipient_id (FK → User.user_id)
•	message_body
•	sent_at


 Relationships:
•	User ↔ Property: 1 (User:host) → N (Property) (One host can have many properties)
•	User ↔ Booking: 1 (User:guest) → N (Booking) (One user can book multiple properties)
•	Property ↔ Booking: 1 Property → N Booking (One property can be booked many times)
•	Booking ↔ Payment: 1 Booking → 1 Payment (Each booking has one payment)
•	User ↔ Review: 1 User → N Review (Users can leave multiple reviews)
•	Property ↔ Review: 1 Property → N Review (A property can have many reviews)
•	User ↔ Message (self-join): 1 User → N Sent Messages 1 User → N Received Messages (Users can message each other)
