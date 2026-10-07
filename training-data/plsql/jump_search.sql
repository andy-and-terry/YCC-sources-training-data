CREATE OR REPLACE FUNCTION jump_search(p_arr IN SYS.ODCINUMBERLIST, p_target IN NUMBER) RETURN NUMBER IS
    n NUMBER := p_arr.COUNT;
    step NUMBER := TRUNC(SQRT(n));
    block_start NUMBER := 1;
    block_end NUMBER;
BEGIN
    IF step < 1 THEN
        step := 1;
    END IF;
    block_end := LEAST(step, n);
    WHILE block_end < n AND p_arr(block_end) < p_target LOOP
        block_start := block_end + 1;
        block_end := LEAST(block_end + step, n);
        IF block_start > n THEN
            RETURN -1;
        END IF;
    END LOOP;
    FOR i IN block_start..LEAST(block_end, n) LOOP
        IF p_arr(i) = p_target THEN
            RETURN i - 1;
        END IF;
    END LOOP;
    RETURN -1;
END jump_search;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(jump_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15, 17, 19), 13));
    DBMS_OUTPUT.PUT_LINE(jump_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15, 17, 19), 4));
END;
/
