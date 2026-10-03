CREATE OR REPLACE FUNCTION ternary_search(p_arr IN SYS.ODCINUMBERLIST, p_target IN NUMBER) RETURN NUMBER IS
    lo NUMBER := 1;
    hi NUMBER := p_arr.COUNT;
    third NUMBER;
    m1 NUMBER;
    m2 NUMBER;
BEGIN
    WHILE lo <= hi LOOP
        third := TRUNC((hi - lo) / 3);
        m1 := lo + third;
        m2 := hi - third;
        IF p_arr(m1) = p_target THEN
            RETURN m1 - 1;
        END IF;
        IF p_arr(m2) = p_target THEN
            RETURN m2 - 1;
        END IF;
        IF p_target < p_arr(m1) THEN
            hi := m1 - 1;
        ELSIF p_target > p_arr(m2) THEN
            lo := m2 + 1;
        ELSE
            lo := m1 + 1;
            hi := m2 - 1;
        END IF;
    END LOOP;
    RETURN -1;
END ternary_search;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(ternary_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15), 9));
    DBMS_OUTPUT.PUT_LINE(ternary_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15), 4));
END;
/
