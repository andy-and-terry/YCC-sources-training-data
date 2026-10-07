DECLARE
    PROCEDURE factorize(p_n IN PLS_INTEGER) IS
        n      PLS_INTEGER := p_n;
        p      PLS_INTEGER := 2;
        result VARCHAR2(200);
    BEGIN
        WHILE p * p <= n LOOP
            WHILE MOD(n, p) = 0 LOOP
                result := result || CASE WHEN result IS NULL THEN '' ELSE ' * ' END || p;
                n := n / p;
            END LOOP;
            p := p + 1;
        END LOOP;
        IF n > 1 THEN
            result := result || CASE WHEN result IS NULL THEN '' ELSE ' * ' END || n;
        END IF;
        DBMS_OUTPUT.PUT_LINE(p_n || ' = ' || result);
    END factorize;
BEGIN
    factorize(360);
    factorize(97);
    factorize(1001);
END;
/
