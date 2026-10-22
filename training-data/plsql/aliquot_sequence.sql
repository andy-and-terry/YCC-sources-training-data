SET SERVEROUTPUT ON

-- Repeatedly replace n by the sum of its proper divisors until 0
DECLARE
    n PLS_INTEGER := 12;
    total PLS_INTEGER;
    result VARCHAR2(200) := '12';
BEGIN
    WHILE n > 0 LOOP
        total := 0;
        FOR d IN 1..TRUNC(n / 2) LOOP
            IF MOD(n, d) = 0 THEN
                total := total + d;
            END IF;
        END LOOP;
        n := total;
        result := result || ' ' || n;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
