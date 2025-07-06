The columns that are frequently used in JOIN, WHERE, and ORDER BY clauses:
- Users.user_id
- Bookings.user_id
- Bookings.property_id
- Properties.property_id
- Reviews.property_id

-- Index for joining Users and Bookings
CREATE INDEX idx_users_user_id ON Users(user_id);

-- Index for joining Bookings with Users and Properties
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index for joining Properties with Bookings and Reviews
CREATE INDEX idx_properties_property_id ON Properties(property_id);

-- Index for filtering and aggregating Reviews
CREATE INDEX idx_reviews_property_id ON Reviews(property_id);

EXPLAIN ANALYZE
SELECT 
    U.user_id, 
    COUNT(B.booking_id)
FROM Users U
LEFT JOIN Bookings B ON U.user_id = B.user_id
GROUP BY U.user_id;
