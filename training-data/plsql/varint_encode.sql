DECLARE
    n NUMBER := 300;
BEGIN
    WHILE n >= 128 LOOP
        DBMS_OUTPUT.PUT(TO_CHAR(MOD(n, 128) + 128, 'FMXX') || ' ');
        n := TRUNC(n / 128);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, 'FMXX'));
END;
/
