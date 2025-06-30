-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('uuid-001', 'Alice', 'Wong', 'alice@example.com', 'hash1', '555-1234', 'guest'),
  ('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hash2', '555-5678', 'host'),
  ('uuid-003', 'Charlie', 'Lee', 'charlie@example.com', 'hash3', NULL, 'guest');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('prop-001', 'uuid-002', 'Modern Loft', 'Sunny loft in downtown.', 'Toronto, Canada', 120.00),
  ('prop-002', 'uuid-002', 'Cottage Escape', 'Quiet cottage near the lake.', 'Kelowna, Canada', 90.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('book-001', 'prop-001', 'uuid-001', '2025-07-01', '2025-07-03', 240.00, 'confirmed'),
  ('book-002', 'prop-002', 'uuid-003', '2025-08-10', '2025-08-15', 450.00, 'pending');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
  ('pay-001', 'book-001', 240.00, 'credit_card'),
  ('pay-002', 'book-002', 450.00, 'paypal');
