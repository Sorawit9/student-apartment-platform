-- Insert Users (1 Admin + 12 Students)
INSERT INTO users (username, password_hash, full_name, role) VALUES 
('admin_jane', 'pass123', 'Jane Admin', 'admin'),         -- User ID 1
('student_alex', 'pass123', 'Alex Smith', 'student'),     -- User ID 2
('student_bob', 'pass123', 'Bob Jones', 'student'),       -- User ID 3
('student_cat', 'pass123', 'Catherine Dee', 'student'),   -- User ID 4
('student_dave', 'pass123', 'Dave Grohl', 'student'),     -- User ID 5
('student_eve', 'pass123', 'Eve Polastri', 'student'),    -- User ID 6
('student_frank', 'pass123', 'Frank Castle', 'student'),  -- User ID 7
('student_grace', 'pass123', 'Grace Hopper', 'student'),  -- User ID 8
('student_harry', 'pass123', 'Harry Potter', 'student'),  -- User ID 9
('student_ivy', 'pass123', 'Ivy Carter', 'student'),      -- User ID 10
('student_jack', 'pass123', 'Jack Ryan', 'student'),      -- User ID 11
('student_ken', 'pass123', 'Ken Adams', 'student'),       -- User ID 12
('student_lily', 'pass123', 'Lily Evans', 'student');     -- User ID 13
