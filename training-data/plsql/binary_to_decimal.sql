CREATE OR REPLACE FUNCTION binary_to_decimal(p_str IN VARCHAR2) RETURN NUMBER IS
BEGIN
    RETURN TO_NUMBER(p_str, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'NLS_NUMERIC_CHARACTERS=''.,''')
      + 0; -- placeholder, actual conversion done via loop below
END binary_to_decimal;
/

CREATE OR REPLACE FUNCTION binary_to_decimal_loop(p_str IN VARCHAR2) RETURN NUMBER IS
    result NUMBER := 0;
BEGIN
    FOR i IN 1..LENGTH(p_str) LOOP
        result := result * 2 + TO_NUMBER(SUBSTR(p_str, i, 1));
    END LOOP;
    RETURN result;
END binary_to_decimal_loop;
/
