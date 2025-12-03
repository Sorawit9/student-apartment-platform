-- 8. Maintenance Requests (For "Report Issue")
CREATE TABLE maintenance_requests (
    request_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    category VARCHAR(50), 
    description TEXT,
    status request_status_type DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
