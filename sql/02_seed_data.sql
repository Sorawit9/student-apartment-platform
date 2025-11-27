-- 02_seed_data.sql

-- Insert Users
INSERT INTO users (username, password_hash, full_name, role) VALUES 
('admin_jane', 'hash123', 'Jane Admin', 'admin'),
('student_alex', 'pass1', 'Alex Smith', 'student'),
('student_bob', 'pass2', 'Bob Jones', 'student'),
('student_cat', 'pass3', 'Cat Deeley', 'student'),
('student_dave', 'pass4', 'Dave Grohl', 'student'),
('student_eve', 'pass5', 'Eve Polastri', 'student'),
('student_frank', 'pass6', 'Frank Castle', 'student'),
('student_grace', 'pass7', 'Grace Hopper', 'student'),
('student_harry', 'pass8', 'Harry Potter', 'student'),
('student_ivy', 'pass9', 'Ivy Carter', 'student'),
('student_jack', 'pass10', 'Jack Ryan', 'student');

-- Insert Profiles (Diverse habits for matching)
INSERT INTO student_profiles (user_id, zodiac_sign, sleep_time, is_smoker, is_introvert, cleanliness_level) VALUES
(2, 'Leo', 23, FALSE, FALSE, 4), -- Alex: Sleeps 11PM, Non-smoker
(3, 'Virgo', 2, TRUE, TRUE, 3),   -- Bob: Sleeps 2AM, Smoker
(4, 'Libra', 22, FALSE, TRUE, 5), -- Cat: Sleeps 10PM, Non-smoker
(5, 'Gemini', 1, TRUE, FALSE, 2), -- Dave: Sleeps 1AM, Smoker
(6, 'Pisces', 23, FALSE, FALSE, 4),
(7, 'Aries', 0, FALSE, TRUE, 3),
(8, 'Taurus', 21, FALSE, FALSE, 5),
(9, 'Leo', 2, TRUE, TRUE, 2),
(10, 'Cancer', 22, FALSE, TRUE, 4),
(11, 'Scorpio', 1, TRUE, FALSE, 3);

-- Insert Rooms
INSERT INTO rooms (room_number, floor_level, monthly_rent, status) VALUES
('101', 1, 4500.00, 'occupied'),
('102', 1, 4500.00, 'occupied'),
('103', 1, 4500.00, 'available'),
('201', 2, 5000.00, 'occupied'),
('202', 2, 5000.00, 'occupied'),
('203', 2, 5000.00, 'available'),
('301', 3, 5500.00, 'occupied'),
('302', 3, 5500.00, 'available'),
('303', 3, 5500.00, 'available'),
('304', 3, 5500.00, 'available');

-- Insert Contracts
INSERT INTO contracts (user_id, room_id, start_date, end_date) VALUES
(2, 1, '2025-01-01', '2025-12-31'), -- Alex in 101
(3, 2, '2025-01-01', '2025-12-31'), -- Bob in 102
(5, 4, '2025-02-01', '2026-01-31'), -- Dave in 201
(6, 5, '2025-03-01', '2026-02-28'), -- Eve in 202
(8, 7, '2025-01-01', '2025-12-31'); -- Grace in 301

-- Insert Bills
INSERT INTO bills (contract_id, due_date, rent_amount, utility_amount, status) VALUES
(1, '2025-11-05', 4500.00, 500.00, 'unpaid'), -- Alex owes money
(2, '2025-11-05', 4500.00, 750.00, 'paid'),
(3, '2025-11-05', 5000.00, 300.00, 'unpaid'), -- Dave owes money
(4, '2025-11-05', 5000.00, 400.00, 'paid'),
(5, '2025-11-05', 5500.00, 200.00, 'overdue');

-- Insert Parcels
INSERT INTO parcels (recipient_user_id, tracking_number, carrier_name, pickup_status) VALUES
(2, 'TH12345678', 'Kerry Express', 'pending'), -- Alex has a parcel
(2, 'TH87654321', 'Shopee Xpress', 'pending'), -- Alex has another parcel
(3, 'TH99988877', 'Flash Express', 'collected'),
(5, 'TH11223344', 'ThaiPost', 'pending'),
(8, 'TH55667788', 'DHL', 'collected');
