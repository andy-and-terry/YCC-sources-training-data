-- Three forms of CASE: a searched CASE expression (independent boolean
-- conditions), a simple CASE expression (one selector matched against a
-- list of values), and a CASE statement (each branch runs statements).
DECLARE
    TYPE grade_list IS TABLE OF NUMBER;
    v_scores grade_list := grade_list(95, 82, 71, 60, 45);
    v_grade  VARCHAR2(2);
BEGIN
    FOR i IN 1..v_scores.COUNT LOOP
        v_grade := CASE
                       WHEN v_scores(i) >= 90 THEN 'A'
                       WHEN v_scores(i) >= 80 THEN 'B'
                       WHEN v_scores(i) >= 70 THEN 'C'
                       WHEN v_scores(i) >= 60 THEN 'D'
                       ELSE 'F'
                   END;
        DBMS_OUTPUT.PUT_LINE(v_scores(i) || ' -> ' || v_grade);
    END LOOP;

    FOR d IN 1..7 LOOP
        DBMS_OUTPUT.PUT_LINE('day ' || d || ' is ' ||
            CASE d
                WHEN 1 THEN 'Monday'
                WHEN 6 THEN 'Saturday'
                WHEN 7 THEN 'Sunday'
                ELSE 'a weekday'
            END);
    END LOOP;

    DECLARE
        v_status NUMBER := 2;
    BEGIN
        CASE v_status
            WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('status: new');
            WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('status: active');
            WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('status: closed');
            ELSE DBMS_OUTPUT.PUT_LINE('status: unknown');
        END CASE;
    END;
END;
/
