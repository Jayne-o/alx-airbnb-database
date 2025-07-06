SELECT 
    property_id, 
    name
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

SELECT 
    user_id, 
    name
FROM Users U
WHERE (
    SELECT COUNT(*) 
    FROM Bookings B 
    WHERE B.user_id = U.user_id
) > 3;
