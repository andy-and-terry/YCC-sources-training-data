CREATE OR REPLACE FUNCTION rot47(s IN VARCHAR2) RETURN VARCHAR2 IS
    result VARCHAR2(4000) := '';
    n      PLS_INTEGER;
BEGIN
    FOR i IN 1 .. LENGTH(s) LOOP
        n := ASCII(SUBSTR(s, i, 1));
        IF n BETWEEN 33 AND 126 THEN
            n := 33 + MOD(n - 33 + 47, 94);
        END IF;
        result := result || CHR(n);
    END LOOP;
    RETURN result;
END rot47;
/
