-- Insert sample users
INSERT into users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) 
  VALUES (gen_random_uuid(), 'Alice', 'Nguyen', 'alice@example.com', 'hashedpassword1', '555-0101', 'guest', DEFAULT), 
  (gen_random_uuid(), 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', ‘555-0202’, ‘host', DEFAULT), (gen_random_uuid(), 'Carla', 'Smith', 'carla@example.com', ‘hashedpassword3', NULL, 'admin', DEFAULT);

-- Insert sample properties
INSERT into property (property_id, host_id, name, description, location, pricepernight,  created_at, updated_at) 
  VALUES (gen_random_uuid(), 'uuid-002', 'Modern Loft', 'A sunny, open-concept loft in the heart of downtown.', 'Toronto, Canada', 120.00, DEFAULT, DEFAULT), 
  (gen_random_uuid(), 'uuid-003', 'Lakefront Cottage', 'Cozy two-bedroom cottage with direct lake access and breathtaking sunset views.', 'Kelowna, Canada', 95.50, DEFAULT, DEFAULT), 
  (gen_random_uuid(), 'uuid-002', 'Mountain Cabin', 'Rustic cabin near the Rockies with a fireplace, hot tub, and hiking trails nearby.', 'Banff, Canada', 175.00, DEFAULT, DEFAULT);

-- Insert sample bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES 
  (gen_random_uuid(), 'uuid-property-001', 'uuid-user-001', '2025-08-01', '2025-08-05', 480.00, 'pending', DEFAULT), (gen_random_uuid(), 'uuid-property-002', 'uuid-user-002', '2025-09-10', '2025-09-15', 750.00, 
  'confirmed', DEFAULT),  
  (gen_random_uuid(), 'uuid-property-003', 'uuid-user-003', '2025-10-20', '2025-10-22', 300.00, 'canceled', DEFAULT);

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
  ('pay-001', 'book-001', 240.00, 'credit_card'),
  ('pay-002', 'book-002', 450.00, 'paypal');
