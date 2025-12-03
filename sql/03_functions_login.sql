-- FEATURE 5: Login
DROP FUNCTION IF EXISTS fn_login;
CREATE OR REPLACE FUNCTION fn_login(p_username VARCHAR, p_password VARCHAR)
RETURNS TABLE(status VARCHAR, user_id INT, role user_role_type) AS $$
BEGIN
    RETURN QUERY
    SELECT 'Success'::VARCHAR, u.user_id, u.role
    FROM users u
    WHERE u.username = p_username AND u.password_hash = p_password;

    IF NOT FOUND THEN
        RETURN QUERY SELECT 'Failed'::VARCHAR, NULL::INT, NULL::user_role_type;
    END IF;
END;
$$ LANGUAGE plpgsql;
