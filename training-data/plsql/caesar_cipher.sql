-- Caesar cipher: shift each letter by p_shift positions within its case,
-- leaving non-letters untouched. Encoding and decoding use opposite shifts.
CREATE OR REPLACE FUNCTION caesar_encode(p_text IN VARCHAR2, p_shift IN PLS_INTEGER) RETURN VARCHAR2 IS
    v_result VARCHAR2(4000) := '';
    v_ch     CHAR(1);
    v_code   PLS_INTEGER;
    v_base   PLS_INTEGER;
BEGIN
    FOR i IN 1..LENGTH(p_text) LOOP
        v_ch := SUBSTR(p_text, i, 1);
        IF v_ch BETWEEN 'A' AND 'Z' THEN
            v_base := ASCII('A');
        ELSIF v_ch BETWEEN 'a' AND 'z' THEN
            v_base := ASCII('a');
        ELSE
            v_result := v_result || v_ch;
            CONTINUE;
        END IF;
        v_code := MOD(ASCII(v_ch) - v_base + p_shift, 26);
        IF v_code < 0 THEN
            v_code := v_code + 26;
        END IF;
        v_result := v_result || CHR(v_base + v_code);
    END LOOP;
    RETURN v_result;
END caesar_encode;
/

DECLARE
    v_plain   VARCHAR2(100) := 'Attack at Dawn!';
    v_encoded VARCHAR2(100);
    v_decoded VARCHAR2(100);
BEGIN
    v_encoded := caesar_encode(v_plain, 3);
    v_decoded := caesar_encode(v_encoded, -3);
    DBMS_OUTPUT.PUT_LINE('plain:   ' || v_plain);
    DBMS_OUTPUT.PUT_LINE('encoded: ' || v_encoded);
    DBMS_OUTPUT.PUT_LINE('decoded: ' || v_decoded);
END;
/
