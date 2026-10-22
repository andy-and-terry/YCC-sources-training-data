SET SERVEROUTPUT ON

-- Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
DECLARE
    TYPE row_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE grid_type IS TABLE OF row_type INDEX BY PLS_INTEGER;
    d grid_type;
    result VARCHAR2(200);
BEGIN
    FOR m IN 0..9 LOOP
        FOR n IN 0..9 LOOP
            IF m = 0 OR n = 0 THEN
                d(m)(n) := 1;
            ELSE
                d(m)(n) := d(m - 1)(n) + d(m)(n - 1) + d(m - 1)(n - 1);
            END IF;
        END LOOP;
        result := result || CASE WHEN m > 0 THEN ' ' END || d(m)(m);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
