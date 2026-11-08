CREATE OR REPLACE PROCEDURE hanoi(n IN NUMBER, a IN VARCHAR2, b IN VARCHAR2, c IN VARCHAR2) IS
BEGIN
    IF n = 0 THEN
        RETURN;
    END IF;
    hanoi(n - 1, a, c, b);
    DBMS_OUTPUT.PUT_LINE(a || '->' || c);
    hanoi(n - 1, b, a, c);
END hanoi;
/
