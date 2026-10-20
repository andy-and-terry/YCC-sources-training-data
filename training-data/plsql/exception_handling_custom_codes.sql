DECLARE
    e_negative EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_negative, -20001);
    FUNCTION safe_div(a NUMBER, b NUMBER) RETURN NUMBER IS
    BEGIN
        IF a < 0 THEN RAISE_APPLICATION_ERROR(-20001, 'negative input'); END IF;
        RETURN a / b;
    END;
BEGIN
    FOR t IN (SELECT 10 a, 2 b FROM dual UNION ALL SELECT 1, 0 FROM dual UNION ALL SELECT -1, 1 FROM dual) LOOP
        BEGIN
            DBMS_OUTPUT.PUT_LINE('result ' || safe_div(t.a, t.b));
        EXCEPTION
            WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('division by zero');
            WHEN e_negative THEN DBMS_OUTPUT.PUT_LINE('custom: ' || SQLERRM);
            WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('other ' || SQLCODE);
        END;
    END LOOP;
    BEGIN
        DECLARE v NUMBER; BEGIN SELECT 1 INTO v FROM dual WHERE 1 = 0; END;
    EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('no data');
    END;
END;
/
