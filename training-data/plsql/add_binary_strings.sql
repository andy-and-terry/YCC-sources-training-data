CREATE OR REPLACE FUNCTION add_binary(a IN VARCHAR2, b IN VARCHAR2) RETURN VARCHAR2 IS
    i PLS_INTEGER := LENGTH(a);
    j PLS_INTEGER := LENGTH(b);
    carry PLS_INTEGER := 0;
    s PLS_INTEGER;
    result VARCHAR2(100) := '';
BEGIN
    WHILE i > 0 OR j > 0 OR carry > 0 LOOP
        s := carry;
        IF i > 0 THEN s := s + TO_NUMBER(SUBSTR(a, i, 1)); i := i - 1; END IF;
        IF j > 0 THEN s := s + TO_NUMBER(SUBSTR(b, j, 1)); j := j - 1; END IF;
        result := MOD(s, 2) || result;
        carry := TRUNC(s / 2);
    END LOOP;
    RETURN result;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(add_binary('1010', '1011')); -- 10101
END;
/
