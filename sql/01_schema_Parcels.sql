-- 7. Parcels (For "Safety & Privacy")
CREATE TABLE parcels (
    parcel_id SERIAL PRIMARY KEY,
    recipient_user_id INT REFERENCES users(user_id),
    tracking_number VARCHAR(100),
    carrier_name VARCHAR(50), 
    arrived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pickup_status parcel_status_type DEFAULT 'pending'
);
