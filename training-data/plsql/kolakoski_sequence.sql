SET SERVEROUTPUT ON

-- Kolakoski over {1, 2}: the run lengths of the sequence describe itself
DECLARE
    TYPE num_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    s num_list;
    len PLS_INTEGER := 3;
    idx PLS_INTEGER := 3;
    sym PLS_INTEGER;
    result VARCHAR2(200);
BEGIN
    s(1) := 1;
    s(2) := 2;
    s(3) := 2;
    WHILE len < 20 LOOP
        sym := 3 - s(len);
        FOR k IN 1..s(idx) LOOP
            len := len + 1;
            s(len) := sym;
        END LOOP;
        idx := idx + 1;
    END LOOP;
    FOR i IN 1..20 LOOP
        result := result || CASE WHEN i > 1 THEN ' ' END || s(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
