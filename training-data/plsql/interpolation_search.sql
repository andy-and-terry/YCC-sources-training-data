CREATE OR REPLACE FUNCTION interpolation_search(p_arr IN SYS.ODCINUMBERLIST, p_target IN NUMBER) RETURN NUMBER IS
    lo NUMBER := 1;
    hi NUMBER := p_arr.COUNT;
    pos NUMBER;
BEGIN
    WHILE lo <= hi AND p_target >= p_arr(lo) AND p_target <= p_arr(hi) LOOP
        IF p_arr(hi) = p_arr(lo) THEN
            IF p_arr(lo) = p_target THEN
                RETURN lo - 1;
            END IF;
            RETURN -1;
        END IF;
        pos := lo + FLOOR((p_target - p_arr(lo)) * (hi - lo) / (p_arr(hi) - p_arr(lo)));
        IF p_arr(pos) = p_target THEN
            RETURN pos - 1;
        ELSIF p_arr(pos) < p_target THEN
            lo := pos + 1;
        ELSE
            hi := pos - 1;
        END IF;
    END LOOP;
    RETURN -1;
END interpolation_search;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(interpolation_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15), 9));
    DBMS_OUTPUT.PUT_LINE(interpolation_search(SYS.ODCINUMBERLIST(1, 3, 5, 7, 9, 11, 13, 15), 4));
END;
/
