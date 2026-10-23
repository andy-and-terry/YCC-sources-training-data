SET SERVEROUTPUT ON

-- Ulam numbers: after 1 and 2, the smallest number that is a sum of
-- two distinct earlier terms in exactly one way
DECLARE
    TYPE int_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    terms int_table;
    found PLS_INTEGER := 2;
    cand PLS_INTEGER := 2;
    ways PLS_INTEGER;
    result VARCHAR2(200);
BEGIN
    terms(1) := 1;
    terms(2) := 2;
    WHILE found < 15 LOOP
        cand := cand + 1;
        ways := 0;
        FOR a IN 1..found LOOP
            FOR b IN a + 1..found LOOP
                IF terms(a) + terms(b) = cand THEN
                    ways := ways + 1;
                END IF;
            END LOOP;
        END LOOP;
        IF ways = 1 THEN
            found := found + 1;
            terms(found) := cand;
        END IF;
    END LOOP;
    FOR k IN 1..found LOOP
        result := result || CASE WHEN k > 1 THEN ' ' END || terms(k);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
