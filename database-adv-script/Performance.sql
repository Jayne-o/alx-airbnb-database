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
