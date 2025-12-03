-- 1. Create Enum types for consistent status values
CREATE TYPE user_role_type AS ENUM ('admin', 'student');
CREATE TYPE room_status_type AS ENUM ('available', 'occupied', 'maintenance');
CREATE TYPE bill_status_type AS ENUM ('paid', 'unpaid', 'overdue');
CREATE TYPE parcel_status_type AS ENUM ('pending', 'collected');
CREATE TYPE request_status_type AS ENUM ('pending', 'in_progress', 'completed');
