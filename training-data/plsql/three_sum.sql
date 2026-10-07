DECLARE
    TYPE num_array IS TABLE OF NUMBER;
    nums num_array := num_array(-1, 0, 1, 2, -1, -4);
    n NUMBER := nums.COUNT;
    tmp NUMBER;
    left_ NUMBER;
    right_ NUMBER;
    total NUMBER;
BEGIN
    FOR i IN 1..n - 1 LOOP
        FOR j IN 1..n - i LOOP
            IF nums(j) > nums(j + 1) THEN
                tmp := nums(j);
                nums(j) := nums(j + 1);
                nums(j + 1) := tmp;
            END IF;
        END LOOP;
    END LOOP;

    FOR i IN 1..n - 2 LOOP
        IF i = 1 OR nums(i) != nums(i - 1) THEN
            left_ := i + 1;
            right_ := n;
            WHILE left_ < right_ LOOP
                total := nums(i) + nums(left_) + nums(right_);
                IF total = 0 THEN
                    DBMS_OUTPUT.PUT_LINE(nums(i) || ' ' || nums(left_) || ' ' || nums(right_));
                    left_ := left_ + 1;
                    right_ := right_ - 1;
                ELSIF total < 0 THEN
                    left_ := left_ + 1;
                ELSE
                    right_ := right_ - 1;
                END IF;
            END LOOP;
        END IF;
    END LOOP;
END;
/
