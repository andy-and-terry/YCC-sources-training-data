SET SERVEROUTPUT ON

-- Next term: smallest value with exactly one representation as a sum of two distinct terms
DECLARE
    TYPE num_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    u num_list;
    n PLS_INTEGER := 2;
    cand PLS_INTEGER := 2;
    ways PLS_INTEGER;
    result VARCHAR2(200);
BEGIN
    u(1) := 1;
    u(2) := 2;
    WHILE n < 15 LOOP
        cand := cand + 1;
        ways := 0;
        FOR a IN 1..n LOOP
            FOR b IN a + 1..n LOOP
                IF u(a) + u(b) = cand THEN
                    ways := ways + 1;
                END IF;
            END LOOP;
        END LOOP;
        IF ways = 1 THEN
            n := n + 1;
            u(n) := cand;
        END IF;
    END LOOP;
    FOR i IN 1..n LOOP
        result := result || CASE WHEN i > 1 THEN ' ' END || u(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
