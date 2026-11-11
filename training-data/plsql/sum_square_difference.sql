-- Square of the sum minus sum of squares for 1..10 (expect 2640)
SET SERVEROUTPUT ON;

DECLARE
    total   NUMBER := 0;
    squares NUMBER := 0;
BEGIN
    FOR i IN 1 .. 10 LOOP
        total := total + i;
        squares := squares + i * i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(total * total - squares);
END;
/
