CREATE OR REPLACE TYPE word_list AS TABLE OF VARCHAR2(50);
/

CREATE OR REPLACE FUNCTION word_break(p_str IN VARCHAR2, p_dict IN word_list) RETURN VARCHAR2 IS
    TYPE word_set IS TABLE OF BOOLEAN INDEX BY VARCHAR2(50);
    TYPE bool_table IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    dict_set word_set;
    dp bool_table;
    n NUMBER := LENGTH(p_str);
BEGIN
    FOR i IN 1..p_dict.COUNT LOOP
        dict_set(p_dict(i)) := TRUE;
    END LOOP;
    dp(0) := TRUE;
    FOR i IN 1..n LOOP
        dp(i) := FALSE;
        FOR j IN 0..i - 1 LOOP
            IF dp(j) AND dict_set.EXISTS(SUBSTR(p_str, j + 1, i - j)) THEN
                dp(i) := TRUE;
                EXIT;
            END IF;
        END LOOP;
    END LOOP;
    IF dp(n) THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;
END word_break;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(word_break('leetcode', word_list('leet', 'code', 'cats', 'and', 'sand', 'dog')));
    DBMS_OUTPUT.PUT_LINE(word_break('catsanddog', word_list('leet', 'code', 'cats', 'and', 'sand', 'dog')));
    DBMS_OUTPUT.PUT_LINE(word_break('catsandwolf', word_list('leet', 'code', 'cats', 'and', 'sand', 'dog')));
END;
/
