SET SERVEROUTPUT ON

-- Golomb sequence: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
DECLARE
    TYPE num_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    g num_table;
    result VARCHAR2(200) := '1';
BEGIN
    g(1) := 1;
    FOR n IN 2..20 LOOP
        g(n) := 1 + g(n - g(g(n - 1)));
        result := result || ' ' || g(n);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
