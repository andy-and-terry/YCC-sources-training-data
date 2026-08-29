CREATE OR REPLACE PROCEDURE word_frequency(p_text IN VARCHAR2) IS
    TYPE freq_table IS TABLE OF NUMBER INDEX BY VARCHAR2(50);
    freq freq_table;
    word VARCHAR2(50);
    pos NUMBER := 1;
    lowered VARCHAR2(500) := LOWER(p_text);
BEGIN
    FOR w IN (SELECT REGEXP_SUBSTR(lowered, '[^ ]+', 1, LEVEL) AS token
              FROM DUAL
              CONNECT BY REGEXP_SUBSTR(lowered, '[^ ]+', 1, LEVEL) IS NOT NULL) LOOP
        BEGIN
            freq(w.token) := freq(w.token) + 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                freq(w.token) := 1;
        END;
    END LOOP;
    word := freq.FIRST;
    WHILE word IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(word || ': ' || freq(word));
        word := freq.NEXT(word);
    END LOOP;
END word_frequency;
/
