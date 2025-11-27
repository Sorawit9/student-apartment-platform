-- 03_functions.sql

-- FUNCTION 1: Find Compatible Roommates (Matching Algorithm)
-- Logic: Matches students who are NOT smokers (if you aren't) and have similar sleep schedules (+/- 3 hours).
DROP FUNCTION IF EXISTS fn_find_compatible_roommates;
CREATE OR REPLACE FUNCTION fn_find_compatible_roommates(p_user_id INT)
RETURNS TABLE (
    candidate_name VARCHAR,
    zodiac_sign VARCHAR,
    sleep_time INT,
    compatibility_score INT
) AS $$
DECLARE
    my_sleep INT;
    my_smoker BOOLEAN;
BEGIN
    -- 1. Get current user's details
    SELECT sleep_time, is_smoker INTO my_sleep, my_smoker 
    FROM student_profiles WHERE user_id = p_user_id;

    -- 2. Return list of compatible users
    RETURN QUERY
    SELECT 
        u.full_name,
        sp.zodiac_sign,
        sp.sleep_time,
        -- Simple Score: Start at 100, subtract difference in sleep hours * 10
        (100 - (ABS(sp.sleep_time - my_sleep) * 10))::INT as score
    FROM student_profiles sp
    JOIN users u ON sp.user_id = u.user_id
    WHERE sp.user_id != p_user_id         -- Don't match with self
    AND sp.is_smoker = my_smoker          -- Must have same smoking habit (Dealbreaker)
    AND ABS(sp.sleep_time - my_sleep) <= 3 -- Sleep time must be within 3 hours diff
    ORDER BY score DESC;
END;
$$ LANGUAGE plpgsql;


-- FUNCTION 2: My Pending Bills (Dashboard)
-- Logic: Joins bills, contracts, and rooms to show exactly what the user owes.
DROP FUNCTION IF EXISTS fn_get_my_bills;
CREATE OR REPLACE FUNCTION fn_get_my_bills(p_user_id INT)
RETURNS TABLE (
    bill_date DATE,
    room_number VARCHAR,
    total_due NUMERIC,
    status bill_status_type
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        b.due_date,
        r.room_number,
        b.total_amount,
        b.status
    FROM bills b
    JOIN contracts c ON b.contract_id = c.contract_id
    JOIN rooms r ON c.room_id = r.room_id
    WHERE c.user_id = p_user_id
    AND b.status IN ('unpaid', 'overdue');
END;
$$ LANGUAGE plpgsql;


-- FUNCTION 3: Check Parcels (Safety Feature)
-- Logic: Simple lookup for items waiting at the front desk.
DROP FUNCTION IF EXISTS fn_check_incoming_parcels;
CREATE OR REPLACE FUNCTION fn_check_incoming_parcels(p_user_id INT)
RETURNS TABLE (
    carrier VARCHAR,
    tracking_no VARCHAR,
    arrived_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.carrier_name,
        p.tracking_number,
        p.arrived_at
    FROM parcels p
    WHERE p.recipient_user_id = p_user_id
    AND p.pickup_status = 'pending';
END;
$$ LANGUAGE plpgsql;
