DECLARE
    v_n NUMBER := 12345;
    v_rev NUMBER := 0;
BEGIN
    WHILE v_n > 0 LOOP
        v_rev := v_rev * 10 + MOD(v_n, 10);
        v_n := TRUNC(v_n / 10);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('reversed = ' || v_rev);
END;
/
