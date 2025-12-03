-- FEATURE 3: Parcel Notifications
DROP FUNCTION IF EXISTS fn_check_incoming_parcels;
CREATE OR REPLACE FUNCTION fn_check_incoming_parcels(p_user_id INT)
RETURNS TABLE (
    carrier VARCHAR,
    tracking_no VARCHAR,
    arrived_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.carrier_name, p.tracking_number, p.arrived_at
    FROM parcels p
    WHERE p.recipient_user_id = p_user_id
    AND p.pickup_status = 'pending';
END;
$$ LANGUAGE plpgsql;
