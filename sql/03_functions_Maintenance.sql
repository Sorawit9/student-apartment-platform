-- FEATURE 4: Submit Maintenance Request
DROP FUNCTION IF EXISTS fn_submit_maintenance_request;
CREATE OR REPLACE FUNCTION fn_submit_maintenance_request(
    p_user_id INT, 
    p_category VARCHAR, 
    p_description TEXT
)
RETURNS TEXT AS $$
BEGIN
    INSERT INTO maintenance_requests (user_id, category, description)
    VALUES (p_user_id, p_category, p_description);
    
    RETURN 'Success: Request submitted.';
END;
$$ LANGUAGE plpgsql;
