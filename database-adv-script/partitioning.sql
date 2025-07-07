ALTER TABLE Bookings RENAME TO Bookings_old;

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    booking_date DATE,
    -- other fields...
    PARTITION BY RANGE (start_date)
);

CREATE TABLE Bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

INSERT INTO Bookings
SELECT * FROM Bookings_old;

DROP TABLE Bookings_old;
