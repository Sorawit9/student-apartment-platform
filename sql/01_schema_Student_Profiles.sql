-- 3. Student Profiles (Essential Data for Matching)
CREATE TABLE student_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
    phone_number VARCHAR(20) NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    sleep_time INT CHECK (sleep_time BETWEEN 0 AND 23),
    is_smoker BOOLEAN DEFAULT FALSE
);
