CREATE OR REPLACE FUNCTION interleave (p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN VARCHAR2 IS
    v_out VARCHAR2(400);
BEGIN
    FOR i IN 1 .. GREATEST(LENGTH(p_a), LENGTH(p_b)) LOOP
        v_out := v_out || SUBSTR(p_a, i, 1) || SUBSTR(p_b, i, 1);
    END LOOP;
    RETURN v_out;
END interleave;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(interleave('abc', '12345'));
END;
/
