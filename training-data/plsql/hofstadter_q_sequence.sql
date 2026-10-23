SET SERVEROUTPUT ON

-- Hofstadter Q sequence: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
DECLARE
    TYPE num_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    q num_table;
    result VARCHAR2(200) := '1 1';
BEGIN
    q(1) := 1;
    q(2) := 1;
    FOR n IN 3..20 LOOP
        q(n) := q(n - q(n - 1)) + q(n - q(n - 2));
        result := result || ' ' || q(n);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
