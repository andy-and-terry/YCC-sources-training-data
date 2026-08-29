CREATE OR REPLACE PROCEDURE fizzbuzz(p_n IN NUMBER) IS
BEGIN
    FOR i IN 1..p_n LOOP
        IF MOD(i, 15) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('FizzBuzz');
        ELSIF MOD(i, 3) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Fizz');
        ELSIF MOD(i, 5) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Buzz');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END fizzbuzz;
/
