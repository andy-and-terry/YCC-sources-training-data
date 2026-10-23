SET SERVEROUTPUT ON

-- Van Eck's sequence: next term is the distance since the last term
-- previously appeared, or 0 if it is new
DECLARE
    TYPE int_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    seq int_table;
    result VARCHAR2(200) := '0';
BEGIN
    seq(0) := 0;
    FOR n IN 1..19 LOOP
        seq(n) := 0;
        FOR k IN REVERSE 0..n - 2 LOOP
            IF seq(k) = seq(n - 1) THEN
                seq(n) := n - 1 - k;
                EXIT;
            END IF;
        END LOOP;
        result := result || ' ' || seq(n);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
