DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR i IN 1 .. 10 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        v_sum := v_sum + i;
        DBMS_OUTPUT.PUT_LINE('adding ' || i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('sum of odds = ' || v_sum);
END;
/
