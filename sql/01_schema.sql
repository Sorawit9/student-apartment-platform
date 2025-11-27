-- 01_schema.sql
-- Create Enum types for consistent status values
CREATE TYPE user_role_type AS ENUM ('admin', 'student');
CREATE TYPE room_status_type AS ENUM ('available', 'occupied', 'maintenance');
CREATE TYPE bill_status_type AS ENUM ('paid', 'unpaid', 'overdue');
CREATE TYPE parcel_status_type AS ENUM ('pending', 'collected');

-- 1. Users Table (Authentication)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- In real app, store hashed passwords
    full_name VARCHAR(100) NOT NULL,
    role user_role_type DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Student Profiles (For the Compatibility Algorithm)
CREATE TABLE student_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
    zodiac_sign VARCHAR(20),
    -- Sleep time stored as integer (0-23 hours). Example: 23 = 11PM, 2 = 2AM
    sleep_time INT CHECK (sleep_time BETWEEN 0 AND 23),
    is_smoker BOOLEAN DEFAULT FALSE,
    is_introvert BOOLEAN DEFAULT FALSE, -- True = Introvert, False = Extrovert
    cleanliness_level INT CHECK (cleanliness_level BETWEEN 1 AND 5) -- 1=Messy, 5=Neat Freak
);

-- 3. Rooms Table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    floor_level INT,
    monthly_rent NUMERIC(10, 2) NOT NULL,
    status room_status_type DEFAULT 'available'
);

-- 4. Contracts (Links Students to Rooms)
CREATE TABLE contracts (
    contract_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    room_id INT REFERENCES rooms(room_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- 5. Bills (For "In-App Billing")
CREATE TABLE bills (
    bill_id SERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(contract_id),
    bill_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    rent_amount NUMERIC(10, 2) NOT NULL,
    utility_amount NUMERIC(10, 2) DEFAULT 0.00,
    total_amount NUMERIC(10, 2) GENERATED ALWAYS AS (rent_amount + utility_amount) STORED,
    status bill_status_type DEFAULT 'unpaid'
);

-- 6. Parcels (For "Safety & Privacy")
CREATE TABLE parcels (
    parcel_id SERIAL PRIMARY KEY,
    recipient_user_id INT REFERENCES users(user_id),
    tracking_number VARCHAR(100),
    carrier_name VARCHAR(50), -- e.g., Kerry, Flash, ThaiPost
    arrived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pickup_status parcel_status_type DEFAULT 'pending'
);
