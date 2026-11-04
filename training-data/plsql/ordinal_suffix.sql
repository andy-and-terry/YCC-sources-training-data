CREATE OR REPLACE FUNCTION ordinal (p_n IN PLS_INTEGER) RETURN VARCHAR2 IS
    v_r100 PLS_INTEGER := MOD(p_n, 100);
    v_suffix VARCHAR2(2);
BEGIN
    IF v_r100 BETWEEN 11 AND 13 THEN
        v_suffix := 'th';
    ELSE
        v_suffix := CASE MOD(p_n, 10)
                        WHEN 1 THEN 'st'
                        WHEN 2 THEN 'nd'
                        WHEN 3 THEN 'rd'
                        ELSE 'th'
                    END;
    END IF;
    RETURN p_n || v_suffix;
END ordinal;
/

BEGIN
    FOR n IN (SELECT column_value AS v FROM TABLE(SYS.ODCINUMBERLIST(1, 2, 3, 4, 11, 12, 13, 21))) LOOP
        DBMS_OUTPUT.PUT(ordinal(n.v) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
