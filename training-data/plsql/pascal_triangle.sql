DECLARE
    TYPE row_t IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    prev row_t;
    curr row_t;
    line VARCHAR2(200);
BEGIN
    FOR r IN 0 .. 5 LOOP
        line := '';
        FOR c IN 0 .. r LOOP
            IF c = 0 OR c = r THEN
                curr(c) := 1;
            ELSE
                curr(c) := prev(c - 1) + prev(c);
            END IF;
            line := line || curr(c) || ' ';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(RTRIM(line));
        prev := curr;
    END LOOP;
END;
/
