-- USER TABLE
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin')

    Create table users (user_id UUID Primary Key default gen_random_uuid(), 
    first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    password_hash VARCHAR(255) NOT NULL, phone_number VARCHAR(255) NULL, 
    role user_role NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- PROPERTY TABLE
CREATE TABLE property (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);

    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES users(user_id);

CREATE INDEX idx_properties_property_id ON properties(property_id);

-- BOOKING TABLE
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');

CREATE TABLE booking (booking_id UUID PRIMARY KEY default gen_random_uuid(), property_id UUID NOT NULL,
    user_id UUID NOT NULL, start_date DATE NOT NULL, end_date DATE NOT NULL, total_price DECIMAL NOT NULL, 
    status booking_status NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES properties(property_id);
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE booking ALTER COLUMN status SET DEFAULT 'pending';
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- PAYMENT TABLE
CREATE TYPE payment_method_enum AS ENUM ('credit_card', 'paypal', 'stripe');
CREATE TABLE payment (payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),  
booking_id UUID NOT NULL, amount DECIMAL NOT NULL, payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
payment_method payment_method_enum NOT NULL, CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES booking(booking_id) );

CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- REVIEW TABLE
CREATE TABLE review (review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), property_id UUID NOT NULL, 
    user_id UUID NOT NULL, rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5), 
    comment TEXT NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
    -- Foreign Key Constraints
 CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES property(property_id), CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id) );

);

-- MESSAGE TABLE
CREATE TABLE message (message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),  sender_id UUID NOT NULL, 
    recipient_id UUID NOT NULL, message_body TEXT NOT NULL,  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Foreign Key Constraints
CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES users(user_id),
CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES users(user_id) );


