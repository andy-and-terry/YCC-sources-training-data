CREATE OR REPLACE FUNCTION factorial(n IN NUMBER) RETURN NUMBER IS
    result NUMBER := 1;
BEGIN
    FOR i IN 1..n LOOP
        result := result * i;
    END LOOP;
    RETURN result;
END factorial;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(factorial(5));
END;
/
