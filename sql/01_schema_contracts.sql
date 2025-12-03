-- 5. Contracts (Links Students to Rooms)
CREATE TABLE contracts (
    contract_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    room_id INT REFERENCES rooms(room_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);
