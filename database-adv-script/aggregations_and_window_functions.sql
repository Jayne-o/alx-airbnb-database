SELECT 
    U.user_id,
    U.name,
    COUNT(B.booking_id) AS total_bookings
FROM Users U
LEFT JOIN Bookings B ON U.user_id = B.user_id
GROUP BY U.user_id, U.name;

SELECT 
    property_id,
    name AS property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM (
    SELECT 
        P.property_id,
        P.name,
        COUNT(B.booking_id) AS total_bookings
    FROM Properties P
    LEFT JOIN Bookings B ON P.property_id = B.property_id
    GROUP BY P.property_id, P.name
) AS booking_summary;
