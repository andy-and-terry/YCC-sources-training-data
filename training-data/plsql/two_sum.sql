CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE two_sum(nums IN int_table, p_target IN NUMBER) IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    seen num_table;
    complement NUMBER;
BEGIN
    FOR i IN 1..nums.COUNT LOOP
        complement := p_target - nums(i);
        BEGIN
            DBMS_OUTPUT.PUT_LINE(seen(complement) || ' ' || i);
            RETURN;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                seen(nums(i)) := i;
        END;
    END LOOP;
END two_sum;
/
