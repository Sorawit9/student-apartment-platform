-- FEATURE 1: Billing Dashboard (Unpaid Bills)
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
    SELECT b.due_date, r.room_number, b.total_amount, b.status
    FROM bills b
    JOIN contracts c ON b.contract_id = c.contract_id
    JOIN rooms r ON c.room_id = r.room_id
    WHERE c.user_id = p_user_id
    AND b.status IN ('unpaid', 'overdue');
END;
$$ LANGUAGE plpgsql;
