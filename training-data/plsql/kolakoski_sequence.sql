SET SERVEROUTPUT ON

-- Kolakoski sequence: a sequence of 1s and 2s that describes its own run lengths
DECLARE
    TYPE int_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    seq int_table;
    len PLS_INTEGER := 3;
    i PLS_INTEGER := 3; -- index of the term giving the next run length
    symbol PLS_INTEGER;
    result VARCHAR2(200);
BEGIN
    seq(1) := 1;
    seq(2) := 2;
    seq(3) := 2;
    WHILE len < 20 LOOP
        symbol := CASE MOD(i, 2) WHEN 1 THEN 1 ELSE 2 END;
        FOR j IN 1..seq(i) LOOP
            len := len + 1;
            seq(len) := symbol;
        END LOOP;
        i := i + 1;
    END LOOP;
    FOR k IN 1..20 LOOP
        result := result || CASE WHEN k > 1 THEN ' ' END || seq(k);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
