CREATE OR REPLACE PROCEDURE sieve_of_eratosthenes(p_limit IN NUMBER) IS
    TYPE bool_table IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    is_composite bool_table;
    i PLS_INTEGER;
    j PLS_INTEGER;
BEGIN
    i := 2;
    WHILE i * i <= p_limit LOOP
        IF NOT NVL(is_composite(i), FALSE) THEN
            j := i * i;
            WHILE j <= p_limit LOOP
                is_composite(j) := TRUE;
                j := j + i;
            END LOOP;
        END IF;
        i := i + 1;
    END LOOP;
    FOR n IN 2..p_limit LOOP
        IF NOT NVL(is_composite(n), FALSE) THEN
            DBMS_OUTPUT.PUT_LINE(n);
        END IF;
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
END sieve_of_eratosthenes;
/
