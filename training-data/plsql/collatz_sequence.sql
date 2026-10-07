CREATE OR REPLACE FUNCTION collatz_steps(p_n IN PLS_INTEGER) RETURN PLS_INTEGER IS
    n     PLS_INTEGER := p_n;
    steps PLS_INTEGER := 0;
BEGIN
    WHILE n <> 1 LOOP
        IF MOD(n, 2) = 0 THEN
            n := n / 2;
        ELSE
            n := 3 * n + 1;
        END IF;
        steps := steps + 1;
    END LOOP;
    RETURN steps;
END collatz_steps;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('27 takes ' || collatz_steps(27) || ' steps');
    DBMS_OUTPUT.PUT_LINE('6 takes ' || collatz_steps(6) || ' steps');
END;
/
