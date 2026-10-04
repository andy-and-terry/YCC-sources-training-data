CREATE OR REPLACE FUNCTION slow_square(p_n NUMBER) RETURN NUMBER
    RESULT_CACHE
    DETERMINISTIC
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('computing ' || p_n);
    RETURN p_n * p_n;
END;
/

DECLARE
    total NUMBER := 0;
BEGIN
    FOR i IN 1 .. 3 LOOP
        total := total + slow_square(4);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('total: ' || total);

    SELECT SUM(slow_square(level)) INTO total FROM dual CONNECT BY level <= 5;
    DBMS_OUTPUT.PUT_LINE('sum of squares 1..5: ' || total);
END;
/
