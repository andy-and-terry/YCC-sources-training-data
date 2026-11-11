CREATE OR REPLACE FUNCTION column_title(p_n IN PLS_INTEGER) RETURN VARCHAR2 IS
    n PLS_INTEGER := p_n;
    title VARCHAR2(20) := '';
BEGIN
    WHILE n > 0 LOOP
        n := n - 1;
        title := CHR(65 + MOD(n, 26)) || title;
        n := TRUNC(n / 26);
    END LOOP;
    RETURN title;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(column_title(28) || ' ' || column_title(701)); -- AB ZY
END;
/
