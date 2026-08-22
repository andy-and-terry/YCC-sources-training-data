CREATE OR REPLACE FUNCTION is_prime(n IN NUMBER) RETURN BOOLEAN IS
    i NUMBER := 2;
BEGIN
    IF n < 2 THEN
        RETURN FALSE;
    END IF;
    WHILE i * i <= n LOOP
        IF MOD(n, i) = 0 THEN
            RETURN FALSE;
        END IF;
        i := i + 1;
    END LOOP;
    RETURN TRUE;
END is_prime;
/
