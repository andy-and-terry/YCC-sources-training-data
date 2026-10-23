SET SERVEROUTPUT ON

-- Recaman sequence: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
DECLARE
    TYPE flag_table IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    seen flag_table;
    cur PLS_INTEGER := 0;
    next_val PLS_INTEGER;
    result VARCHAR2(200) := '0';
BEGIN
    seen(0) := TRUE;
    FOR i IN 1..19 LOOP
        next_val := cur - i;
        IF next_val < 0 OR seen.EXISTS(next_val) THEN
            next_val := cur + i;
        END IF;
        seen(next_val) := TRUE;
        cur := next_val;
        result := result || ' ' || cur;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
