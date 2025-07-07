SELECT 
    B.booking_id,
    B.booking_date,
    U.user_id,
    U.name
FROM Bookings B
INNER JOIN Users U ON B.user_id = U.user_id;

SELECT 
    P.property_id,
    P.name AS property_name,
    R.review_id,
    R.rating,
    R.comment
FROM Properties P
LEFT JOIN Reviews R ON P.property_id = R.property_id ORDER BY R.rating DESC NULLS LAST;
;

SELECT 
    U.user_id,
    U.name,
    B.booking_id,
    B.booking_date,
    B.property_id
FROM Users U
FULL OUTER JOIN Bookings B ON U.user_id = B.user_id;
