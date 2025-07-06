
SELECT 
    user_id, 
    name
FROM Users U
WHERE (
    SELECT COUNT(*) 
    FROM Bookings B 
    WHERE B.user_id = U.user_id
) > 3;
