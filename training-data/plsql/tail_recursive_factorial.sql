CREATE OR REPLACE FUNCTION factorial(p_n IN NUMBER) RETURN NUMBER IS
    result NUMBER := 1;
BEGIN
    FOR i IN 1..p_n LOOP
        result := result * i;
    END LOOP;
    RETURN result;
END factorial;
/
