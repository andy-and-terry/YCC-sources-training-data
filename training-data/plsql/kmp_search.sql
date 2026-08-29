CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION build_lps(p_pattern IN VARCHAR2) RETURN int_table IS
    n NUMBER := LENGTH(p_pattern);
    lps int_table := int_table();
    len_val NUMBER := 0;
    i NUMBER := 2;
BEGIN
    lps.EXTEND(n);
    lps(1) := 0;
    WHILE i <= n LOOP
        IF SUBSTR(p_pattern, i, 1) = SUBSTR(p_pattern, len_val + 1, 1) THEN
            len_val := len_val + 1;
            lps(i) := len_val;
            i := i + 1;
        ELSIF len_val != 0 THEN
            len_val := lps(len_val);
        ELSE
            lps(i) := 0;
            i := i + 1;
        END IF;
    END LOOP;
    RETURN lps;
END build_lps;
/

CREATE OR REPLACE FUNCTION kmp_search(p_text IN VARCHAR2, p_pattern IN VARCHAR2) RETURN NUMBER IS
    lps int_table := build_lps(p_pattern);
    n NUMBER := LENGTH(p_text);
    m NUMBER := LENGTH(p_pattern);
    i NUMBER := 1;
    j NUMBER := 1;
BEGIN
    WHILE i <= n LOOP
        IF SUBSTR(p_text, i, 1) = SUBSTR(p_pattern, j, 1) THEN
            i := i + 1;
            j := j + 1;
            IF j > m THEN
                RETURN i - j;
            END IF;
        ELSIF j > 1 THEN
            j := lps(j - 1) + 1;
        ELSE
            i := i + 1;
        END IF;
    END LOOP;
    RETURN -1;
END kmp_search;
/
