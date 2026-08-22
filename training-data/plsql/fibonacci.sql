CREATE OR REPLACE FUNCTION fibonacci(n IN NUMBER) RETURN VARCHAR2 IS
    a NUMBER := 0;
    b NUMBER := 1;
    temp NUMBER;
    result VARCHAR2(4000) := '';
BEGIN
    FOR i IN 1..n LOOP
        result := result || a || ' ';
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
    RETURN result;
END fibonacci;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(fibonacci(11));
END;
/
