-- 4. Rooms Table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    floor_level INT,
    monthly_rent NUMERIC(10, 2) NOT NULL,
    status room_status_type DEFAULT 'available'
);
