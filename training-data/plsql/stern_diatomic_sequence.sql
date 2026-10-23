SET SERVEROUTPUT ON

-- Stern's diatomic sequence: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
DECLARE
    TYPE int_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    s int_table;
    result VARCHAR2(200) := '0 1';
BEGIN
    s(0) := 0;
    s(1) := 1;
    FOR n IN 2..19 LOOP
        IF MOD(n, 2) = 0 THEN
            s(n) := s(n / 2);
        ELSE
            s(n) := s(TRUNC(n / 2)) + s(TRUNC(n / 2) + 1);
        END IF;
        result := result || ' ' || s(n);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
