DECLARE
    FUNCTION rle_encode(p_s VARCHAR2) RETURN VARCHAR2 IS
        v_out VARCHAR2(4000);
        v_cnt PLS_INTEGER := 1;
    BEGIN
        FOR i IN 2 .. LENGTH(p_s) + 1 LOOP
            IF i <= LENGTH(p_s) AND SUBSTR(p_s, i, 1) = SUBSTR(p_s, i - 1, 1) THEN
                v_cnt := v_cnt + 1;
            ELSE
                v_out := v_out || v_cnt || SUBSTR(p_s, i - 1, 1);
                v_cnt := 1;
            END IF;
        END LOOP;
        RETURN v_out;
    END;

    FUNCTION rle_decode(p_s VARCHAR2) RETURN VARCHAR2 IS
        v_out VARCHAR2(4000);
        v_num VARCHAR2(10);
        v_ch  VARCHAR2(1);
    BEGIN
        FOR i IN 1 .. LENGTH(p_s) LOOP
            v_ch := SUBSTR(p_s, i, 1);
            IF v_ch BETWEEN '0' AND '9' THEN
                v_num := v_num || v_ch;
            ELSE
                v_out := v_out || RPAD(v_ch, TO_NUMBER(v_num), v_ch);
                v_num := NULL;
            END IF;
        END LOOP;
        RETURN v_out;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(rle_encode('WWWWBBBWWC'));
    DBMS_OUTPUT.PUT_LINE(rle_decode('4W3B2W1C'));
END;
/
