DECLARE
    TYPE num_list IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    h num_list;
    lo PLS_INTEGER := 1;
    hi PLS_INTEGER := 9;
    best NUMBER := 0;
BEGIN
    h(1) := 1; h(2) := 8; h(3) := 6; h(4) := 2; h(5) := 5;
    h(6) := 4; h(7) := 8; h(8) := 3; h(9) := 7;
    WHILE lo < hi LOOP
        best := GREATEST(best, LEAST(h(lo), h(hi)) * (hi - lo));
        IF h(lo) < h(hi) THEN lo := lo + 1; ELSE hi := hi - 1; END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(best); -- 49
END;
/
