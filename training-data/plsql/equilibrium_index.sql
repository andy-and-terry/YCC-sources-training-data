DECLARE
    TYPE num_list IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    nums  num_list;
    total NUMBER := 0;
    left_sum NUMBER := 0;
    found PLS_INTEGER := -1;
BEGIN
    nums(0) := 1; nums(1) := 7; nums(2) := 3; nums(3) := 6; nums(4) := 5; nums(5) := 6;
    FOR i IN nums.FIRST .. nums.LAST LOOP
        total := total + nums(i);
    END LOOP;
    FOR i IN nums.FIRST .. nums.LAST LOOP
        IF found = -1 AND left_sum = total - left_sum - nums(i) THEN
            found := i;
        END IF;
        left_sum := left_sum + nums(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(found); -- 3
END;
/
