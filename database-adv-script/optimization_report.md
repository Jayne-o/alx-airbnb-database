SELECT 
    B.booking_id,
    B.booking_date,
    U.user_id,
    U.name AS user_name,
    P.property_id,
    P.name AS property_name,
    Pay.payment_id,
    Pay.amount,
    Pay.payment_date
FROM Bookings B
JOIN Users U ON B.user_id = U.user_id
JOIN Properties P ON B.property_id = P.property_id
JOIN Payments Pay ON B.booking_id = Pay.booking_id;


Refactored Query + Indexing Tips
If performance is lagging, try these:
- Add indexes to frequently joined columns:
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);


- Use SELECT only on needed columns (avoid SELECT *)
- Consider materialized views if this query is run often and the data doesn’t change frequently.
