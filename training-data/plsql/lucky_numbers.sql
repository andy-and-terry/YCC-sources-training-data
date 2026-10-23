SET SERVEROUTPUT ON

-- Lucky numbers below 100: start with the odd numbers, then delete every
-- k-th survivor, where k is the next surviving number
DECLARE
    TYPE int_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    nums int_table;
    len PLS_INTEGER := 0;
    idx PLS_INTEGER := 2;
    k PLS_INTEGER;
    kept PLS_INTEGER;
    result VARCHAR2(400);
BEGIN
    FOR n IN 1..99 LOOP
        IF MOD(n, 2) = 1 THEN
            len := len + 1;
            nums(len) := n;
        END IF;
    END LOOP;
    WHILE idx <= len AND nums(idx) <= len LOOP
        k := nums(idx);
        kept := 0;
        FOR p IN 1..len LOOP
            IF MOD(p, k) != 0 THEN
                kept := kept + 1;
                nums(kept) := nums(p);
            END IF;
        END LOOP;
        len := kept;
        idx := idx + 1;
    END LOOP;
    FOR p IN 1..len LOOP
        result := result || CASE WHEN p > 1 THEN ' ' END || nums(p);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
