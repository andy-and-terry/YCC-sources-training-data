CREATE OR REPLACE FUNCTION climb_stairs(p_n IN NUMBER) RETURN NUMBER IS
    a NUMBER := 1;
    b NUMBER := 2;
    c NUMBER;
BEGIN
    IF p_n <= 2 THEN
        RETURN p_n;
    END IF;
    FOR i IN 3..p_n LOOP
        c := a + b;
        a := b;
        b := c;
    END LOOP;
    RETURN b;
END climb_stairs;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(climb_stairs(5));
    DBMS_OUTPUT.PUT_LINE(climb_stairs(10));
END;
/
