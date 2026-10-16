DECLARE
    FUNCTION vigenere(p_text VARCHAR2, p_key VARCHAR2, p_dir PLS_INTEGER) RETURN VARCHAR2 IS
        v_out VARCHAR2(4000);
        v_ki  PLS_INTEGER := 0;
        v_ch  PLS_INTEGER;
        v_sh  PLS_INTEGER;
    BEGIN
        FOR i IN 1 .. LENGTH(p_text) LOOP
            v_ch := ASCII(UPPER(SUBSTR(p_text, i, 1)));
            IF v_ch BETWEEN 65 AND 90 THEN
                v_sh := ASCII(UPPER(SUBSTR(p_key, MOD(v_ki, LENGTH(p_key)) + 1, 1))) - 65;
                v_out := v_out || CHR(MOD(v_ch - 65 + p_dir * v_sh + 26, 26) + 65);
                v_ki := v_ki + 1;
            ELSE
                v_out := v_out || CHR(v_ch);
            END IF;
        END LOOP;
        RETURN v_out;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vigenere('ATTACK AT DAWN', 'LEMON', 1));
    DBMS_OUTPUT.PUT_LINE(vigenere('LXFOPV EF RNHR', 'LEMON', -1));
END;
/
