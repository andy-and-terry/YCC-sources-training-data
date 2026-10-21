-- Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
SET SERVEROUTPUT ON
DECLARE
    TYPE num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    p   num_tab;
    out VARCHAR2(200);
BEGIN
    FOR i IN 0 .. 14 LOOP
        IF i < 3 THEN
            p(i) := 1;
        ELSE
            p(i) := p(i - 2) + p(i - 3);
        END IF;
        out := out || p(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
