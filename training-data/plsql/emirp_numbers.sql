CREATE OR REPLACE FUNCTION is_prime(p_n IN NUMBER) RETURN NUMBER IS
BEGIN
    IF p_n < 2 THEN RETURN 0; END IF;
    FOR i IN 2..FLOOR(SQRT(p_n)) LOOP
        IF MOD(p_n, i) = 0 THEN RETURN 0; END IF;
    END LOOP;
    RETURN 1;
END is_prime;
/

CREATE OR REPLACE FUNCTION reverse_number(p_n IN NUMBER) RETURN NUMBER IS
    v_s VARCHAR2(20) := TO_CHAR(p_n);
    v_r VARCHAR2(20) := '';
BEGIN
    FOR i IN REVERSE 1..LENGTH(v_s) LOOP
        v_r := v_r || SUBSTR(v_s, i, 1);
    END LOOP;
    RETURN TO_NUMBER(v_r);
END reverse_number;
/

BEGIN
    FOR p IN 2..199 LOOP
        IF reverse_number(p) <> p AND is_prime(p) = 1 AND is_prime(reverse_number(p)) = 1 THEN
            DBMS_OUTPUT.PUT(p || ' ');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE; -- 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
END;
/
