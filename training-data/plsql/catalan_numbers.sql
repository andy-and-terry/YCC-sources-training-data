CREATE OR REPLACE FUNCTION catalan(p_n IN NUMBER) RETURN NUMBER IS
    total NUMBER := 0;
BEGIN
    IF p_n <= 1 THEN
        RETURN 1;
    END IF;
    FOR i IN 0..p_n - 1 LOOP
        total := total + catalan(i) * catalan(p_n - 1 - i);
    END LOOP;
    RETURN total;
END catalan;
/

DECLARE
    line VARCHAR2(200) := '';
BEGIN
    FOR i IN 0..7 LOOP
        line := line || catalan(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(line);
END;
/
