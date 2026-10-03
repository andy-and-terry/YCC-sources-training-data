DECLARE
    TYPE row_type IS TABLE OF NUMBER;
    matrix row_type := row_type(1, 2, 3, 4, 5, 6, 7, 8, 9); -- 3x3, row-major
    rows NUMBER := 3;
    cols NUMBER := 3;
    top NUMBER := 0;
    bottom NUMBER := rows - 1;
    left_ NUMBER := 0;
    right_ NUMBER := cols - 1;
    line VARCHAR2(200) := '';

    FUNCTION at_(r IN NUMBER, c IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN matrix(r * cols + c + 1);
    END at_;
BEGIN
    WHILE top <= bottom AND left_ <= right_ LOOP
        FOR c IN left_..right_ LOOP
            line := line || at_(top, c) || ' ';
        END LOOP;
        top := top + 1;
        FOR r IN top..bottom LOOP
            line := line || at_(r, right_) || ' ';
        END LOOP;
        right_ := right_ - 1;
        IF top <= bottom THEN
            FOR c IN REVERSE left_..right_ LOOP
                line := line || at_(bottom, c) || ' ';
            END LOOP;
            bottom := bottom - 1;
        END IF;
        IF left_ <= right_ THEN
            FOR r IN REVERSE top..bottom LOOP
                line := line || at_(r, left_) || ' ';
            END LOOP;
            left_ := left_ + 1;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(line);
END;
/
