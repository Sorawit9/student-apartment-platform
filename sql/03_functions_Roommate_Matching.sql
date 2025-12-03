-- FEATURE 3: Roommate Matching (Strict Gender & Smoking, Fuzzy Sleep Match)
DROP FUNCTION IF EXISTS fn_find_compatible_roommates;
CREATE OR REPLACE FUNCTION fn_find_compatible_roommates(p_user_id INT)
RETURNS TABLE (
    candidate_name VARCHAR,
    match_gender VARCHAR,
    phone_contact VARCHAR,
    match_sleep_time INT,
    compatibility_score INT
) AS $$
DECLARE
    v_my_sleep INT;
    v_my_smoker BOOLEAN;
    v_my_gender VARCHAR;
BEGIN
    SELECT sleep_time, is_smoker, gender INTO v_my_sleep, v_my_smoker, v_my_gender
    FROM student_profiles WHERE user_id = p_user_id;

    RETURN QUERY
    SELECT u.full_name, sp.gender, sp.phone_number, sp.sleep_time,
           (100 - (ABS(sp.sleep_time - v_my_sleep) * 10))::INT
    FROM student_profiles sp
    JOIN users u ON sp.user_id = u.user_id
    WHERE sp.user_id != p_user_id         
    AND sp.is_smoker = v_my_smoker       
    AND sp.gender = v_my_gender          
    AND ABS(sp.sleep_time - v_my_sleep) <= 3 
    ORDER BY 5 DESC;
END;
$$ LANGUAGE plpgsql;
