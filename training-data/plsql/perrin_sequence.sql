-- Perrin sequence P(n)=P(n-2)+P(n-3)
SET SERVEROUTPUT ON;

DECLARE
    TYPE num_list IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v num_list;
BEGIN
    v(0) := 3; v(1) := 0; v(2) := 2;
    FOR i IN 3 .. 9 LOOP
        v(i) := v(i - 2) + v(i - 3);
    END LOOP;
    FOR i IN 0 .. 9 LOOP
        DBMS_OUTPUT.PUT(v(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
